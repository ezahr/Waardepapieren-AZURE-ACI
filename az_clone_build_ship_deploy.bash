#! /bin/bash
# //////////////////////////////////////////////////////////////////////////////////////////
#    File Type   :- BASH Script (needs docker-CLI and AZURE-CLI installed)
#  
#    Description :- This script builds "waardepapieren" containers and ships images to hub.docker.com and beyond to ACI
#    Modified           Date           Description
#    --------           --------       -------------------------------------------------
#    Peter Bosch       21.12.2019      macOs configuration
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


# Running
#
# The easiest way to run is using docker-compose:
#
# With docker compose you use a simple text file to define an application that consists of multiple Docker containers.
# You then run your application with a single command that does everything to implement your defined environment.

# This will start 3 applications:
#
#    clerk-frontend
#    waardepapieren-service, with embedded ephemeral-server
#    nlx-mock, which is an nlx-outway that provides access to a mock BRP service
#

#  Run docker-compose up#
#
#  Alternatively, you can use an offline mock, which replicates the NLX environment.
#
#  Run docker-compose -f docker-compose-travis.yml up
#  The clerk frontend will be available at https://localhost:443 on your local pc. 
#  Below the cookbook to deploy your containers in the azure cloud  (a.k.a ACI Azure Container Instance)


#'********** parameters **********

#echo "#######################"
#echo "## FQDN
#echo "#######################" 

# This is done as follows:
#
#    Set the environment variable CERT_HOST_IP is with an IP (or domain) that the validator app can use to reach the clerk-frontend container.  
#   Ensure that the validator app runs on the same (wifi) network as the clerk frontend.


AZ_DNSNAMELABEL=waardepapieren-demo   # start of your FQDN in azure.

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
DOCKER_PUSH=false #hub.docker.com   NB with docker commit you loose ENV

#echo "#######################"
#echo "## AZURE DEPLOY
#echo "#######################" 
AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup2"
AZ_RESOURCE_GROUP_DELETE=true
AZ_RESOURCE_GROUP_CREATE=true

CREATE_AZ_DEPLOY_ACI_YAML=true #@PROJECT_DIR deploy_aci.yml
CMD_AZ_CREATE_CONTAINERGROUP=true  #.. jeuh - - Running ... ..

#echo "#######################"
#echo "## DOWNLOAD / directories used 
#echo "#######################" 

if [ `uname` = 'Linux' ]
  then  HOME_DIR=/home/`whoami`    #boscp08 
  echo "linux"
fi  

if  [ `uname` = 'Darwin' ]
    then  HOME_DIR=/Users/`whoami` #boscp08   
    echo "Darwin"
fi

LOG_START_DATE_TIME=`date +%Y%m%d_%H_%M`  
LOG_DIR=$HOME_DIR/LOG_DIR
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
# CMD_DOCKER_BUILD=false  # build by container PENDING  well docker compose works like docker build now. Jeuh
CMD_DOCKER_COMPOSE_BUILD=" --build"


SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME=true       # mimic native Dockerfile build  #! no volumes , no links (bridged docker network)
SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME=true  # mimic native Dockerfile build  #! no volumes , no links (bridged docker network)
SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME=true  # mimic native Dockerfile build  #! no volumes , no links (bridged docker network)

SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME=false         # bypass docker-compose depreciated and causes cloud / k8s issues
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME=false    # bypass docker-compose ACI cloud volume issue
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME=false    # bypass docker-compose ACI cloud bridged network issus

#EPHEMERAL_RETENTION_TIME=86400  #24h 
EPHEMERAL_RETENTION_TIME=2592001 #30 dage
SET_CLERK_FRONTEND_NGINX_CONF=true
SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON=true



#echo "#######################"
#echo "## feedbak 
#echo "#######################" 
PROMPT=true # echo parameters
DOUBLE_CHECK=false  #cat content modified files to $LOG_DIR
 

#'********** end of parameters **********

