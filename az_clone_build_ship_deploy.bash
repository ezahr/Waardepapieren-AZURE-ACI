#! /bin/bash
# //////////////////////////////////////////////////////////////////////////////////////////
#    File Type   :- BASH Script (needs docker-CLI and AZURE-CLI installed)
#  
#    Description :- This script builds "waardepapieren" containers and ships images to hub.docker.com and beyond to ACI
#    Modified           Date           Description
#    --------           --------       -------------------------------------------------
#    Peter Bosch       20.12.2019      processing technical dept
#    Peter Bosch       05.12.2019      Initial version.
#
# //////////////////////////////////////////////////////////////////////////////////////////
#   File:            :az_clone_build_ship_deploy.bash
#   version          :20191204 v0
#   File Type        :Bash 
#   Purpose          :download - Clone - Build - Ship - Deploy https://github.com/dsicipl/waardepapieren.git     
#   Title:           :
#   Category         :Discipl DEV2PROD 
#   Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI 
#   big thanks to pim Otte ,stef van Leeuwen Wigo4it vincent van der laar.  
# //////////////////////////////////////////////////////////////////////////////////////////

#'********** instructions **********
#1. enter your parameters  
#2  modify functions docker config build files (be carefull)
#3 run script . az_clone_build_ship_deploy.bash

#'********** parameters **********

#echo "#######################"
#echo "## FQDN
#echo "#######################" 

AZ_DNSNAMELABEL=waardepapieren

#TARGET_HOST=linux_VM

TARGET_HOST=azure_container_instance

 if [ "$TARGET_HOST" = "linux_VM" ]; then
       echo expression evaluated as linux_VM
       AZ_TLD=cloudapp.azure.com
 fi

if [ "$TARGET_HOST" = "azure_container_instance" ]; then
       echo expression evaluated as azure_container_instance
       AZ_TLD=azurecontainer.io
fi

CERT_HOST_IP=$AZ_DNSNAMELABEL.westeurope."$AZ_TLD"  #FQDN linux
CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME=$AZ_DNSNAMELABEL.westeurope.$AZ_TLD

#echo "#######################"
#echo "## DOCKER SHIP 
#echo "#######################" 
DOCKER_TAG=false
DOCKER_USER="boscp08"  #NB repository name must be lowercase
DOCKER_VERSION_TAG="2.0"
DOCKER_PUSH=false  #hub.docker.com 

#echo "#######################"
#echo "## AZURE DEPLOY
#echo "#######################" 
AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup2"
AZ_RESOURCE_GROUP_DELETE=false
AZ_RESOURCE_GROUP_CREATE=flase

CREATE_AZ_DEPLOY_ACI_YAML=false  #@PROJECT_DIR deploy_aci.yml
CMD_AZ_CREATE_CONTAINERGROUP=false  #.. jeuh - Running ..

#echo "#######################"
#echo "## DOWNLOAD / directories used 
#echo "#######################" 

if [ `uname` = 'Linux' ]
  then  HOME_DIR=/home/boscp08 
  echo "linux"
fi  

if  [ `uname` = 'Darwin' ]
    then  HOME_DIR=/Users/boscp08   
    echo "Darwin"
fi

LOG_START_DATE_TIME=`date +%Y%m%d_%H_%M`  
LOG_DIR=$HOME_DIR/LOG_$LOG_START_DATE_TIME
LOG_FILE=$LOG_DIR/LOG_$LOG_START_DATE_TIME.log
GITHUB_DIR=$HOME_DIR/Dropbox/Github/Waardepapieren-AZURE-ACI  #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
PROJECT_DIR=$HOME_DIR/Projects/scratch/virtual-insanity       #git clone https://github.com/disciplo/waardepapieren.git
DOCKER_COMPOSE_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren
CLERK_FRONTEND_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
CLERK_FRONTEND_NGINX_DIR=${CLERK_FRONTEND_DIR}/nginx
#CLERK_FRONTEND_CYPRESS_DIR=${CLERK_FRONTEND_DIR}/cypress
WAARDEPAPIEREN_SERVICE_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
WAARDEPAPIEREN_SERVICE_CONFIG_DIR=${WAARDEPAPIEREN_SERVICE_DIR}/configuration

#echo "#######################"
#echo "## CLONE
#echo "#######################" 

CMD_CONTAINER_STOP=false
CMD_IMAGE_REMOVE=false
CMD_CONTAINER_PRUNE=false
CMD_GIT_CLONE=false

