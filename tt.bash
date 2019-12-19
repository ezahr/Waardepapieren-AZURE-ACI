#!/bin/bash
# //////////////////////////////////////////////////////////////////////////////////////////
#    File Type   :- BASH Script (needs docker and docker-composeenvironment installed)
#  
#    Description :- This script makes a backup using export tool (oracle)
#    Modified           Date            Description
#    --------           --------        -------------------------------------------------
#    Peter Bosch       05.12.2019      Initial version.
#
# //////////////////////////////////////////////////////////////////////////////////////////
# File:            :wpprod_env.bash
# version          :20191204 v0
# File Type        :Bash 
# Purpose          :build waardepapieren Docker introductie.      
# Title:           :
# Category         :Discipl container deploy script.
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI 

#'big thanks to pim Otte ,stef van Leeuwen Wigo4it vincent van der laar.  


### barf  
enter_cont() {
    echo
    echo
    echo -n "Press enter to Continue"
    read
}


create_azure_container_group() {
echo "running create_azure_container_group" 
cd $PROJECT_DIR
az container create --resource-group $AZ_RESOURCE_GROUP --file deploy-aci.yaml
# https://docs.microsoft.com/en-us/azure/container-instances/container-instances-multi-container-yaml
# View deployment state
# az container show --resource-group $AZ_RESOURCE_GROUP  --name myContainerGroup --output table
}

create_azure_resource_group() {
echo "running create_azure_resource_group" 
 # $AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup4"
echo sure ? createw $AZ_RESOURCE_GROUP
enter_cont
az group create --name $AZ_RESOURCE_GROUP --location westeurope
}

delete_azure_resource_group() {
 echo "running delete_azure_resource_group"
 # $AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup4"
 echo sure ? delete $AZ_RESOURCE_GROUP
 enter_cont
az group delete --name $AZ_RESOURCE_GROUP 
}


create_azure_deploy_aci_yaml() {
echo "running create_azure_deploy_aci_yaml"
#PROJECT_DIR=/Users/boscp08/Projects/scratch/virtual-insanity
#DOCKER_VERSION_TAG="3.0"
#$AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup2"
cd $PROJECT_DIR
touch deploy-aci.yaml
mv deploy-aci.yaml  deploy-aci_`date "+%Y%m%d-%H%M%S"`.yaml
touch deploy-aci.yaml
echo "" > deploy-aci.yaml

echo "location: westeurope
name: $AZ_RESOURCE_GROUP
properties:
  containers:
  - name: waardepapieren-mock-nlx
    properties:
      image: $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 80
  - name: waardepapieren-service
    properties:
      image: $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 3232
  - name: waardepapieren-clerk-frontend
    properties:
      image: $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 443
  osType: Linux
  ipAddress:
    type: Public
    # fqdn wordt: discipl_waardepapieren.westeurope.azurecontainer.io
    dnsNameLabel: "discipl" 
    ports:
    - protocol: tcp
      port: '443' 
tags: null
type: Microsoft.ContainerInstance/containerGroups" > deploy-aci.yaml

cat deploy-aci.yaml
enter_cont
}

docker_push() {
echo "running docker_push "
docker push $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG
docker push $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG
docker push $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG
# https://hub.docker.com  boscp08 P...!2....

}

docker_commit() {
echo "running docker_commit"
docker commit waardepapieren_clerk-frontend_1 $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG
docker commit waardepapieren_waardepapieren-service_1 $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG
docker commit waardepapieren_mock-nlx_1 $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG
}






echo "ici"
enter_cont