#'>>> below the functions that are called by other functions
# modify at your own peril! because of configuration drift 
# main purpose of this script to show configuration for containers spinning in the cloud. 


##################################################################
# Purpose: modify docker-compose-travis.yml 
# Arguments: 
# Return: 
##################################################################
docker_compose_travis_yml_with_volumes() {
echo "- Running ... docker_compose_travis_yml_with_volumes"
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
echo "- Running ... docker_compose_travis_yml_without_volumes"
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
echo "- Running ... clerk_frontend_dockerfile_with_volumes"
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

echo "- Running ... clerk_frontend_dockerfile_without_volumes"
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
echo "- Running ... clerk_frontend_nginx_conf"

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
               proxy_pass https://${CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME}:3232/;    #pdf effect
           #     proxy_pass https://waardepapieren-service:3232/;
            #     proxy_pass https://172.19.0.3:3232/;
        }

        location /api/eph-ws {
           
              proxy_pass https://${CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME}:3232;   # pdf effect
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
echo "- Running ... waardepapieren_service_dockerfile_with_volumes"
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
echo "- Running ... waardepapieren_service_dockerfile_without_volumes"
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
echo "- Running ... waardepapieren_service_config_compose_travis_json"
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
  \"NLX_OUTWAY_ENDPOINT\" : \"http://${CERT_HOST_IP}:80\",
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
echo "- Running ... create_azure_deploy_aci_yaml"
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

##################################################################
# Purpose: Procedure to create directories specified
# Arguments: 
# Return: To check if a directory exists in a shell script you can use the following:
##################################################################
create_logdir() {
     
if ! [ -d "$LOG_DIR" ]; then
  mkdir  ${LOG_DIR}
fi 

#create_projectdir() {

#echo ${PROJECT_DIR} | awk -F/ '{print "/"$2"/"$3"/"$4"/"$5"/"$6}'
#/home/boscp08/Projects/scratch/virtual-insanity
#if ! [ -d "$LOG_DIR" ]; then
#  mkdir  ${LOG_DIR}
#fi
}

##################################################################
# Purpose: #echo ${PROJECT_DIR} | awk -F/ '{print "/"$2"/"$3"/"$4"/"$5"/"$6}'
# Arguments: directory structure  #/home/boscp08/Projects/scratch/virtual-insanity
# Return: a folder  /home/boscp08/Dropbox/tt/Waardepapieren-AZURE-ACI
##################################################################
 make_folder() 
    {
     #echo $1
    
   if ! [ -d $1 ]; then
    echo $1 > struct.txt
    sed '/^$/d;s/ /\//g' struct.txt | xargs mkdir -p 
    rm struct.txt
     
     if [ ${PROMPT} = true ]   
        then 
        echo "$1 Directorie(s) have been made"
        cd $1
        pwd
    fi   
    
    #else   echo "$1 directory already exists "
   fi

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
 
create_logfile_header
echo "| $LOG_START_DATE_TIME | ${TT_DIRECTORY} |"                                  >> $LOG_FILE
echo "| $LOG_START_DATE_TIME | ${TT_INSPECT_FILE}|"                                >> $LOG_FILE
echo "<code>"                                                                      >> $LOG_FILE
cat  ${TT_INSPECT_FILE}                                                            >> $LOG_FILE
echo "</code>"                                                                     >> $LOG_FILE
create_logfile_footer

else 
cd ${DOCKER_COMPOSE_DIR}
clear
echo "File ${TT_INSPECT_FILE} is missing or cannot be executed"   
enter_cont
fi

if [ ${PROMPT} = true ] 
then 
clear
echo "========="
echo "enter inspect  ${TT_INSPECT_FILE}"
echo "========="
echo ""
cat  ${TT_INSPECT_FILE}
echo ""
echo "========="
echo "eof inspect  ${TT_INSPECT_FILE}"
echo "========="
enter_cont

fi

}

##################################################################
# Purpose: create directories if neccecary.
# Arguments: 
# Return: specified directory structure
##################################################################
create_directories() {
  
make_folder ${LOG_DIR} #=$HOME_DIR/LOG_DIR
make_folder $GITHUB_DIR  #=${HOME_DIR}   #/Dropbox/Github/Waardepapieren-AZURE-ACI  #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
make_folder ${PROJECT_DIR}   #=${HOME_DIR}  #/Projects/scratch/virtual-insanity       #git clone https://github.com/disciplo/waardepapieren.git
#make_folder ${DOCKER_COMPOSE_DIR}#=${HOME_DIR} #/Projects/scratch/virtual-insanity/waardepapieren
#make_folder $CLERK_FRONTEND_DIR #=${HOME_DIR} #/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
#make_folder $CLERK_FRONTEND_NGINX_DIR #=${CLERK_FRONTEND_DIR}/nginx
#make_folder $WAARDEPAPIEREN_SERVICE_DIR  #=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
#make_folder ${WAARDEPAPIEREN_SERVICE_CONFIG_DIR}#=${WAARDEPAPIEREN_SERVICE_DIR}/configuration


}

##################################################################
# Purpose: Procedure to stop - Running ... docker containers
# Arguments: 
# Return: 
##################################################################
git_init() {
   echo "-- Running ... git init"

#boscp08@boscp08-HP-Compaq-8510p:~/Dropbox/Github$ git init
#Initialized empty Git repository in /home/boscp08/Dropbox/Github/.git/
#  sudo apt install git 
git init
git config --global credential.helper store

git config --global user.name "peter-bosch"
git config --global user.name "ezahr"
git config --global user.password "P...r\!yyyy"

#git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git
#cd into 

}


##################################################################
# Purpose: remove alle containers 
# Arguments: 
# Return: 
##################################################################
docker_containers_stop() {
   echo "-- Running ... .. docker_containers_stop"
  docker stop  $(docker ps -a -q)
  
}

##################################################################
# Purpose:  remove alle containers and images d
# Arguments: 
# Return:   
##################################################################
docker_images_remove() {
  echo "-- Running ... .. docker_images_remove("

docker rm $(docker ps -a -q) && docker rmi $(docker images -q)

}

##################################################################
# Purpose:  remove all stopped containers (just waist of storage} 
# Arguments: 
# Return: 
##################################################################
docker_containers_prune() {
  echo "-- Running ... .. docker_containers_prune("
  docker container prune
}

##################################################################
# Purpose: Procedure to install Docker command line interface
# Arguments: 
# Return: 
##################################################################
install_docker_cli() {
  echo "-- Running ... .. install_docker_cli() "


#description	command
#1	install docker download	sudo install -y docker docker-common docker-client docker-compose
#2	enable docker daemon	systemctl enable docker
#3	and start docker daemon	systemctl start docker
#4	verify that docker daemon is active by running your first container	docker run hello-world
#but now as a 'normal' user
#g roupadd docker usermod -aG docker boscp08 systemctl restart docker docker run hello-world
}

##################################################################
# Purpose: Procedure to download azure command line interface
# Arguments: 
# Return: 
##################################################################
install_azure_cli() {
  echo "-- Running ... .. install_azure_cli"
udo apt-get update
  sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

#Down load en installeer de micro soft-handtekening sleutel:
#bash

curl -sL https://packages.microsoft.com/keys/microsoft.asc | 
    gpg --dearmor | 
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

}

##################################################################
# Purpose: Procedure to create azure resource group
# Arguments: 
# Return: 
##################################################################
create_azure_resource_group() {
echo "- Running ... create_azure_resource_group" 
 # $AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup4"
#echo sure ? createw $AZ_RESOURCE_GROUP
#enter_cont
az group create --name ${AZ_RESOURCE_GROUP} --location westeurope
}

##################################################################
# Purpose: Procedure to create the azure containergroup
# Arguments: 
# Return: 
##################################################################
create_azure_container_group() {
echo "- Running ... create_azure_container_group" 
cd ${PROJECT_DIR}

az container create --resource-group ${AZ_RESOURCE_GROUP} --file deploy-aci.yaml
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
 echo "- Running ... delete_azure_resource_group"
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

echo "Docker login"
docker login
create_logfile_header
echo "- Running ... docker_push "
echo "docker push $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG " >> $LOG_FILE
echo "docker push $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG " 
echo "https://hub.docker.com/repository/docker/boscp08/wwaardepapieren-clerk-frontend"    >>$LOG_FILE
docker push $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG         >> $LOG_FILE
create_logfile_footer

create_logfile_header
echo "docker push $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG "     >> $LOG_FILE   
echo "docker push $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG "     
echo "https://hub.docker.com/repository/docker/boscp08/waardepapieren-service"  >> $LOG_FILE
docker push $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG             >> $LOG_FILE   
create_logfile_footer

create_logfile_header
echo "docker push $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG"       >> $LOG_FILE
echo "docker push $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG"      
echo "https://hub.docker.com/repository/docker/boscp08/wwaardepapieren-mock-nlx"    >>$LOG_FILE
docker push $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG             >> $LOG_FILE
create_logfile_footer

if [ ${PROMPT} = true ] 
 then 
echo "shipping to docker hub is done LOG_FILE= $LOG_FILE  "
echo "or goto  https://hub.docker.com  docker-user=$DOCKER_USER with version=$DOCKER_VERSION_TAG  "
echo "https://hub.docker.com/repository/docker/$DOCKER_USER//wwaardepapieren-clerk-frontend"   
echo "https://hub.docker.com/repository/docker/$DOCKER_USER//waardepapieren-service"  
echo "https://hub.docker.com/repository/docker/$DOCKER_USER//wwaardepapieren-mock-nlx"    
# blader naar https://hub.docker.com  boscp08 P...!2...
#enter_cont
fi

}

##################################################################
# Purpose: Procedure to tag docker images (Version)
# Arguments: 
# Return: 
##################################################################
docker_tag() {
clear  
#docker images
#enter_cont

create_logfile_header
echo "- Running ... docker_tag"
echo "- Running ... docker_tag"  >> $LOG_FILE
docker tag waardepapieren_clerk-frontend $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG  
docker tag waardepapieren_waardepapieren-service $DOCKER_USER/waardepapieren-service:$DOCKER_VERSION_TAG 
docker tag waardepapieren_mock-nlx $DOCKER_USER/waardepapieren-mock-nlx:$DOCKER_VERSION_TAG          

docker images | grep  $DOCKER_VERSION_TAG   >> $LOG_FILE

create_logfile_footer
docker images | grep  $DOCKER_VERSION_TAG   
enter_cont


}


##################################################################
# Purpose:  Procedure to build the waardepapieren images and run containers.  
# Arguments: docker-compose -f docker-compose-travis.yml up
# Return: 
##################################################################
docker_compose_min_f_docker-travis_compose_yml_up() {

echo "- building with ... docker-compose -f docker-compose-travis.yml up $CMD_DOCKER_COMPOSE_BUILD "
echo ""


cd ${DOCKER_COMPOSE_DIR}
docker-compose -f docker-compose-travis.yml up $CMD_DOCKER_COMPOSE_BUILD

}

##################################################################
# Purpose: Procedure to save the program to the LOG_FILE
# Arguments: 
# Return: dokuwiki
##################################################################
write_az_clone_build_ship_deploy_bash() {
echo "| $LOG_START_DATE_TIME | ${GITHUB_DIR}|"                               >> $LOG_FILE
echo "| $LOG_START_DATE_TIME | az_clone_build_ship_deploy.bash |"            >> $LOG_FILE
echo  "<code>"                                                                >> ${LOG_FILE} 
cat  ${GITHUB_DIR}/az_clone_build_ship_deploy.bash                           >> $LOG_FILE
echo "</code>"                                                               >> $LOG_FILE
}

##################################################################
# Purpose: Procedure to clone de github repo on your pc
# Arguments: 
# Return: 
##################################################################
git_clone() {
 echo "- Running ... git_clone"
 echo "rm -rf ${PROJECT_DIR}/waardepapieren sure?"
 enter_cont
 cd ${PROJECT_DIR}
 rm -rf waardepapieren
 git clone https://github.com/discipl/waardepapieren.git
}

#/////////////////////////////////////////////////////////////////////////////////////////////
#######################
## M A I N
# program starts here actually 
#######################

echo "***"   
echo "***  Welcome to  docker-compose  "
echo "***"   
echo "***" download clone build run ship and deploy to AZURE CLOUD 
echo "***  You are about to start to build new waardepapieren images and containers "
echo "***  FQDN = https://${CERT_HOST_IP} "
echo "***  docker-tag = ${DOCKER_VERSION_TAG}"
echo "***  AZURE ACI-resourcegroup=${AZ_RESOURCE_GROUP}" 
echo "***" 


if [ ${PROMPT} = true ] 
 then 
clear
PROMPT=""
while true; do
    read -p "Do you still wish to see the contents of variables and modified files yn?" yn
    case $yn in
          [Yy]* ) PROMPT=true ; break;;
          [Nn]* ) PROMPT=false ;  break;;
        * ) echo "Please answer yes or no.";;
    esac
