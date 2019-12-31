#! /bin/bash
# //////////////////////////////////////////////////////////////////////////////////////////
#   File Type   :- BASH Script (needs GIT-CLI,  docker-CLI and AZURE-CLI installed)
#  
#   Description :- This script builds "waardepapieren" containers and ships images to hub.docker.com and beyond to ACI
#   Modified           Date           Description
#   Peter Bosch       20.12.2019      processing technical dept
#   Peter Bosch       05.12.2019      Initial version.
#
# //////////////////////////////////////////////////////////////////////////////////////////
#  File:            :az_aci_clone_build_ship_deploy.bash
#  version          :20191204 v0
#  File Type        :Bash is a command processor that typically runs in a text window 
#                    Bash can also read and execute commands from a file, called a shell script.
#  Purpose          :download - Clone - Build - Ship - Deploy  @datafluisteraar
#  Title:           :cloutuh  
#  Category         :CI CD
#  Identificatie    :https://github.com/BoschPeter/AZ_ACI_waardepapieren-demo_westeurope_azurecontainer_io
#  main purpose of this script to show configuration for containers spinning in the cloud. 
#  https://waardepapieren-demo.discipl.org/    BSN=663678651
#  example Pim Otte
#  10dec 2:35 PM @Bas Als het goed is werkt https://waardepapieren-demo.discipl.org/
#  Ik had wel hier problemen met de ICTU firewall die het blokkeerde, ik moest met mijn telefoon op 4g om het werkend te krijgen
#  https://waardepapieren-demo.westeurope.cloudapp.azure.com  VM
#  https://waardepapieren-demo.westeurope.azurecontainer.io ACI
#  https://waardepapieren-demo.westeurope.azurecontainer.io ACI

# ===== INSTRUCTIONS ======
# 1. enter your variable ...
# 2. run a menu driven shell. 
# 3. run this script as follows 
#     chmod +x az_clone_build_ship_deploy.bash  
#     ./az_clone_build_ship_deploy.bash

# forked from https://github.com/discipl/waardepapieren.git read.ME
# Running
#
# The easiest way to run is using docker-compose:  ...but needs a (virtual) machine to run on. (no K8s no ACI)
#
# With docker compose you use a simple text file to define an application that consists of multiple Docker containers.
# You then run your application with a single command that does everything to implement your defined environment.
# This will start 3 applications:
#
# clerk-frontend
# waardepapieren-service, with embedded ephemeral-server
# nlx-mock, which is an nlx-outway that provides access to a mock BRP service
#
# Run docker-compose up#  Run docker-compose down  a.k.a restart.  stop /start
#
# Alternatively, you can use an offline mock, which replicates the NLX environment.
#
# Run docker-compose -f docker-compose-travis.yml up
# The clerk frontend will be available at https://localhost:443 on your local pc. 
# Below the cookbook to deploy your containers as a so called ACI Azure Container Instance. 
# simular to k8s pod ?

# This is done as follows:
# Set the environment variable CERT_HOST_IP is with an IP (or domain) that the validator app can use to reach the clerk-frontend container.  
# Ensure that the validator expo app runs on the same (wifi) network as the clerk frontend. (BSN=663678651)

# here we go
# ----------------------------------
# Step : Define variables
# ----------------------------------

if [ `uname` = 'Linux' ]
  then  HOME_DIR=/home/`whoami`   
  echo "linux"
fi  

if  [ `uname` = 'Darwin' ]
    then  HOME_DIR=/Users/`whoami`    
   echo "MacOs"
fi

if  [ `uname` = 'MING64_NT-10.0-18362' ]
    then  HOME_DIR=/c/Users/`whoami`    
   echo "Windows10  ... "
fi

#tt
GIT_PWD=Peter\!2020
DOCKER_PWD=Peter\!2020
AZURE_PWD=0lifanten

PROJECT_DIR=$HOME_DIR/Projects/scratch/virtual-insanity    
GIT_USER=BoschPeter
GIT_REPO=AZ_ACI_waardepapieren-demo_westeurope_azurecontainer_io  #see befores
GITHUB_DIR=$PROJECT_DIR/${GIT_REPO}   
DOCKER_USER="boscp08"  #NB repository name must be lowercase  Peter!2020
COMPOSE_BUILD_FLAG=" --build"
# You build a docker on your laptop and then you are the same as in production. That is why you should use containers btw docker is not fast
# Naming your containers

MOCK_NLX_IMAGE=waardepapieren_mock-nlx
SERVICE_IMAGE=waardepapieren_waardepapieren-service
CLERK_FRONTEND_IMAGE=waardepapieren_clerk-frontend
DOCKERHUB_MOCK_NLX_IMAGE=waardepapieren-mock-nlx
DOCKERHUB_SERVICE_IMAGE=waardepapieren-waardepapieren-service
DOCKERHUB_CLERK_FRONTEND_IMAGE=waardepapieren-clerk-frontend
#with 
DOCKER_VERSION_TAG="4.0"
# Application is the same everywhere on the DTAP street. DTAP is the most important. Pets & Cattle!
AZURE_USER=bosch.peter@outlook.com  
AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup4"  #waardepapierenVM
AZ_DNSNAMELABEL=discipl  

TARGET_HOST=azure_container_instance

 if [ "$TARGET_HOST" = "linux_VM" ]; then
       echo expression evaluated as linux_VM
       AZ_TLD=cloudapp.azure.com
 fi

if [ "$TARGET_HOST" = "azure_container_instance" ]; then
       echo expression evaluated as azure_container_instance
       AZ_TLD=azurecontainer.io
fi
pt
# REACT_APP_CERTIFICATE_HOST=https://discipl.westeurope.azurecontainer.io
# EPHEMERAL_ENDPOINT" : "https://discipl.westeurope.cloudapp.azure.com:3232",
# EPHEMERAL_WEBSOCKET_ENDPOINT" : "wss://discipl.westeurope.cloudapp.azure.com:3232"


#EPHEMERAL_RETENTION_TIME=86400  #24h 
EPHEMERAL_RETENTION_TIME=2592001 #30 dagen

CERT_HOST_IP=$AZ_DNSNAMELABEL.westeurope."$AZ_TLD"  #FQDN linux
CERT_HOST_IP_WP_SERVICE_HOSTNAME=$AZ_DNSNAMELABEL.westeurope.$AZ_TLD

#tt overrule
#CERT_HOST_IP=localhost  #FQDN linux
#CERT_HOST_IP_WP_SERVICE_HOSTNAME=localhost