waardepapieren_service_config_compose_travis_json () {
echo "running waardepapieren_service_config_compose_travis_json"
#WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
#WAARDEPAPIEREN_SERVICE_CONFIG_DIR=$WAARDEPAPIEREN_SERVICE_DIR/configuration
#CERT_HOST_IP=waardepapieren.westeurope.azurecontainer.io 
#/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service/configuration
cd $WAARDEPAPIEREN_SERVICE_CONFIG_DIR
mv waardepapieren-config-compose-travis.json  waardepapieren-config-compose-travis_`date "+%Y%m%d-%H%M%S"`.json
touch waardepapieren-config-compose-travis.json

echo " {
   \"EPHEMERAL_ENDPOINT\" : \"https://localhost:3232\",
   \"EPHEMERAL_WEBSOCKET_ENDPOINT\" : \"wss://localhost:3232\",
   \"EPHEMERAL_CERT\": \"/ephemeral-certs/org.crt\",
   \"EPHEMERAL_KEY\": \"/ephemeral-certs/org.key\",
  \"NLX_OUTWAY_ENDPOINT\" : \"http://mock-nlx:80\",
  \"NLX_CERT\": \"/certs/org.crt\",
  \"NLX_KEY\": \"/certs/org.key\",
  \"LOG_LEVEL\": \"info\",
  \"EPHEMERAL_RETENTION_TIME\": $EPHEMERAL_RETENTION_TIME,
  \"PRODUCT_NEED\" : \"BRP_UITTREKSEL_NEED\",
  \"SOURCE_NLX_PATH\" : \"/brp/basisregistratie/natuurlijke_personen/bsn/{BSN}\",
  \"SOURCE_ARGUMENT\" : \"BSN\",
  \"PRODUCT_ACCEPT\" : \"BRP_UITTREKSEL_ACCEPT\",
  \"PRODUCT_NAME\" : \"Gewaarmerkt digitaal afschrift van gegevens uit de basisregistratie personen (BRP)\",
  \"PRODUCT_DESCRIPTION\" : \"Uittreksel Basis Registratie Persoonsgegevens\",
  \"PRODUCT_PURPOSE\" : \"Bewijs verblijfadres in woonplaats\",
  \"SOURCE_DATA_SELECTION\" : [
    {\"Burgerservicenummer (BSN)\" : \"burgerservicenummer\"},
    {\"Woonplaats verblijfadres\" : \"verblijfadres.woonplaats\"}
  ]
} " > waardepapieren-config-compose-travis.json
}

clerk_frontend_dockerfile_with_volumes() {
echo "running clerk_frontend_dockerfile_with_volumes"
CLERK_FRONTEND_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
CERT_HOST_IP=waardepapieren.westeurope.azurecontainer.io 
cd $CLERK_FRONTEND_DIR
mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
touch Dockerfile

echo "FROM node:10
RUN mkdir /app
ADD package.json package-lock.json /app/
ENV REACT_APP_EPHEMERAL_ENDPOINT=https://$CERT_HOST_IP:443/api/eph
ENV REACT_APP_EPHEMERAL_WEBSOCKET_ENDPOINT=wss://$CERT_HOST_IP:443/api/eph-ws
WORKDIR /app
RUN npm install --unsafe-perm
ADD public /app/public
ADD src /app/src
ARG CERTIFICATE_HOST
ENV REACT_APP_CERTIFICATE_HOST=\${CERTIFICATE_HOST}
RUN npm run build

FROM nginx:1.15.8
ADD nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app/build /usr/share/nginx/html"  > Dockerfile

}

clerk_frontend_dockerfile_without_volumes() {

echo "running clerk_frontend_dockerfile_without_volumes"
#CLERK_FRONTEND_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
cd $CLERK_FRONTEND_DIR
mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
touch Dockerfile

echo "FROM node:10
RUN mkdir /app
ADD package.json package-lock.json /app/
ENV REACT_APP_EPHEMERAL_ENDPOINT=https://$CERT_HOST_IP:443/api/eph
ENV REACT_APP_EPHEMERAL_WEBSOCKET_ENDPOINT=wss://$CERT_HOST_IP:443/api/eph-ws
WORKDIR /app
RUN npm install --unsafe-perm
ADD public /app/public
ADD src /app/src
ARG CERTIFICATE_HOST
ENV REACT_APP_CERTIFICATE_HOST=
RUN npm run build

FROM nginx:1.15.8
ADD nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app/build /usr/share/nginx/html
#  volumes:
#    - ./clerk-frontend/nginx/certs:/etc/nginx/certs:rw
RUN mkdir /etc/nginx/certs
ADD nginx/certs/org.crt /etc/nginx/certs/org.crt
ADD nginx/certs/org.key /etc/nginx/certs/org.key"  > Dockerfile
}