#echo "#######################"
#echo "## BUILD
#echo "#######################" 
CMD_DOCKER_COMPOSE=false  #volumes and links depreciated
CMD_DOCKER_BUILD=false  # build by container PENDING
CMD_DOCKER_COMPOSE_BUILD=" --build"


SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME=true        # Dockerfile #!
SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME=false  # Dockerfile #!
SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME=false  # Dockerfile #!

SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME=false         # bypass docker-compose depreciated and causes cloud / k8s issues
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME=false    # bypass docker-compose ACI cloud volume issue
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME=false    # bypass docker-compose ACI cloud bridged network issus

#EPHEMERAL_RETENTION_TIME=86400  #24h 
EPHEMERAL_RETENTION_TIME=2592001 #30 dage
SET_CLERK_FRONTEND_NGINX_CONF=false
SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON=false 



#echo "#######################"
#echo "## feedbak 
#echo "#######################" 
PROMPT=false  # echo parameters
DOUBLE_CHECK=true  #cat content modified files to $LOG_DIR
 

#'********** end of parameters **********

#'>>> below the functions that are called by other functions
# modify at your own peril! because of configuration drift 
# main purpose of this script to show configuration for containers spinning in the cloud. 

#echo "#######################"
#echo "## happy hacking ..  good luck 
#echo "#######################" 
#////////////////////////////////// hack into docker-compose-travis.yml

##################################################################
# Purpose: modify docker-compose-travis.yml 
# Arguments: 
# Return: 
##################################################################
docker_compose_travis_yml_with_volumes() {
echo "running docker_compose_travis_yml_with_volumes"
#DOCKER_COMPOSE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren
#cd ${DOCKER_COMPOSE_DIR}
#mv docker-compose-travis.yml  docker-compose-travis_`date "+%Y%m%d-%H%M%S"`.yml
#touch docker-compose-travis.yml 

TT_DIRECTORY=${DOCKER_COMPOSE_DIR}
TT_INSPECT_FILE=docker-compose-travis.yml 
echo $TT_DIRECTORY.${TT_INSPECT_FILE}

enter_touch

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
        - CERTIFICATE_HOST=http://${CERT_HOST_IP}:8880
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
    #driver: bridge  "  > ${TT_INSPECT_FILE} #docker-compose-travis.yml

if [ ${DOUBLE_CHECK} =  true ]
  then enter_inspect
fi 

TT_DIRECTORY=""
TT_INSPECT_FILE=""

}

##################################################################
# Purpose: modify docker-compose-travis.yml 
# Arguments: 
# Return: 
##################################################################
docker_compose_travis_yml_without_volumes() {
echo "running docker_compose_travis_yml_without_volumes"
#cd ${DOCKER_COMPOSE_DIR}
#touch docker-compose-travis.yml 
#mv docker-compose-travis.yml  docker-compose-travis_`date "+%Y%m%d-%H%M%S"`.yml

TT_DIRECTORY=${DOCKER_COMPOSE_DIR}
TT_INSPECT_FILE=docker-compose-travis.yml 
echo $TT_DIRECTORY.$TT_INSPECT_FILE

enter_touch

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
        - CERTIFICATE_HOST=http://${CERT_HOST_IP}:8880
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
      - 80:80" > ${TT_INSPECT_FILE} #docker-compose-travis.yml

if [ ${DOUBLE_CHECK} = true ]
  then enter_inspect
fi 

TT_DIRECTORY=""
TT_INSPECT_FILE=""

}

##################################################################
# Purpose: hack into clerk-frontend Dockerfile
# Arguments: 
# Return: 
##################################################################
clerk_frontend_dockerfile_with_volumes() {
echo "running clerk_frontend_dockerfile_with_volumes"
#CLERK_FRONTEND_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
#CERT_HOST_IP=waardepapieren.westeurope.azurecontainer.io 
#cd ${CLERK_FRONTEND_DIR}
#mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
#touch Dockerfile

TT_DIRECTORY=${CLERK_FRONTEND_DIR}
TT_INSPECT_FILE=Dockerfile 
enter_touch

echo "FROM node:10
RUN mkdir /app
ADD package.json package-lock.json /app/
ENV REACT_APP_EPHEMERAL_ENDPOINT=https://${CERT_HOST_IP}:443/api/eph
ENV REACT_APP_EPHEMERAL_WEBSOCKET_ENDPOINT=wss://${CERT_HOST_IP}:443/api/eph-ws
WORKDIR /app
RUN npm install --unsafe-perm
ADD public /app/public
ADD src /app/src
ARG CERTIFICATE_HOST
ENV REACT_APP_CERTIFICATE_HOST=${CERTIFICATE_HOST}
RUN npm run build

FROM nginx:1.15.8
ADD nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app/build /usr/share/nginx/html"  > ${TT_INSPECT_FILE} #Dockerfile

if [ ${DOUBLE_CHECK} =  true ]
  then enter_inspect
fi 

TT_DIRECTORY=""
TT_INSPECT_FILE=""

}