# define your feedback her
PROMPT=true # echo parameters
DOUBLE_CHECK=true  #cat content modified files to ${LOG_DIR}
MENU=true
WRITE_CODE=true
#'********** end of parameters **********
#'Below the functions that are called by other functions
# modify at your own peril! because of configuration drift   100% generation

LOG_START_DATE_TIME=`date +%Y%m%d_%H_%M`  
LOG_DIR=${GITHUB_DIR}/LOG_DIR
LOG_FILE=${LOG_DIR}/LOG_${LOG_START_DATE_TIME}.log

the_world_is_flat=true
# ...do something interesting...
if  ! [ "$the_world_is_flat" = true ] ; then
    echo 'Be careful not to fall off!'
fi

#TIMEZONE="ENV TZ=Europe/Amsterdam"
APT_GET_UPDATE=RUN=apt-get update
APT_GET_INSTALL_NET_TOOLS=RUN apt-get install net-tools
APT_GET_INSTALL_IPUTILS_PING=RUN apt-get install iputils-ping


# ----------------------------------
# Step 2 : setters
# ----------------------------------

##################################################################
# Purpose: set docker-compose-travis.yml 
# Arguments: 
# Return: 
##################################################################
set_docker_compose_travis_yml_with_volumes() {
echo "-- Running:${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}
TT_INSPECT_FILE=docker-compose-travis.yml 
enter_touch ${FUNCNAME[0]} $@

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
    #driver: bridge" >  ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@
}

##################################################################
# Purpose: set docker-compose-travis.yml
# Arguments: 
# Return: 
##################################################################
set_docker_compose_travis_yml_without_volumes() {
echo "Running: ${FUNCNAME[0]} $@ "

TT_DIRECTORY=${GITHUB_DIR}
TT_INSPECT_FILE=docker-compose-travis.yml 
enter_touch ${FUNCNAME[0]} $@

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
      - 80:80" > ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@
}

##################################################################
# Purpose: set clerk-frontend Dockerfile
# Arguments: 
# Return: 
##################################################################
set_clerk_frontend_dockerfile_with_volumes() {
echo "Running: ${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}/clerk-frontend
TT_INSPECT_FILE=Dockerfile 
enter_touch ${FUNCNAME[0]} $@

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
ENV TZ=Europe/Amsterdam
RUN npm run build

FROM nginx:1.15.8
ADD nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app/build /usr/share/nginx/html"  > ${TT_INSPECT_FILE} #Dockerfile

check_check_doublecheck  ${FUNCNAME[0]} $@
}

##################################################################
# Purpose: modify mock-nlx.Dockerfile
# Arguments: 
# Return: 
##################################################################
set_mock_nlx_dockerfile() {  
echo "Running: ${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}/mock-nlx
TT_INSPECT_FILE=Dockerfile
enter_touch ${FUNCNAME[0]} $@
#enter_cont

echo "FROM node:10
RUN mkdir /app
ADD index.js package.json package-lock.json /app/
WORKDIR /app
$TIMEZONE
RUN npm install --production" > ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@
}

##################################################################
# Purpose: modify clerk-frontend.Dockerfile
# Arguments: 
# Return: 
##################################################################
set_clerk_frontend_dockerfile_without_volumes() {
echo "Running: ${FUNCNAME[0]} $@ "
TT_DIRECTORY=${GITHUB_DIR}/clerk-frontend
TT_INSPECT_FILE=Dockerfile 
enter_touch ${FUNCNAME[0]} $@
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
ENV TZ=Europe/Amsterdam
RUN npm run build

FROM nginx:1.15.8
ADD nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app/build /usr/share/nginx/html
#  volumes:
#    - ./clerk-frontend/nginx/certs:/etc/nginx/certs:rw
RUN mkdir /etc/nginx/certs
RUN apt-get update 
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools

ADD nginx/certs/org.crt /etc/nginx/certs/org.crt
ADD nginx/certs/org.key /etc/nginx/certs/org.key"  > ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@
}

##################################################################
# Purpose: hack into clerk-frontend build in nginx
# Arguments: 
# Return: 
##################################################################
set_clerk_frontend_nginx_conf() {
echo "Running: ${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}/clerk-frontend/nginx
TT_INSPECT_FILE=nginx.conf
enter_touch ${FUNCNAME[0]} $@
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
               proxy_pass https://${CERT_HOST_IP_WP_SERVICE_HOSTNAME}:3232/;    #pdf effect
           #     proxy_pass https://waardepapieren-service:3232/;
            #     proxy_pass https://172.19.0.3:3232/;
        }

        location /api/eph-ws {
           
              proxy_pass https://${CERT_HOST_IP_WP_SERVICE_HOSTNAME}:3232;   # pdf effect
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
}" > ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@ 

} 