done

fi
 
if [ ${PROMPT} = true ] 
 then 

echo "#######################"
echo "## DOWNLOAD"  
echo "#######################"
echo "HOME_DIR="${HOME_DIR} 
echo "LOG_DIR="${LOG_DIR}  
echo "LOG_FILE="${LOG_FILE}  
echo "GITHUB_DIR="$GITHUB_DIR        # $HOME_DIR/Dropbox/Github/Waardepapieren-AZURE-ACI  #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
echo "PROJECT_DIR="${PROJECT_DIR}         #$HOME_DIR/Projects/scratch/virtual-insanity       #git clone https://github.com/disciplo/waardepapieren.git
enter_cont
clear
echo "DOCKER_COMPOSE_DIR="${DOCKER_COMPOSE_DIR}        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren
echo "CLERK_FRONTEND_DIR="${CLERK_FRONTEND_DIR}        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
echo "CLERK_FRONTEND_NGINX_DIR="${CLERK_FRONTEND_NGINX_DIR}        #${CLERK_FRONTEND_DIR}/nginx
#CLERK_FRONTEND_CYPRESS_DIR="$         #${CLERK_FRONTEND_DIR}/cypress
echo "WAARDEPAPIEREN_SERVICE_DIR="${WAARDEPAPIEREN_SERVICE_DIR}        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
echo "WAARDEPAPIEREN_SERVICE_CONFIG_DIR="${WAARDEPAPIEREN_SERVICE_CONFIG_DIR}       #${WAARDEPAPIEREN_SERVICE_DIR}/configuration
echo ""
enter_cont
clear
echo "#######################"
echo "## CLONE GITHUB" 
echo "#######################" 
echo "CMD_CONTAINER_STOP="$CMD_CONTAINER_STOP        #false
echo "CMD_IMAGE_REMOVE="$CMD_IMAGE_REMOVE         #false
echo "CMD_CONTAINER_PRUNE="$CMD_CONTAINER_PRUNE         #false
echo ""
echo "CMD_GIT_CLONE="${CMD_GIT_CLONE}       #false  #git clone https://github.com/disciplo/waardepapieren.git
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
echo "DOCKER_VERSION_TAG="${DOCKER_VERSION_TAG}       #"2.0"
echo "DOCKER_PUSH="${DOCKER_PUSH}         #true  #hub.docker.com 
echo ""
echo "#######################"
echo "## DEPLOY AZURE"
echo "#######################" 
echo "AZ_RESOURCE_GROUP="${AZ_RESOURCE_GROUP}       #"Discipl_Wigo4it_DockerGroup2"
echo "AZ_RESOURCE_GROUP_DELETE="$AZ_RESOURCE_GROUP_DELETE         #true
echo "AZ_RESOURCE_GROUP_CREATE="$AZ_RESOURCE_GROUP_CREATE        #true
echo "CREATE_AZ_DEPLOY_ACI_YAML="$CREATE_AZ_DEPLOY_ACI_YAML        #true  #@PROJECT_DIR deploy_aci.yml
echo "CMD_AZ_CREATE_CONTAINERGROUP="$CMD_AZ_CREATE_CONTAINERGROUP        #true  #.. jeuh - - Running ... ..
enter_cont