waardepapieren_service_dockerfile_with_volumes() {
echo "running waardepapieren_service_dockerfile_with_volumes"
#WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
cd $WAARDEPAPIEREN_SERVICE_DIR
mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
touch Dockerfile

echo "FROM node:10
RUN mkdir /app
ADD .babelrc package.json package-lock.json /app/
ADD src/* app/src/
ADD configuration/* app/configuration/
ENV WAARDEPAPIEREN_CONFIG /app/configuration/waardepapieren-config.json
WORKDIR /app
RUN npm install --production
CMD npm start"  > Dockerfile
}

waardepapieren_service_dockerfile_without_volumes() {
echo "running waardepapieren_service_dockerfile_without_volumes"
#WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
sleep 1
cd $WAARDEPAPIEREN_SERVICE_DIR
mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
touch Dockerfile

echo "FROM node:10
RUN mkdir /app
ADD .babelrc package.json package-lock.json /app/
ADD src/* app/src/
ADD configuration/* app/configuration/
#- ./waardepapieren-service/system-test/certs:/certs:ro
RUN mkdir /certs
ADD system-test/certs/org.crt /certs/org.crt
ADD system-test/certs/org.key /certs/org.key
#- ./waardepapieren-service/system-test/ephemeral-certs:/ephemeral-certs:ro
RUN mkdir /ephemeral-certs
ADD system-test/ephemeral-certs/org.crt /ephemeral-certs/
ADD system-test/ephemeral-certs/org.key /ephemeral-certs/
#- ./waardepapieren-service/configuration/:/app/configuration:ro

WORKDIR /app
RUN mkdir /configuration
ADD configuration/waardepapieren-config-compose.json /app/configuration
ADD configuration/waardepapieren-config-compose-travis.json /app/configuration
ADD configuration/waardepapieren-config.json /app/configuration
ENV WAARDEPAPIEREN_CONFIG /app/configuration/waardepapieren-config.json

RUN npm install --production
CMD npm start"  > Dockerfile

}

docker_compose_travis_yml_with_volumes() {
echo "running docker_compose_travis_yml_with_volumes"
#DOCKER_COMPOSE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren
sleep 1
cd $DOCKER_COMPOSE_DIR

mv docker-compose-travis.yml  docker-compose-travis_`date "+%Y%m%d-%H%M%S"`.yml
touch docker-compose-travis.yml 

echo "version: '3'
services:
  waardepapieren-service:
    volumes:
      - ./waardepapieren-service/system-test/certs:/certs:ro
      - ./waardepapieren-service/system-test/ephemeral-certs:/ephemeral-certs:ro
      - ./waardepapieren-service/configuration/:/app/configuration:ro
    build: waardepapieren-service/.
    # network_mode: host
    #networks:
    #  test:
    links:
      - mock-nlx
    ports:
      - 3232:3232
      - 3233:3233
    environment:
      - WAARDEPAPIEREN_CONFIG=/app/configuration/waardepapieren-config-compose-travis.json
      # Ignore self-signed ephemeral cert issues
      - NODE_TLS_REJECT_UNAUTHORIZED=0
  clerk-frontend:
    build:
      #network_mode: host
    #  networks:
    #  test:
      context: clerk-frontend/
      args:
        - CERTIFICATE_HOST=http://$CERT_HOST_IP:8880
    links:
      - waardepapieren-service
        ports:
      - 443:443
      - 8880:8880

    healthcheck:
      test: service nginx status
    volumes:
      - ./clerk-frontend/nginx/certs:/etc/nginx/certs:ro
  mock-nlx:
    build: mock-nlx/
    #network_mode: host
    #networks:
    #  test:
    ports:
      - 80:80
    
    #networks:
    #test:
    #driver: bridge  "  > docker-compose-travis.yml

}

docker_compose_travis_yml_without_volumes() {
echo "running docker_compose_travis_yml_without_volumes"
cd $DOCKER_COMPOSE_DIR
touch docker-compose-travis.yml 
mv docker-compose-travis.yml  docker-compose-travis_`date "+%Y%m%d-%H%M%S"`.yml

echo "version: '3'
services:
  waardepapieren-service:
    volumes:
      #- ./waardepapieren-service/system-test/certs:/certs:rw
      #- ./waardepapieren-service/system-test/ephemeral-certs:/ephemeral-certs:rw
      - ./waardepapieren-service/configuration/:/app/configuration2:rw  #FAKE
    build: waardepapieren-service/.
    links:
      - mock-nlx
    ports:
      - 3232:3232
      - 3233:3233
    environment:
      - WAARDEPAPIEREN_CONFIG=/app/configuration/waardepapieren-config-compose-travis.json
      # Ignore self-signed ephemeral cert issues
      - NODE_TLS_REJECT_UNAUTHORIZED=0
  clerk-frontend:
    build:
      context: clerk-frontend/
      args:
        - CERTIFICATE_HOST=http://$CERT_HOST_IP:8880
    links:
      - waardepapieren-service
    ports:
      - 443:443
      - 8880:8880
    healthcheck:
      test: service nginx status
  #  volumes:
  #    - ./clerk-frontend/nginx/certs:/etc/nginx/certs:rw
  mock-nlx:
    build: mock-nlx/
    ports:
      - 80:80" > docker-compose-travis.yml

}

git_clone() {
echo "running git_clone"
 echo "rm -rf $PROJECT_DIR/waardepapieren sure?"
 enter_cont
 cd $PROJECT_DIR
 rm -rf waardepapieren
 git clone https://github.com/discipl/waardepapieren.git
}

# eof