##################################################################
# Purpose: hack into waardepapieren-servcie Dockerfile
# Arguments: 
# Return: 
##################################################################
set_waardepapieren_service_dockerfile_with_volumes() {
echo "Running: ${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}/waardepapieren-service
TT_INSPECT_FILE=Dockerfile
enter_touch ${FUNCNAME[0]} $@

echo "FROM node:10enter
RUN mkdir /app
ADD .babelrc package.json package-lock.json /app/
ADD src/* app/src/
ADD configuration/* app/configuration/
ENV WAARDEPAPIEREN_CONFIG /app/configuration/waardepapieren-config.json
ENV TZ=Europe/Amsterdam
WORKDIR /app
RUN npm install --production
CMD npm start"   > ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@
}

##################################################################
# Purpose: hack into waardepapieren-service Dockerfile
# Arguments: 
# Return: 
##################################################################
set_waardepapieren_service_dockerfile_without_volumes() {
echo "Running: ${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}/waardepapieren-service
TT_INSPECT_FILE=Dockerfile
enter_touch ${FUNCNAME[0]} $@

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
ENV TZ=Europe/Amsterdam
RUN apt-get update 
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools

RUN npm install --production
CMD npm start"  > ${TT_INSPECT_FILE} 
check_check_doublecheck  ${FUNCNAME[0]} $@
}

#----------------------------------------------
#--------------------------------------------


#################################################################
# Purpose: hack 
# Arguments: 
# Return: 
##################################################################
set_waardepapieren_service_config_compose_travis_json() {
echo "Running: ${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}/waardepapieren-service/configuration
TT_INSPECT_FILE=waardepapieren-config-compose_travis.json
enter_touch ${FUNCNAME[0]} $@

echo " {
   \"EPHEMERAL_ENDPOINT\" : \"https://${CERT_HOST_IP}:3232\",
   \"EPHEMERAL_WEBSOCKET_ENDPOINT\" : \"wss://${CERT_HOST_IP}:3232\",
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
} " > ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@
}

##################################################################
# Purpose: hack 
# Arguments: 
# Return: 
##################################################################
set_waardepapieren_service_config_compose_json() {
echo "Running: ${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}/waardepapieren-service/configuration
TT_INSPECT_FILE=waardepapieren-config-compose.json
enter_touch ${FUNCNAME[0]} $@

echo " {
   \"EPHEMERAL_ENDPOINT\" : \"https://${CERT_HOST_IP}:3232\",
   \"EPHEMERAL_WEBSOCKET_ENDPOINT\" : \"wss://${CERT_HOST_IP}:3232\",
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

check_check_doublecheck  ${FUNCNAME[0]} $@
}

##################################################################
# Purpose: 
# Arguments: 
# Return: 
##################################################################
set_waardepapieren_service_config_json() {
echo "Running: ${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}/waardepapieren-service/configuration
TT_INSPECT_FILE=waardepapieren-config.json
enter_touch ${FUNCNAME[0]} $@

echo " {
   \"EPHEMERAL_ENDPOINT\" : \"https://${CERT_HOST_IP}:3232\",
   \"EPHEMERAL_WEBSOCKET_ENDPOINT\" : \"wss://${CERT_HOST_IP}:3232\",
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
} " > ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@
}


##################################################################
# Purpose: hack into azure deploy ACI
# Arguments: 
# Return: 
##################################################################
create_azure_deploy_aci_yaml() {
echo "Running:${FUNCNAME[0]} $@"
TT_DIRECTORY=${GITHUB_DIR}
TT_INSPECT_FILE=deploy-aci.yaml
enter_touch ${FUNCNAME[0]} $@

echo "location: westeurope
name: $AZ_RESOURCE_GROUP
properties:
  containers:
  - name: ${MOCK_NLX_IMAGE}
    properties:
      image: ${DOCKER_USER}/${DOCKERHUB_MOCK_NLX_IMAGE}:${DOCKER_VERSION_TAG}
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 80
  - name: ${SERVICE_IMAGE}
    properties:
      image: ${DOCKER_USER}/${DOCKERHUB_SERVICE_IMAGE}:${DOCKER_VERSION_TAG}
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 3232
      - port: 3233
  - name: ${CLERK_FRONTEND_IMAGE}
    properties:
      image: ${DOCKER_USER}/${DOCKERHUB_CLERK_FRONTEND_IMAGE}:${DOCKER_VERSION_TAG}
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
      port: '3233' 
    - protocol: tcp
      port: '80'    
    - protocol: tcp
      port: '8880'      
tags: null
type: Microsoft.ContainerInstance/containerGroups" > ${TT_INSPECT_FILE} 

check_check_doublecheck  ${FUNCNAME[0]} $@
}
# -----------------------------------
# Main logic  below
# ------------------------------------
#'# Structured programming:
#'# Entire program logic modularized in User defined function

the_world_is_flat=true
# ...do something interesting...
if ! [ "$the_world_is_flat" = true ] ; then
    echo 'Be careful not to fall off!'
fi

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
    echo $JOB_START_DATE_TIME - BEGIN JOB:                                             >> ${LOG_FILE}
    echo ----------------------------------------------------------------------------- >> ${LOG_FILE}
    echo $1 $2                                                                         >> ${LOG_FILE}
    echo ----------------------------------------------------------------------------- >> ${LOG_FILE}
    }

# /////////////////////////////////////////////////////////////////////////////////
#  Create a Footer in the logfile
# /////////////////////////////////////////////////////////////////////////////////
create_logfile_footer() {
    JOB_END_DATE_TIME=`date +%Y%m%d_%H_%M`
    echo $JOB_END_DATE_TIME - END JOB :                                                >> ${LOG_FILE}
    echo ----------------------------------------------------------------------------- >> ${LOG_FILE}
    echo $1 $2                                                                         >> ${LOG_FILE}
    echo ----------------------------------------------------------------------------- >> ${LOG_FILE}
    }

##################################################################
# Purpose: Procedure to create directories specified
# Arguments: 
# Return: To check if a directory exists in a shell script you can use the following:
##################################################################
create_logdir() {
if ! [ -d "${LOG_DIR}" ]; then
  cd $PROJECT_DIR
  sduo chmod -R 777  ${GITHUB_DIR}
  mkdir  ${LOG_DIR}
fi 
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
enter_touch() {
cd ${TT_DIRECTORY}
touch ${TT_INSPECT_FILE}
}

##################################################################
# Purpose:   procedure 
# Arguments: 
# Return: 
##################################################################
check_check_doublecheck() {
if [ ${DOUBLE_CHECK} =  true ]
#echo "check check double check"
#enter_cont

then enter_inspect $1
fi 
TT_DIRECTORY=""
TT_INSPECT_FILE=""
}

##################################################################
# Purpose:   show content of Dockerfile/ configfiles. 
# Arguments: 
# Return: 
##################################################################
enter_inspect() {
clear

if [ -f "${TT_INSPECT_FILE}" ]; 
then
 
echo "| ${LOG_START_DATE_TIME} | ${TT_INSPECT_FILE}|"                                >> ${LOG_FILE} 
echo "| ${LOG_START_DATE_TIME} | ${TT_DIRECTORY} |"                                  >> ${LOG_FILE}
echo "<code>"                                                                        >> ${LOG_FILE}
cat  ${TT_INSPECT_FILE}                                                              >> ${LOG_FILE}
#echo "<\/code>"                                                                     >> ${LOG_FILE}
create_logfile_footer

else 
cd ${GITHUB_DIR}
clear
echo "File ${TT_INSPECT_FILE} is missing or cannot be executed"   
enter_cont
fi

if [ ${PROMPT} = true ] 
then 
clear

echo ""
echo "========="
pathname=${TT_DIRECTORY}
echo "enter inspect : ${TT_INSPECT_FILE} " 
echo "folder        = $(basename $pathname) "
echo "directory     = $pathname "
echo "repo          = $GITHUB_DIR "
echo "function      = $1 "
echo "========="
echo ""
cd ${TT_DIRECTORY}
cat ${TT_INSPECT_FILE} 
echo ""
echo "========="
pathname=${TT_DIRECTORY}
echo "enter inspect : ${TT_INSPECT_FILE} " 
echo "folder        = $(basename $pathname) "
echo "directory     = $pathname "
echo "repo          = $GITHUB_DIR "
echo "function      = $1 "
echo "========="

enter_cont

cd $GITHUB_DIR


fi

}

##################################################################
# Purpose: create directories if neccecary.
# Arguments: 
# Return: specified directory structure
##################################################################
create_directories() {
make_folder ${PROJECT_DIR}     
}

##################################################################
# Purpose: DOWNLOAD-FUNCTIONS
##################################################################

##################################################################
# Purpose: show version
# Arguments: 
# Return: 
##################################################################
show_version() {
create_logfile_header ${FUNCNAME[0]} $@
echo "Running:${FUNCNAME[0]} $@"
 echo "git --version"
 git --version

 echo "docker -v  "
 docker -v
 
 echo "docker-compose -v "
 docker-compose -v 
 
 echo "az -v"
 az -v
 
 enter_cont
 
}

##################################################################
# Purpose: Procedure to install Docker command line interface
# Arguments: 
# Return: 
##################################################################
install_docker_cli() {
echo "-Running: ${FUNCNAME[0]} $@ "

#description	command
#1	install docker download	sudo install -y docker docker-common docker-client docker-compose
#2	enable docker daemon	systemctl enable docker
#3	and start docker daemon	systemctl start docker
#4	verify that docker daemon is active by running your first container	docker run hello-world
#but now as a 'normal' user
#g roupadd docker usermod -aG docker boscp08 systemctl restart docker docker run hello-world
#systemctl restart docker
}

##################################################################
# Purpose: Procedure to download azure command line interface
# Arguments: 
# Return: 
##################################################################
install_azure_cli() {
echo "-Running: ${FUNCNAME[0]} $@"
sudo apt-get update
  sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

#Down load en installeer de micro soft-handtekening sleutel:
#bash
#linux
curl -sL https://packages.microsoft.com/keys/microsoft.asc | 
    gpg --dearmor | 
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

#windows
}

##################################################################
# Purpose: CLONE-FUNCTIONS   
##################################################################

##################################################################
# Purpose: Procedure to stop Running: docker containers
# Arguments: 
# Return: 
##################################################################
git_init() {
echo "Running:${FUNCNAME[0]} $@"

#boscp08@boscp08-HP-Compaq-8510p:~/Dropbox/Github$ git init
#Initialized empty Git repository in /home/boscp08/Dropbox/Github/.git/
#  sudo apt install git 
# https://www.howtoforge.com/tutorial/install-git-and-github-on-ubuntu/
git init

#git config --global credential.helper store
#git config user.name "BoschPeter"

git config --global user.email "bosch.peter@icloud.com"
git config --global user.name "BoschPeter"
git config --global user.password "Peter\!2020"

# git config --global user.name "ezahr"
#git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git
#cd into 

}

#################################################
# Purpose: Procedure concurrent version system
# Arguments: 
# Return: 
##################################################################

git_init() {
echo "Running:${FUNCNAME[0]} $@"
cd $GITHUB_DIR
git init
#Initialized empty Git repository in /home/boscp08/Dropbox/Github/.git/
git config --global credential.helper store
git config --global user.email "bosch.peter@icloud.com"
#git config --global user.name "BoschPeter"
git config --global user.name "Ezahr"
git config --global user.password "Peter\!2020"  #mind macos keyring
git config --list
git config --get remote.origin.Uittreksel
git config credential.username --global "Ezahr"
git config credential.password --global "Peter\!2020"

}

##################################################################
# Purpose: Procedure to clone de github repo on your pc
# Arguments: 
# Return: 
##################################################################

git_clone() {
 echo "Running:${FUNCNAME[0]} $@"
 create_logfile_header ${FUNCNAME[0]} $@
 echo "rm -rf ${PROJECT_DIR}/$1 sure?"
 enter_cont
 cd ${PROJECT_DIR}
 rm -rf ${GIT_REPO}
 #git clone https://github.com/discipl/waardepapieren.git
 #git clone https://github.com/AZ_VM_waardepapieren-demo_westeurope_cloudapp_azure_com.git
 #git clone https://github.com/BoschPeter/AZ_ACI_waardepapieren-demo_westeurope_azurecontainer_io.git
 git clone https://github.com/${GIT_REPO}.git  
 
 create_logfile_footer
}

##################################################################
# Purpose: DOCKER_BUILD-FUNCTIONS
##################################################################

##################################################################
# Purpose:  docker system prune -a
# Arguments: 
# Return:   remove all docker objects  starting from scratch... 
##################################################################
docker_system_prune() {
echo "Running:${FUNCNAME[0]} $@"
docker system prune -a   
}

##################################################################
# Purpose: remove alle containers 
# Arguments: 
# Return: 
##################################################################
docker_containers_stop() {
echo "-Running:${FUNCNAME[0]} $@"
docker stop  $(docker ps -a -q)
}

##################################################################
# Purpose:  remove alle containers and images d
# Arguments: 
# Return:   
##################################################################
docker_images_remove() {
echo "Running:${FUNCNAME[0]} $@"
docker rm $(docker ps -a -q) && docker rmi $(docker images -q)
}

##################################################################
# Purpose:  remove all stopped containers (just waist of storage} 
# Arguments: 
# Return: 
##################################################################
docker_containers_prune() {
echo "Running:${FUNCNAME[0]} $@"
docker container prune -a   
}

##################################################################
# Purpose:  Procedure to build the waardepapieren images and run containers.  
# Arguments: docker-compose -f docker-compose-travis.yml up   (docker-compose=thirdparty tool)
# Return: 3 containers  
##################################################################
docker_compose_min_f_docker-travis_compose_yml_up() {
echo "Running:${FUNCNAME[0]} $@"
cd ${DOCKER_COMPOSE_DIR}
docker-compose -f docker-compose-travis.yml up $COMPOSE_BUILD_FLAG

}
#################################################################
# Purpose:  Procedure to build the mock-nlx image
# Arguments: docker_build_image mock-nlx boscp08 waardepapieren_mock_nlx 1.0 
# Arguments: docker_build_image mock-nlx ${DOCKER_USER} ${MOCK_NLX_IMAGE} ${DOCKER_VERSION_TAG} 
# Return: image
##################################################################

docker_build_image() {
echo "Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
arg1=$1 #mock-nlx
arg1=$2 #${DOCKER_USER}
arg2=$3 #${MOCK_NLX_IMAGE}
arg3=$4 #${DOCKER_VERSION_TAG}
cd ${GITHUB_DIR}/$1
docker build -t $2/$3 .  #mind the dot!
cd ${GITHUB_DIR}  #cd -
}

#################################################################
# Purpose:  Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
# Arguments: docker_tag boscp08  waardepapieren_mock-nlx 4.0 
# Return: image
##################################################################
docker_tag_image() {
echo "Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
#docker tag waardepapieren_clerk-frontend $DOCKER_USER/waardepapieren-clerk-frontend:$DOCKER_VERSION_TAG
#docker tag ${DOCKER_USER}/$MOCK_NLX_IMAGE:latest ${DOCKER_USER}/${DOCKERHUB_MOCK_NLX_IMAGE}:${DOCKER_VERSION_TAG}
arg1=$1 #${DOCKER_USER}
arg2=$2 #${MOCK_NLX_IMAGE}
arg3=$3 #${DOCKERHUB_MOCK_NLX_IMAGE}
arg4=$4 #${DOCKER_VERSION_TAG}
docker tag $1/$2:latest $1/$3:$4
}  


##################################################################
# Purpose:  Build an image from a Dockerfile
# Arguments: docker build -t boscp08/waardepapieren-service .   NB [.] periode means from this directory 
# Return: 
##################################################################
docker_build_waardepapieren_service()  {
echo "Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
cd ${GITHUB_DIR}/waardepapieren-service
docker build -t ${DOCKER_USER}/waardepapieren-service .  #NB [.] periode means from this directory 
}

##################################################################
# Purpose:  Procedure to build the waardepapieren images and run containers.  
# Arguments: docker build -t boscp08/     NB . periode means from this directory 
# Return: 
##################################################################
docker_build_clerk_frontend() {
echo "Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
cd ${GITHUB_DIR}/clerk-frontend
docker build -t ${DOCKER_USER}/clerk-frontend .  #NB [.] periode means from this directory 
}

##################################################################
# Purpose:  Procedure to build the waardepapieren images and run containers.  
# Arguments: docker build -t boscp08/waardepapieren_mock-nlx     NB . periode means from this directory 
# Return: 
##################################################################
docker_build_waardepapieren() {
echo "Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
docker_build_image mock-nlx  ${DOCKER_USER} ${MOCK_NLX_IMAGE} ${DOCKER_VERSION_TAG}  
docker_build_image waardepapieren-service ${DOCKER_USER} ${SERVICE_IMAGE} ${DOCKER_VERSION_TAG}  
docker_build_image clerk-frontend ${DOCKER_USER} ${CLERK_FRONTEND_IMAGE} ${DOCKER_VERSION_TAG}  
}

##################################################################
# Purpose:  Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
# Arguments: docker tag -t boscp08/waardepapieren_clerk-frontend    
# Return: 
##################################################################
docker_tag_waardepapieren() {
echo "Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
docker_tag_image  ${DOCKER_USER} ${MOCK_NLX_IMAGE} ${DOCKER_VERSION_TAG}  
docker_tag_image  ${DOCKER_USER} ${SERVICE_IMAGE} ${DOCKER_VERSION_TAG}  
docker_tag_image  ${DOCKER_USER} ${CLERK_FRONTEND_IMAGE} ${DOCKER_VERSION_TAG}  
docker images | grep  ${DOCKER_VERSION_TAG}   
enter_cont
}

##################################################################
# Purpose:  Push an image or a repository to a registry
# Arguments: docker push -t boscp08/waardepapieren_service   
# Return: Ship to docker registry docker.hub.com
##################################################################
docker_push_waardepapieren() {
echo "Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
docker_push_image  ${DOCKER_USER} ${MOCK_NLX_IMAGE} ${DOCKER_VERSION_TAG}  
docker_push_image  ${DOCKER_USER} ${SERVICE_IMAGE} ${DOCKER_VERSION_TAG}  
docker_push_image  ${DOCKER_USER} ${CLERK_FRONTEND_IMAGE} ${DOCKER_VERSION_TAG} 
create_logfile_footer
}

##################################################################
# Purpose:  Push an image or a repository to a registry
# Arguments: docker push -t boscp08/waardepapieren_service   
# Return: Ship to docker registry docker.hub.com
##################################################################
docker_commit_waardepapieren() {
echo "Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
docker commit ${MOCK_NLX_IMAGE} ${DOCKER_USER}/${DOCKERHUB_MOCK_NLX_IMAGE}:${DOCKER_VERSION_TAG}  
docker commit ${SERVICE_IMAGE} ${DOCKER_USER}/${DOCKERHUB_SERVICE_IMAGE}:${DOCKER_VERSION_TAG} 
docker commit ${CLERK_FRONTEND_IMAGE} ${DOCKER_USER}/${DOCKER_HUB_CLERK_FRONTEND_IMAGE}:${DOCKER_VERSION_TAG}          
create_logfile_footer
}

##################################################################
# DEPLOY-FUNCTIONS 2AZURE FROM DOCKER-HUB   
##################################################################

##################################################################
# Purpose: Procedure to create azure resource group aka costcenter/root
# Arguments: 
# Return: 
##################################################################
create_azure_resource_group() {
echo "-- Running:${FUNCNAME[0]} $@"
create_logfile_header ${FUNCNAME[0]} $@
az login -u $AZURE_USER  -p $AZURE_PWD
#az group create --name $AZ_RESOURCE_GROUP --location westeurope
az group create --name $1 --location westeurope
enter_cont
}

##################################################################
# Purpose: Procedure to delete azure resource group (a.k.a costcentre )
# Arguments: 
# Return: 
##################################################################
delete_azure_resource_group() {
echo "-- Running:${FUNCNAME[0]} $@ "
create_logfile_header ${FUNCNAME[0]} $@
az login -u $AZURE_USER  -p $AZURE_PWD
#az group delete --name $AZ_RESOURCE_GROUP
az group delete --name $1
enter_cont
}

##################################################################
# Purpose: Procedure to create the azure containergroup
# Arguments: 
# Return: 
##################################################################
create_azure_container_group() {
echo "-- Running:${FUNCNAME[0]} $@"
az login -u $AZURE_USER  -p $AZURE_PWD
cd ${GITHUB_DIR}
#az container create --resource-group $AZ_RESOURCE_GROUP --file deploy-aci.yaml
az container create --resource-group $1 --file deploy-aci.yaml

enter_cont
# https://docs.microsoft.com/en-us/azure/container-instances/container-instances-multi-container-yaml
# View deployment state
# az container show --resource-group ${AZ_RESOURCE_GROUP} --name myContainerGroup --output table
}

##################################################################
# Purpose: az_container_show
# Arguments: 
# Return: CI CD 
##################################################################
az_container_show() {
echo "-- Running:${FUNCNAME[0]} $@"  
#az container show --resource-group ${AZ_RESOURCE_GROUP} --name $2 --output table
az container show --resource-group $1--name $2 --output table
}

##################################################################
# Purpose: Procedure to create the azure containergroup
# Arguments: 
# Return: CI CD 
##################################################################
restart_azure_container_group() {
echo "Running: create_azure_container_group" 
cd ${PROJECT_DIR}
#az container restart --resource-group ${AZ_RESOURCE_GROUP}
az container restart --resource-group $1
}

##################################################################
# Purpose: Procedure to clone build run ship and deploy 
# Arguments: 
# Return: the whole_sjebang
##################################################################
the_whole_sjebang() {
create_logfile_header

write_az_clone_build_ship_deploy_bash   
#docker_system_prune -a
set_docker_compose_travis_yml_without_volumes
set_clerk_frontend_dockerfile_without_volumes
set_waardepapieren_service_dockerfile_without_volumes
set_mock_nlx_dockerfile

docker_build_image mock-nlx  ${DOCKER_USER} ${MOCK_NLX_IMAGE} ${DOCKER_VERSION_TAG}  
docker_build_image waardepapieren-service ${DOCKER_USER} ${SERVICE_IMAGE} ${DOCKER_VERSION_TAG}  
docker_build_image clerk-frontend ${DOCKER_USER} ${CLERK_FRONTEND_IMAGE} ${DOCKER_VERSION_TAG}  

docker_tag_image  ${DOCKER_USER} ${MOCK_NLX_IMAGE} ${DOCKERHUB_MOCK_NLX_IMAGE} ${DOCKER_VERSION_TAG}  
docker_tag_image  ${DOCKER_USER} ${SERVICE_IMAGE} ${DOCKERHUB_SERVICE_IMAGE} ${DOCKER_VERSION_TAG}  
docker_tag_image  ${DOCKER_USER} ${CLERK_FRONTEND_IMAGE} ${DOCKERHUB_CLERK_FRONTEND_IMAGE} ${DOCKER_VERSION_TAG}  

docker login -u $DOCKER_USER -p $DOCKER_PWD  # temporarily
docker_push_image  ${DOCKER_USER} ${DOCKERHUB_MOCK_NLX_IMAGE} ${DOCKER_VERSION_TAG}  
docker_push_image  ${DOCKER_USER} ${DOCKERHUB_SERVICE_IMAGE} ${DOCKER_VERSION_TAG}  
docker_push_image  ${DOCKER_USER} ${DOCKERHUB_CLERK_FRONTEND_IMAGE} ${DOCKER_VERSION_TAG}  

az login -u $AZURE_USER -p $AZURE_PWD  # temporarilyß
delete_azure_resource_group  $AZ_RESOURCE_GROUP
create_azure_resource_group  $AZ_RESOURCE_GROUP
create_azure_container_group $AZ_RESOURCE_GROUP
create_logfile_footer
#   14) restart_azure_container_group ;;
}


##################################################################
# Purpose: Firefox Start Browser From The Command Line
# Arguments: 
# Return: website  
###############################################################

bookmark_open() {

#URL=https://github.com/BoschPeter/$GIT_REPO

if [ `uname` = 'Linux' ]
  then  /usr/bin/firefox  $1
  #echo "linux"
fi  

if  [ `uname` = 'Darwin' ]
    then  open -a Firefox $1
   #echo "MacOs"
fi
}

##################################################################
# Purpose: Procedure to save the program to the LOG_FILE
# Arguments: 
# Return: dokuwiki 
##################################################################
write_az_clone_build_ship_deploy_bash() {

echo "====== az_clone_build_ship_deploy.bash ======"                         >> ${LOG_FILE}
echo "| ${LOG_START_DATE_TIME} | ${GITHUB_DIR}|"                             >> ${LOG_FILE}
echo "| ${LOG_START_DATE_TIME} | az_clone_build_ship_deploy.bash |"          >> ${LOG_FILE}
echo  "<code>"                                                               >> ${LOG_FILE} 
cat  ${GITHUB_DIR}/az_aci_clone_build_ship_deploy.bash                       >> ${LOG_FILE}
echo "</code>"                                                               >> ${LOG_FILE}
echo "====== menu.bash  ======"                                              >> ${LOG_FILE}
echo "| ${LOG_START_DATE_TIME} | ${GITHUB_DIR}|"                             >> ${LOG_FILE}
echo "| ${LOG_START_DATE_TIME} | menu.bash |"                                >> ${LOG_FILE}
echo  "<code>"                                                               >> ${LOG_FILE} 
cat  ${GITHUB_DIR}/menu.bash                                                 >> ${LOG_FILE}
#echo "</code>"                                                               >> ${LOG_FILE}

}
#######################
## M A I N
# program starts here actually
#######################

echo "***"   
echo "***  Welcome to  docker build   "
echo "***"   
echo "*** You are about to start to build new waardepapieren images and containers "
echo "***  FQDN = https://${CERT_HOST_IP} "
echo "***  docker-tag = ${DOCKER_VERSION_TAG}"
echo "***  AZURE ACI-resourcegroup=${AZ_RESOURCE_GROUP}" 
echo "***" 
create_logdir
create_directories
create_logfile_header
echo "#######################"                                                >> ${LOG_FILE}
echo "## variables"                                                           >> ${LOG_FILE}
echo "#######################"                                                >> ${LOG_FILE}
echo "PROJECT_DIR=$PROJECT_DIR"                                               >> ${LOG_FILE}
echo "GIT_USER=$GIT_USER"                                                     >> ${LOG_FILE}
echo "GIT_REPO=$GIT_REPO"                                                     >> ${LOG_FILE}
echo "GITHUB_DIR=$GITHUB_DIR"                                                 >> ${LOG_FILE}
echo "DOCKER_USER=$DOCKER_USER"                                               >> ${LOG_FILE}
echo "COMPOSE_BUILD_FLAG=$COMPOSE_BUILD_FLAG"                                 >> ${LOG_FILE}
echo "MOCK_NLX_IMAGE=$MOCK_NLX_IMAGE"                                         >> ${LOG_FILE}
echo "SERVICE_IMAGE=$SERVICE_IMAGE"                                           >> ${LOG_FILE}
echo "CLERK_FRONTEND_IMAGE=$CLERK_FRONTEND_IMAGE"                             >> ${LOG_FILE}
echo "DOCKERHUB_MOCK_NLX_IMAGE=$DOCKERHUB_MOCK_NLX_IMAGE"                     >> ${LOG_FILE}
echo "DOCKERHUB_SERVICE_IMAGE=$DOCKERHUB_SERVICE_IMAGE"                       >> ${LOG_FILE}
echo "DOCKERHUB_CLERK_FRONTEND_IMAGE=$DOCKERHUB_CLERK_FRONTEND_IMAGE"         >> ${LOG_FILE}
echo "DOCKER_VERSION_TAG=$DOCKER_VERSION_TAG"                                 >> ${LOG_FILE}
echo "AZ_RESOURCE_GROUP=$AZ_RESOURCE_GROUP"                                   >> ${LOG_FILE}
echo "AZ_DNSNAMELABEL=$AZ_DNSNAMELABEL"                                       >> ${LOG_FILE}
echo "TARGET_HOST=$TARGET_HOST"                                               >> ${LOG_FILE}
echo "AZ_TLD=$AZ_TLD"                                                         >> ${LOG_FILE}
echo "TIMEZONE=$TIMEZONE"                                                     >> ${LOG_FILE}
echo "CERT_HOST_IP=$CERT_HOST_IP"                                             >> ${LOG_FILE}
echo "CERT_HOST_IP_WP_SERVICE_HOSTNAME=$CERT_HOST_IP_WP_SERVICE_HOSTNAME"     >> ${LOG_FILE}
echo "#######################"                                                >> ${LOG_FILE}
echo "## variables"                                                           >> ${LOG_FILE}
echo "#######################"                                                >> ${LOG_FILE}


##################################################################
# Purpose: Display all variables
# Arguments: 
# Return: variables
##################################################################
if [ ${PROMPT} = true ] 
 then 
#clear
PROMPT=""
while true; do
    read -p "Display all variables  (y or n)?" yn
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
echo "## variables"
echo "#######################"
echo "PROJECT_DIR=$PROJECT_DIR"                                               #=$HOME_DIR/Projects/scratch/virtual-insanity    
echo "GIT_USER=$GIT_USER"                                                     #=BoschPeter
echo "GIT_REPO=$GIT_REPO"                                                     #=AZ_ACI_waardepapieren-demo_westeurope_azurecontainer_io  #see befores
echo "GITHUB_DIR=$GITHUB_DIR"                                                 #=$PROJECT_DIR/${GIT_REPO}   #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
echo "DOCKER_USER=$DOCKER_USER"                                               #="boscp08"  #NB repository name must be lowercase  
echo "COMPOSE_BUILD_FLAG=$COMPOSE_BUILD_FLAG"                                 #=" --build"
echo "MOCK_NLX_IMAGE=$MOCK_NLX_IMAGE"                                         #=waardepapieren_mock-nlx
echo "SERVICE_IMAGE=$SERVICE_IMAGE"                                           #=waardepapieren_waardepapieren-service
echo "CLERK_FRONTEND_IMAGE=$CLERK_FRONTEND_IMAGE"                             #=waardepapieren_clerk-frontend
echo "DOCKERHUB_MOCK_NLX_IMAGE=$DOCKERHUB_MOCK_NLX_IMAGE"                     #=waardepapieren-mock-nlx
echo "DOCKERHUB_SERVICE_IMAGE=$DOCKERHUB_SERVICE_IMAGE"                       #=waardepapieren-waardepapieren-service
echo "DOCKERHUB_CLERK_FRONTEND_IMAGE=$DOCKERHUB_CLERK_FRONTEND_IMAGE"         #=waardepapieren-clerk-frontend
echo "DOCKER_VERSION_TAG=$DOCKER_VERSION_TAG"                                 #="4.0"
echo "AZURE_USER=$AZURE_USER"                                                 #=bosch.peter@outlook.com  
echo "AZ_RESOURCE_GROUP=$AZ_RESOURCE_GROUP"                                   #="Discipl_Wigo4it_DockerGroup4"  #waardepapierenVM
echo "AZ_DNSNAMELABEL=$AZ_DNSNAMELABEL"                                       #=discipl  
echo "TARGET_HOST=$TARGET_HOST"                                               #=azure_container_instance
echo "AZ_TLD=$AZ_TLD"                                                         #=cloudapp.azure.com
echo "TIMEZONE=$TIMEZONE"                                                     #=""
echo "EPHEMERAL_RETENTION_TIME=$EPHEMERAL_RETENTION_TIME"                     #=2592001 #30 dagen
echo "CERT_HOST_IP=$CERT_HOST_IP"                                             #=$AZ_DNSNAMELABEL.westeurope."$AZ_TLD"  #FQDN linux
echo "CERT_HOST_IP_WP_SERVICE_HOSTNAME=$CERT_HOST_IP_WP_SERVICE_HOSTNAME"     #=$AZ_DNSNAMELABEL.westeurope.$AZ_TLD
echo "DOUBLE_CHECK=$DOUBLE_CHECK"                                             #=true  #cat content modified files to ${LOG_DIR}
echo "MENU=$MENU"                                                             #=true
enter_cont
clear

fi


##################################################################
# Purpose: Display MAIN-MENU
# Arguments: 
# Return: variables
##################################################################

if [ ${MENU} = true ] 
 then 
clear
while true; do
    read -p "goto MAIN-MENU (y or n)" yn
    case $yn in
          [Yy]* ) MENU=true ; break;;
          [Nn]* ) MENU=false ;  break;;
        * ) echo "Please answer yes or no.";;
    esac
done
fi


if [ $MENU = true ]
then
# A menu driven shell script 
#echo "A menu is nothing but a list of commands presented to a user by a shell script"

# ----------------------------------
# Step: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
} 
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "# ----------------------------------"
    echo "Step 1: prune "
    echo "# ----------------------------------"
    echo "#10. Reset (docker system prune-a)"
    echo "# ----------------------------------"
    echo "Step 2:   Dockerfile setters"
    echo "# ----------------------------------"
    echo "20. set_docker_compose_travis_yml_without_volumes"
    echo "21. set_clerk_frontend_dockerfile_without_volumes" 
    echo "22. set_waardepapieren_service_dockerfile_without_volumes"
    echo "23. set_mock_nlx_dockerfile"    
    echo "# ----------------------------------"
    echo "#Step 3 : Networking setters" 
    echo "# ----------------------------------" 
    echo "30. set_clerk_frontend_nginx_conf"
    echo "31. set_waardepapieren_service_config_compose_travis_json"
    echo "32. set_waardepapieren_service_config_compose_json"
    echo "33. set_waardepapieren_service_config_json"
    echo "# ----------------------------------" 
    echo "#step 4: docker-compose  docker build "
    echo "# ----------------------------------"
    echo "40. docker_compose -f docker-compose-travis.yml up $COMPOSE_BUILD_FLAG" 
    echo "41. docker_build_image $MOCK_NLX_IMAGE"
    echo "42. docker_build_image $SERVICE_IMAGE "
    echo "43. docker_build_image $CLERK_FRONTEND_IMAGE "
    echo "44. docker_tag_images $DOCKER_VERSION_TAG"
    echo "45. docker_push_images $DOCKER_VERSION_TAG"
    echo "# ----------------------------------"
    echo "#step 5: azure  "
    echo "# ----------------------------------"
    echo "50. delete_azure_resource_group $AZ_RESOURCE_GROUP "
    echo "51. create_azure_resource_group $AZ_RESOURCE_GROUP"
    echo "52. create_azure_container_group $AZ_RESOURCE_GROUP"
    echo "53. restart_azure_container_group $AZ_RESOURCE_GROUP  a.ka. (re) pull docker hub"
    echo "# ----------------------------------"
    echo "#step 6 check check triple check  clone build ship deploy "
    echo "# ----------------------------------" 
    echo "60. https://github.com/BoschPeter/$GIT_REPO "   
    echo "61. https://hub.docker.com/?ref=login' boscp08 Peter!...."   #Ship
  	echo "62. https://portal.azure.com/#home' "
    echo "63. https://$CERT_HOST_IP:443  " #hope the clerk frontend will be stable "
    echo "# ----------------------------------"
  	echo "# step 9  miscelaneous "
    echo "# ----------------------------------"
    echo "90. az login -u $AZURE_USER  " 
    echo "91. docker login -u $DOCKER_USER " 
    echo "92. the whole sjebang"
    echo "93. backup scripts"
    echo "99. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 100 form the menu option.

read_options(){
	local choice
	read -p "Enter choice [ 1 - 99] " choice
	case $choice in
        10) docker_system_prune                                     ;;  
        20) set_docker_compose_travis_yml_without_volumes           ;;  
        21) set_clerk_frontend_dockerfile_without_volumes           ;;
        22) set_waardepapieren_service_dockerfile_without_volumes   ;; 
        23) set_mock_nlx_dockerfile                                 ;; 
        30) set_clerk_frontend_nginx_conf                           ;;
        31) set_waardepapieren_service_config_compose_travis_json   ;;  
        32) set_waardepapieren_service_config_compose_json          ;;
        33) set_waardepapieren_service_config_json                  ;;                           
        40) docker_compose_min_f_docker                             ;; 
        41) docker_build_image mock_nlx                             ;;  
        42) docker_build_image waardepapieren-service               ;; 
        33) docker_build_image clerk-frontend                       ;; 
        50) delete_azure_resource_group                             ;;
        51) create_azure_resource_group                             ;; 
        52) create_azure_resource_group                             ;; 
        53) restart_azure_container_group                           ;; 
        60) bookmark_open https://github.com/BoschPeter/$GIT_REPO   ;;
        61) bookmark_open https://hub.docker.com/?ref=login         ;; 
        62) bookmark_open https://portal.azure.com/\#home           ;; 
        63) bookmark_open https://$CERT_HOST_IP:443                 ;; 
        #64) bookmark_open https://portal.azure.com/#@boschpeteroutlook.onmicrosoft.com/resource/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/${AZ_RESOURCE_GROUP}/providers/Microsoft.ContainerInstance/containerGroups/$AZ_RESOURCE_GROUP/containers'  ;;
        90) azure_login                                             ;; 
        91) docker_login                                            ;; 
        92) the_whole_sjebang                                       ;; 
        93) write_az_clone_build_ship_deploy_bash                   ;; 
        99) Exit                                                    ;;
		*) echo -e "${RED}Error...${STD}" && sleep 1
	esac
}

# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
#trap '' SIGINT SIGQUIT SIGTSTP

# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
	show_menus
	read_options
done

fi

##################################################################
# Purpose: write code
# Arguments: 
# Return: variables
##################################################################

if [ ${WRITE_CODE} = true ] 
 then 
clear
while true; do
    read -p "write code  in the log (y or n)?" yn
    case $yn in
          [Yy]* ) WRITE_CODE=true ; break;;
          [Nn]* ) WRITE_CODE=false ;  break;;
        * ) echo "Please answer yes or no.";;
    esac
done
fi

if [ ${WRITE_CODE} = true ] 
 then 
 cd ${GITHUB_DIR}
 write_az_clone_build_ship_deploy_bash
 cat ${LOG_FILE} | more
echo "" 
echo "" 
clear
fi

create_logfile_footer
echo
echo "hope the run will be ok!"
echo

echo " cd back into " ${GITHUB_DIR}
cd ${GITHUB_DIR}
clear


# eof


##################################################################
# Purpose: azure_login
# Arguments: 
# Return: variables
##################################################################
azure_login() {

az login -u bosch.peter@outlook.com -p 0lifanten 

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

}


##################################################################
# Purpose: docker_login
# Arguments: 
# Return: variables
##################################################################
docker_login () {
docker login -u $DOCKER_USER  -p $DOCKER_PWD 
# docker container 
#  attach      Attach local standard input, output, and error streams to a running container
#  commit      Create a new image from a container's changes
#  cp          Copy files/folders between a container and the local filesystem
#  create      Create a new container
#  diff        Inspect changes to files or directories on a container's filesystem
#  exec        Run a command in a running container
#  export      Export a container's filesystem as a tar archive
#  inspect     Display detailed information on one or more containers
#  kill        Kill one or more running containers
#  logs        Fetch the logs of a container
#  ls          List containers
#  pause       Pause all processes within one or more containers
#  port        List port mappings or a specific mapping for the container
#  prune       Remove all stopped containers
#  rename      Rename a container
#  restart     Restart one or more containers
#  rm          Remove one or more containers
#  run         Run a command in a new container
#  start       Start one or more stopped containers
#  stats       Display a live stream of container(s) resource usage statistics
#  stop        Stop one or more running containers
#  top         Display the running processes of a container
#  unpause     Unpause all processes within one or more containers
#  update      Update configuration of one or more containers
#  wait        Block until one or more containers stop, then print their exit codes

#Usage:	docker image COMMAND
#Manage images

#Commands:
#  build       Build an image from a Dockerfile
#  history     Show the history of an image
#  import      Import the contents from a tarball to create a filesystem image
#  inspect     Display detailed information on one or more images
#  load        Load an image from a tar archive or STDIN
#  ls          List images
#  prune       Remove unused images
#  pull        Pull an image or a repository from a registry
#  push        Push an image or a repository to a registry
#  rm          Remove one or more images
#  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAG
#  save        Save one or more images to a tar archive (streamed to STDOUT by default)\
}