##################################################################
# Purpose: 
# Arguments: 
# Return: 
##################################################################
clerk_frontend_dockerfile_without_volumes() {

echo "running clerk_frontend_dockerfile_without_volumes"
#CLERK_FRONTEND_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
#cd ${CLERK_FRONTEND_DIR}
#mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
#touch Dockerfile

TT_DIRECTORY=${CLERK_FRONTEND_DIR}
TT_INSPECT_FILE=Dockerfile 
enter_touch

echo "FROM node:10
RUN mkdir /app
ADD package.json package-lock.json /app/
ENV REACT_APP_EPHEMERAL_ENDPOINT=https://${CERT_HOST_IP}:443/api/eph
ENV REACT_APP_EPHEMERAL_WEBSOCKET_ENDPOINT=wss://${CERT_HOST_IP}:443/api/eph-ws
WORKDIR /app
RUN npm install --unsafe-perm
ADD public /app/public
ADD src /app/src
ARG CERTIFICATE_HOST
ENV REACT_APP_CERTIFICATE_HOST=http://${CERT_HOST_IP}:8880
RUN npm run build

FROM nginx:1.15.8
ADD nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app/build /usr/share/nginx/html
#  volumes:
#    - ./clerk-frontend/nginx/certs:/etc/nginx/certs:rw
RUN mkdir /etc/nginx/certs
ADD nginx/certs/org.crt /etc/nginx/certs/org.crt
ADD nginx/certs/org.key /etc/nginx/certs/org.key"  > ${TT_INSPECT_FILE} # Dockerfile

if [ ${DOUBLE_CHECK} = true ]
  then enter_inspect
fi 

TT_DIRECTORY=""
TT_INSPECT_FILE=""

}

##################################################################
# Purpose: hack into clerk-frontend build in nginx
# Arguments: 
# Return: 
##################################################################
clerk_frontend_nginx_conf() {
#CLERK_FRONTEND_NGINX_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend/nginx
#CERT_HOST_IP=waardepapieren.westeurope.azurecontainer.io 
echo "running clerk_frontend_nginx_conf"

TT_DIRECTORY=${CLERK_FRONTEND_NGINX_DIR}
TT_INSPECT_FILE=nginx.conf
enter_touch

echo "events {
    worker_connections  1024;
}

http {

    map \$http_upgrade \$connection_upgrade {
        default upgrade;
        '' close;
    }

    # Http server to obtain NLX certificate
    server {
        listen 8880;

        location / {
           root /usr/share/nginx/html;
           include /etc/nginx/mime.types;
        }
    }

    server {
        listen 443 ssl;

        ssl_certificate /etc/nginx/certs/org.crt;
        ssl_certificate_key /etc/nginx/certs/org.key;

        location /api/eph/ {
               proxy_pass https://${CERT_HOST_IP}_WAARDEPAPIEREN_SERVICE_HOSTNAME:3232/;    #pdf effect
           #     proxy_pass https://waardepapieren-service:3232/;
            #     proxy_pass https://172.19.0.3:3232/;
        }

        location /api/eph-ws {
           
              proxy_pass https://${CERT_HOST_IP}_WAARDEPAPIEREN_SERVICE_HOSTNAME:3232;   # pdf effect
             #  proxy_pass https://waardepapieren-service:3232;
            #  proxy_pass https://172.19.0.3:3232;
            proxy_http_version 1.1;
            proxy_set_header Upgrade \$http_upgrade;
            proxy_set_header Connection "Upgrade";
        }
        location / {
            root /usr/share/nginx/html;
            include /etc/nginx/mime.types;
        }
    }
}" > ${TT_INSPECT_FILE}  #nginx.conf

if [ ${DOUBLE_CHECK} =  true ]
  then enter_inspect