#echo "#######################"
#echo "## end of feedbak 
#echo "#######################" 
echo "" 
echo "" 
#echo "hope the run will be okay. "
#enter_cont
clear
fi

create_directories


#######################
## cLONING from github repo starts here.
#######################

if [ ${CMD_GIT_CLONE} = true ] 
  then git_clone 
fi 


if ! [ -d "${DOCKER_COMPOSE_DIR}" ]; 
  # Control will enter here if waardepapieren folder does not exits 
    then git_clone 

fi


#######################
## configuration Docker Compose   docker-compose -f docker-compose-travis.yml --build
#######################


if [ $SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME = true ]
  then docker_compose_travis_yml_with_volumes
fi 

if [ $SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME = true ]
  then docker_compose_travis_yml_without_volumes 
fi 


#######################
## configuration Docker files  docker build ... pending
#######################

if [ $SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME = true ]
  then clerk_frontend_dockerfile_with_volumes
fi 

if [ $SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME = true ]
  then waardepapieren_service_dockerfile_with_volumes 
fi 

if [ $SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME = true ]
  then clerk_frontend_dockerfile_without_volumes
fi 

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

#######################
## M A I N
#  docker build and run  starts here actually
#######################


if [ $CMD_DOCKER_COMPOSE = true ]
  then docker_compose_min_f_docker-travis_compose_yml_up # 
fi 

#if [ $CMD_DOCKER_BUILD = true ]
#  then  echo "PENDING"  nice to have docker-compose will do the work 


#######################
## M A I N
#  shipping tot docker repository starts here
#######################

if [ ${DOCKER_TAG} = true ]
  then docker_tag
fi 

if [ ${DOCKER_PUSH} = true ]
  then 
  #docker login  #Authenticating with existing credentials...
  docker_push  #check hub.docker.com
 fi 


#######################
## M A I N
#  deploy to portal.azure.com  starts here
#######################

if [ $CREATE_AZ_DEPLOY_ACI_YAML = true  ]
  then create_azure_deploy_aci_yaml
fi 

if [ $AZ_RESOURCE_GROUP_DELETE = true ]
  then 
  #az login\
  echo "***"   
  echo "***  Welcome to  deploy 2 AZURE"
  echo "***"   
  echo "***" 
  echo "***  You are about to delete resource group ${AZ_RESOURCE_GROUP}"
  echo "***" 
  echo "az login succeeded ?" 
  enter_cont
  delete_azure_resource_group
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

if [ $CMD_AZ_CREATE_CONTAINERGROUP = true ]
  then 
  #az logon
  echo "***"   
  echo "***  Welcome to  dockerhub2azure "
  echo "***"   
  echo "***" 
  echo "***  You are about to deploy waardepapieren images fromdockerhub to ACI AZURE Container Instances "
  echo "***  droplet-targethost= https://${CERT_HOST_IP}  with DOCKER_VERSION_TAG = ${DOCKER_VERSION_TAG}"
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
#create_logfile_footer
 

create_logfile_footer

echo
echo "hope the run will be ok!"
echo
enter_cont


if [ ${PROMPT} = true ] 
 then 
 write_az_clone_build_ship_deploy_bash
 cat $LOG_FILE | more
 fi 

echo " cd back into " $GITHUB_DIR
cd $GITHUB_DIR
clear


# eof