fi 

TT_DIRECTORY=""
TT_INSPECT_FILE=""

} 


##################################################################
# Purpose: hack into waardepapieren-servcie Dockerfile
# Arguments: 
# Return: 
##################################################################
waardepapieren_service_dockerfile_with_volumes() {
echo "running waardepapieren_service_dockerfile_with_volumes"
#WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
#cd ${WAARDEPAPIEREN_SERVICE_DIR}
#mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
#touch Dockerfile
TT_DIRECTORY=${WAARDEPAPIEREN_SERVICE_DIR}
TT_INSPECT_FILE=Dockerfile
enter_touch


echo "FROM node:10
RUN mkdir /app
ADD .babelrc package.json package-lock.json /app/
ADD src/* app/src/
ADD configuration/* app/configuration/
ENV WAARDEPAPIEREN_CONFIG /app/configuration/waardepapieren-config.json
WORKDIR /app
RUN npm install --production
CMD npm start"  > ${TT_INSPECT_FILE} #Dockerfile

if [ ${DOUBLE_CHECK} =  true ]
  then enter_inspect
fi 
TT_DIRECTORY=""
TT_INSPECT_FILE=""

}

##################################################################
# Purpose: hack into waardepapieren-service Dockerfile
# Arguments: 
# Return: 
##################################################################
waardepapieren_service_dockerfile_without_volumes() {
echo "running waardepapieren_service_dockerfile_without_volumes"
#WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
#sleep 1
#cd ${WAARDEPAPIEREN_SERVICE_DIR}
#mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
#touch Dockerfile
TT_DIRECTORY=${WAARDEPAPIEREN_SERVICE_DIR}
TT_INSPECT_FILE=Dockerfile
enter_touch

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
CMD npm start"  > ${TT_INSPECT_FILE} #Dockerfile

if [ ${DOUBLE_CHECK} =  true ]
  then enter_inspect
fi 
TT_DIRECTORY=""
TT_INSPECT_FILE=""

}

##################################################################
# Purpose: hack into waardepapieren-service config
# Arguments: 
# Return: 
##################################################################
waardepapieren_service_config_compose_travis_json () {
echo "running waardepapieren_service_config_compose_travis_json"
#WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
#WAARDEPAPIEREN_SERVICE_CONFIG_DIR=${WAARDEPAPIEREN_SERVICE_DIR}/configuration
#CERT_HOST_IP=waardepapieren.westeurope.azurecontainer.io 
#/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service/configuration
#cd $WAARDEPAPIEREN_SERVICE_CONFIG_DIR
#mv waardepapieren-config-compose-travis.json  waardepapieren-config-compose-travis_`date "+%Y%m%d-%H%M%S"`.json
#touch waardepapieren-config-compose-travis.json

TT_DIRECTORY=$WAARDEPAPIEREN_SERVICE_CONFIG_DIR
TT_INSPECT_FILE=waardepapieren-config-compose-travis.json
enter_touch

echo " {
   \"EPHEMERAL_ENDPOINT\" : \"https://localhost:3232\",
   \"EPHEMERAL_WEBSOCKET_ENDPOINT\" : \"wss://localhost:3232\",
   \"EPHEMERAL_CERT\": \"/ephemeral-certs/org.crt\",
   \"EPHEMERAL_KEY\": \"/ephemeral-certs/org.key\",
  \"NLX_OUTWAY_ENDPOINT\" : \"http://${CERT_HOST_IP}_WAARDEPAPIEREN_SERVICE_HOSTNAME:80\",
  \"NLX_CERT\": \"/certs/org.crt\",
  \"NLX_KEY\": \"/certs/org.key\",
  \"LOG_LEVEL\": \"info\",
  \"EPHEMERAL_RETENTION_TIME\": ${EPHEMERAL_RETENTION_TIME},
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
} " > ${TT_INSPECT_FILE} # waardepapieren-config-compose-travis.json

if [ ${DOUBLE_CHECK} =  true ]
  then enter_inspect
fi 

TT_DIRECTORY=""
TT_INSPECT_FILE=""

}

##################################################################
# Purpose: hack into azure deploy ACI
# Arguments: 
# Return: 
##################################################################
create_azure_deploy_aci_yaml() {
echo "running create_azure_deploy_aci_yaml"
#PROJECT_DIR=/Users/boscp08/Projects/scratch/virtual-insanity

TT_DIRECTORY=${PROJECT_DIR}
TT_INSPECT_FILE=deploy-aci.yaml
enter_touch

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
      - port: 8880
  osType: Linux
  ipAddress:
    type: Public
    # fqdn wordt: discipl_waardepapieren.westeurope.azurecontainer.io
    dnsNameLabel: "$AZ_DNSNAMELABEL" 
    ports:
    - protocol: tcp
      port: '443' 
    - protocol: tcp
      port: '3232' 
    - protocol: tcp
      port: '80'    
    - protocol: tcp
      port: '8880'      
tags: null
type: Microsoft.ContainerInstance/containerGroups" > ${TT_INSPECT_FILE}  #deploy-aci.yaml

if [ ${DOUBLE_CHECK} =  true ]
  then enter_inspect
fi 

TT_DIRECTORY=""
TT_INSPECT_FILE=""


}

#'# Structured programming:
#'# Entire program logic modularized in functions.
#' ------------------------------  

### barf  
enter_cont() {
    echo
    echo
    echo -n "Press enter to Continue"
    read
}

# /////////////////////////////////////////////////////////////////////////////////
#  Create a Header in the logfile
# /////////////////////////////////////////////////////////////////////////////////
create_logfile_header() {
    JOB_START_DATE_TIME=`date +%Y%m%d_%H_%M`
    echo $JOB_START_DATE_TIME - BEGIN JOB:                                             >> $LOG_FILE
    echo ----------------------------------------------------------------------------- >> $LOG_FILE
    }

# /////////////////////////////////////////////////////////////////////////////////
#  Create a Footer in the logfile
# /////////////////////////////////////////////////////////////////////////////////
create_logfile_footer() {
    JOB_END_DATE_TIME=`date +%Y%m%d_%H_%M`
    echo $JOB_END_DATE_TIME - END JOB :                                                >> $LOG_FILE
    echo ----------------------------------------------------------------------------- >> $LOG_FILE
    }

# /////////////////////////////////////////////////////////////////////////////////
#  Create a log directory
# /////////////////////////////////////////////////////////////////////////////////
create_logdir() {
     mkdir $LOG_DIR
    }


##################################################################
# Purpose: Procedure to create an empty file
# Arguments: 
# Return: 
##################################################################
enter_touch () {

cd ${TT_DIRECTORY}
touch ${TT_INSPECT_FILE}


}

##################################################################
# Purpose: 
# Arguments: 
# Return: 
##################################################################
enter_inspect() {
clear

if [ -f "${TT_INSPECT_FILE}" ]; then
 
echo "========="
echo "enter inspect  ${TT_INSPECT_FILE}"
echo "========="
echo ""
cat  ${TT_INSPECT_FILE}

create_logfile_header

echo "| $LOG_START_DATE_TIME | ${TT_INSPECT_FILE}|"                                >> $LOG_FILE
echo "<code>"                                                                      >> $LOG_FILE
cat  ${TT_INSPECT_FILE}                                                            >> $LOG_FILE
echo "</code>"                                                                     >> $LOG_FILE
create_logfile_footer

#cp   ${TT_INSPECT_FILE}  $LOG_DIR/${TT_INSPECT_FILE}.$LOG_START_DATE_TIME   #`date "+%Y%m%d-%H%M%S"`
echo ""
echo "========="
echo "eof inspect  ${TT_INSPECT_FILE}"
echo "========="
else
clear
cd ${DOCKER_COMPOSE_DIR}
echo "File ${TT_INSPECT_FILE} is missing or cannot be executed"   

enter_cont

fi
}




##################################################################
# Purpose: Procedure to stop running docker containers
# Arguments: 
# Return: 
##################################################################
docker_containers_stop() {
   echo "-running .. docker_containers_stop"
}

##################################################################
# Purpose: Procedure to remove docker images
# Arguments: 
# Return: 
##################################################################
docker_images_remove() {
  echo "-running .. docker_images_remove("
}

##################################################################
# Purpose: Procedure to remove stopped containers (waste of storage)
# Arguments: 
# Return: 
##################################################################
docker_containers_prune() {
  echo "-running .. docker_containers_prune("
}

##################################################################
# Purpose: Procedure to install Docker command line interface
# Arguments: 
# Return: 
##################################################################
install_docker_cli() {
  echo "-running .. install_docker_cli() "
}

##################################################################
# Purpose: Procedure to download azure command line interface
# Arguments: 
# Return: 
##################################################################
install_azure_cli() {
  echo "-running .. install_azure_cli"
}

##################################################################
# Purpose: Procedure to create azure resource group
# Arguments: 
# Return: 
##################################################################
create_azure_resource_group() {
echo "running create_azure_resource_group" 
 # $AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup4"
#echo sure ? createw $AZ_RESOURCE_GROUP
#enter_cont
az group create --name ${AZ_RESOURCE_GROUP}--location westeurope
}

##################################################################
# Purpose: Procedure to create the azure containergroup
# Arguments: 
# Return: 
##################################################################
create_azure_container_group() {
echo "running create_azure_container_group" 
cd ${PROJECT_DIR}
az container create --resource-group ${AZ_RESOURCE_GROUP}--file deploy-aci.yaml
# https://docs.microsoft.com/en-us/azure/container-instances/container-instances-multi-container-yaml
# View deployment state
# az container show --resource-group ${AZ_RESOURCE_GROUP} --name myContainerGroup --output table
}



##################################################################
# Purpose: Procedure to delete azure resource group (a.k.a costcentre )
# Arguments: 
# Return: 
##################################################################
delete_azure_resource_group() {
 echo "running delete_azure_resource_group"
 # $AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup4"
 # echo sure ? delete $AZ_RESOURCE_GROUP
 # enter_cont
az group delete --name ${AZ_RESOURCE_GROUP}
}

##################################################################
# Purpose: Procedure to ship docker container images to docker hub
# Arguments: 
# Return: 
##################################################################
docker_push() {
echo "running docker_push "
docker push $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG
docker push $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG
docker push $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG
# https://hub.docker.com  boscp08 P...!2....

}

##################################################################
# Purpose: Procedure to tag docker images (Version)
# Arguments: 
# Return: 
##################################################################
docker_tag() {
echo "running docker_tag"
docker tag waardepapieren_clerk-frontend $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG
docker tag waardepapieren_waardepapieren-service $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG
docker tag waardepapieren_mock-nlx $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG
}

##################################################################
# Purpose:  Procedure to build the waardepapieren images and run containers.  
# Arguments: 
# Return: 
##################################################################
docker_compose_min_f_docker-travis_compose_yml_up() {
echo "running docker_compose_min_f_docker-travis_compose_yml up $CMD_DOCKER_COMPOSE_BUILD "

# Met docker-compose gebruikt u een eenvoudig tekstbestand om een toepassing te definiëren die uit meerdere Docker-containers bestaat. 
# Vervolgens draait u uw toepassing op met een enkele opdracht die er alles aan doet om uw gedefinieerde omgeving te implementeren.  

cd ${DOCKER_COMPOSE_DIR}
docker-compose -f docker-compose-travis.yml up $CMD_DOCKER_COMPOSE_BUILD

}

##################################################################
# Purpose: Procedure to clone de github repo on your pc
# Arguments: 
# Return: 
##################################################################
git_clone() {
 echo "running git_clone"
 echo "rm -rf ${PROJECT_DIR}/waardepapieren sure?"
 enter_cont
 cd ${PROJECT_DIR}
 rm -rf waardepapieren
 git clone https://github.com/discipl/waardepapieren.git
}



#######################
## M A I N
# program starts here actually building the three containers.
# ships images to docker hub
# deploys images to azure.portal.com
#######################

echo "***"   
echo "***  Welcome to  docker-compose "
echo "***"   
echo "***" 
echo "***  You are about to start to build new waardepapieren images and containers "
echo "***  FQDN = https://${CERT_HOST_IP} "
echo "***  docker-tag = $DOCKER_VERSION_TAG "
echo "***  AZURE ACI-resourcegroup=${AZ_RESOURCE_GROUP}" 
echo "***" 

enter_cont

create_logdir


if [ $PROMPT = true ] 
 then 
clear
enter_cont

echo "#######################"
echo "## DOWNLOAD"  
echo "#######################"
echo "HOME_DIR="$HOME_DIR 
echo "LOG_DIR="$LOG_DIR   
echo "LOG_FILE="$LOG_FILE  
echo "GITHUB_DIR="$GITHUB_DIR        # $HOME_DIR/Dropbox/Github/Waardepapieren-AZURE-ACI  #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
echo "PROJECT_DIR="${PROJECT_DIR}         #$HOME_DIR/Projects/scratch/virtual-insanity       #git clone https://github.com/disciplo/waardepapieren.git
echo "DOCKER_COMPOSE_DIR="${DOCKER_COMPOSE_DIR}        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren
echo "CLERK_FRONTEND_DIR="${CLERK_FRONTEND_DIR}        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
echo "CLERK_FRONTEND_NGINX_DIR="${CLERK_FRONTEND_NGINX_DIR}        #${CLERK_FRONTEND_DIR}/nginx
#CLERK_FRONTEND_CYPRESS_DIR="$         #${CLERK_FRONTEND_DIR}/cypress
echo "WAARDEPAPIEREN_SERVICE_DIR="${WAARDEPAPIEREN_SERVICE_DIR}        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
echo "WAARDEPAPIEREN_SERVICE_CONFIG_DIR="$WAARDEPAPIEREN_SERVICE_CONFIG_DIR        #${WAARDEPAPIEREN_SERVICE_DIR}/configuration
echo ""
echo "#######################"
echo "## CLONE GITHUB" 
echo "#######################" 
echo "CMD_CONTAINER_STOP="$CMD_CONTAINER_STOP        #false
echo "CMD_IMAGE_REMOVE="$CMD_IMAGE_REMOVE         #false
echo "CMD_CONTAINER_PRUNE="$CMD_CONTAINER_PRUNE         #false
echo ""
echo "CMD_GIT_CLONE="$CMD_GIT_CLONE        #false  #git clone https://github.com/disciplo/waardepapieren.git
echo ""
enter_cont
clear
echo "#######################"
echo "## BUILD "
echo "#######################" 
echo "CMD_DOCKER_COMPOSE="$CMD_DOCKER_COMPOSE        #true  #volumes and links depreciated
echo "CMD_DOCKER_BUILD="$CMD_DOCKER_BUILD         #false  # build by container
echo "CMD_DOCKER_COMPOSE_BUILD="$CMD_DOCKER_COMPOSE_BUILD        #" --build"
echo ""
echo "SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME         #true       
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME         #true
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME         #true
echo ""
echo "SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME        #false
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME        #false
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME        #false
echo ""
echo "SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON="$SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON        #true 
echo "SET_CLERK_FRONTEND_NGINX_CONF="$SET_CLERK_FRONTEND_NGINX_CONF        #true
enter_cont
clear
echo "#######################"
echo "## SHIP DOCKER HUB"
echo "#######################" 
echo "DOCKER_TAG="${DOCKER_TAG}        #true
echo "DOCKER_USER="${DOCKER_USER}      #"boscp08"  #NB repository name must be lowercase
echo "DOCKER_VERSION_TAG="$DOCKER_VERSION_TAG        #"2.0"
echo "DOCKER_PUSH="$DOCKER_PUSH         #true  #hub.docker.com 
echo ""
echo "#######################"
echo "## DEPLOY AZURE"
echo "#######################" 
echo "AZ_RESOURCE_GROUP="${AZ_RESOURCE_GROUP}       #"Discipl_Wigo4it_DockerGroup2"
echo "AZ_RESOURCE_GROUP_DELETE="$AZ_RESOURCE_GROUP_DELETE         #true
echo "AZ_RESOURCE_GROUP_CREATE="$AZ_RESOURCE_GROUP_CREATE        #true
echo "CREATE_AZ_DEPLOY_ACI_YAML="$CREATE_AZ_DEPLOY_ACI_YAML        #true  #@PROJECT_DIR deploy_aci.yml
echo "CMD_AZ_CREATE_CONTAINERGROUP="$CMD_AZ_CREATE_CONTAINERGROUP        #true  #.. jeuh - Running ..
enter_cont

#echo "#######################"
#echo "## end of feedbak 
#echo "#######################" 
echo "" 
echo "" 
echo "hope the run will be okay. "
enter_cont
clear
fi

#ici



#######################
## M A I N
#  shipping tot docker repository starts here actually
#######################

if [ ${DOCKER_TAG}= true ]
  then docker_tag
fi 

if [ $DOCKER_PUSH = true ]
  then 
  docker login  #Authenticating with existing credentials...
  docker_push  #check hub.docker.com
 fi 


#######################
## M A I N
#  deploy to portal.azure.com  starts here actually
#######################

if [ $CREATE_AZ_DEPLOY_ACI_YAML = true  ]
  then create_azure_deploy_aci_yaml
fi 

if [ $AZ_RESOURCE_GROUP_DELETE = true ]
  then 
  #az login\
  echo "***"   
  echo "***  Welcome to  dockerhub2azure "
  echo "***"   
  echo "***" 
  echo "***  You are about to delete resource group ${AZ_RESOURCE_GROUP}"
  echo "***" 
  echo "az login succeeded ?" 
  enter_cont
  delete_azure_resource_group
fi 

if [ $CMD_GIT_CLONE = true ] 
  then git_clone 
fi 

if [ $SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME = true ]
  then docker_compose_travis_yml_with_volumes
fi 

if [ $SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME = true ]
  then docker_compose_travis_yml_without_volumes 
fi 


# docker files

if [ $SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME = true ]
  then clerk_frontend_dockerfile_with_volumes
fi 

if [ $SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME = true ]
  then waardepapieren_service_dockerfile_with_volumes 
fi 

if [ $SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME = true ]
  then clerk_frontend_dockerfile_without_volumes
fi 
#---


if [ $SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME = true ]
  then waardepapieren_service_dockerfile_without_volumes
fi 

if [ $SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON = true ]
  then waardepapieren_service_config_compose_travis_json      
  #https://waardepapieren-service:3232 http://mock-nlx:80 docker network... 
fi 

if [ $SET_CLERK_FRONTEND_NGINX_CONF = true ]
    then clerk_frontend_nginx_conf      
    # docker network fix4https://waardepapieren-service
fi 

if [ $CMD_DOCKER_COMPOSE = true ]
  then docker_compose_min_f_docker-travis_compose_yml_up # 
fi 

if [ $CMD_DOCKER_BUILD = true ]
  then  echo "PENDING"
fi

# az 
if [ $AZ_RESOURCE_GROUP_CREATE = true  ]

  then 
  #az login
  echo "***"   
  echo "***  Welcome to  dockerhub2azure "
  echo "***"   
  echo "***" 
  echo "***  You are about to create resource group $AZ_RESOURCE_GROUP"
  echo "***" 
  echo "az login succeeded ?" 
  enter_cont
  create_azure_resource_group
fi 

if [ $CMD_AZ_CREATE_CONTAINERGROUP =  true ]
  then 
  #az logon
  echo "***"   
  echo "***  Welcome to  dockerhub2azure "
  echo "***"   
  echo "***" 
  echo "***  You are about to deploy waardepapieren images fromdockerhub to ACI AZURE Container Instances "
  echo "***  droplet-targethost= https://${CERT_HOST_IP}  with DOCKER_VERSION_TAG = $DOCKER_VERSION_TAG "
  echo "***  resourcegroup = ${AZ_RESOURCE_GROUP} "
  echo "az login succeeded ?" 
  enter_cont
  create_azure_container_group   #blader naar portal.azure.com  bosch.peter@outlook.com 0l....n
fi 


# //////////////////////////////////////////////////////////////////////////////////////////
#  az account list
#[
#  {
#    "cloudName": "AzureCloud",
#    "id": "cfcb03ea-255b-42f8-beca-2d4ac30779bb",
#    "isDefault": true,
#    "name": "Azure-abonnement 1",
#    "state": "Enabled",
#    "tenantId": "62123322-502d-493f-b543-503672043240",
#    "user": {
#      "name": "bosch.peter@outlook.com", 0l..ten
#      "type": "user"
#    }
#  }
#]


#If you’re in a hurry, here is a brief summary of somecommands used in this post:

## List currently authenticated subscriptions
#az account list

## Log in to a subscription
#az login

## Display subscriptions by Name and show which is selected
#az account list --query "[].{Name:name, IsDefault:isDefault}"

## Select a specific subscription by name
#az account set --subscription "Visual Studio Enterprise"

## Show usernames associated with specific subscriptions
#az account list --query "[].{Name:name, User:user.name}"

## Show usernames associated with a specific subscriptio matching Name
#az account list --query "[?contains(name, 'Visual')].{Name:name, User:user.name}"

## Log out of a specific subscription by username
#az logout --username "user@example.com"

## List virtual machines for select account
#az vm list


#https://docs.microsoft.com/en-us/azure/virtual-machines/azure-cli-arm-commands
#https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli?view=azure-cli-latest

# az group list

echo
echo "hope the run will be ok!"
echo
enter_cont


echo " cd back into " $GITHUB_DIR
cd $GITHUB_DIR
clear


# eof