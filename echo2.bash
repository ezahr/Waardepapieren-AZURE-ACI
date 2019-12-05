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
# File:            :echo2.bash
# version          :20190412 v0
# File Type        :Bash 
# Purpose          :build waardepapieren      
# Title:           :
# Category         :Discipl deploy script
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI 

#'big thanks to pim Otte en Stef van Leeuwen Wigo4il  
# rationale
# Use this task in a build or release pipeline to run a Bash script on macOS, Linux, or Windows. 
# DevOps: REST API Execution Through Bash Shell Scripting

# ********** instructies **********
#1. start bash shell
#2. run het script . echo2.bash   => serving needs  CERT_HOST_IP
# ********** parameters **********

CERT_HOST_IP=waardepapieren.westeurope.cloudapp.azure.com  #FQDN
GITHUB_DIR=/Users/boscp08/Dropbox/github/Waardepapieren-AZURE-ACI
PRJ_DIR=/Users/boscp08/Projects/scratch/virtual-insanity

# ********** stuur Parameters **********
GIT_CLONE="NEE"
SET_FQDN="NEE"
COMPOSE="NEE"

### barf
enter_cont() {
    echo
    echo
    echo -n "Press enter to Continue"
    read
}

echo "***"   
echo "***  Welcome to  docker-compose "
echo "***"   
echo "***" 
echo "***  You are about to start to build new waardepapieren images and containers "
echo "***  targethost= https://$CERT_HOST_IP " 
echo "***" 

echo "GIT_CLONE= " $GIT_CLONE
echo "DOCKER-COMPOSE= " $COMPOSE
echo "SET_FQDN=" $SET_FQDN

enter_cont

#######################
## M A I N
#######################

#
# A start from scratch  git clone 
#

if [ $GIT_CLONE = "JA" ]
then
echo "afhalen"
cd $PRJ_DIR

 echo "rm -rf waardepapieren sure?"
 enter_cont
 rm -rf waardepapieren
 git clone https://github.com/discipl/waardepapieren.git
fi

MAIN_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren
CF_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
WP_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service

# B set docker-compose-travis.yml

if [ $SET_FQDN = "JA" ]
then
echo "set FQDN"

cd $MAIN_DIR
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


#
# C set Dockerfiles 
#

cd $CF_DIR
touch Dockerfile
mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`
echo "" > Dockerfile

echo "FROM node:10
RUN mkdir /app
ADD package.json package-lock.json /app/
ENV REACT_APP_EPHEMERAL_ENDPOINT=$CERT_HOST_IP:443/api/eph
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
COPY --from=0 /app/build /usr/share/nginx/html
#  volumes:
#    - ./clerk-frontend/nginx/certs:/etc/nginx/certs:rw
RUN mkdir /etc/nginx/certs
ADD nginx/certs/org.crt /etc/nginx/certs/org.crt
ADD nginx/certs/org.key /etc/nginx/certs/org.key" > Dockerfile


cd $WP_DIR
touch Dockerfile
mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`
echo "#FROM node:10
#RUN mkdir /app
#ADD .babelrc package.json package-lock.json /app/
#ADD src/* app/src/
#ADD configuration/* app/configuration/
#ENV WAARDEPAPIEREN_CONFIG /app/configuration/waardepapieren-config.json
#WORKDIR /app
#RUN npm install --production
#CMD npm start
FROM node:10
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
CMD npm start" > Dockerfile

fi


cd $MAIN_DIR

#  Clean up previous deployment (containersk and images)
# remove alle containers `docker stop $(docker ps -a -q)`
# remove alle containers and images `docker rm $(docker ps -a -q) && docker rmi $(docker images -q)`
# remove all stopped containers (just waist of storage} `docker container prune`

# D docker-compose  
if [ $COMPOSE = "JA" ]
then
cd $MAIN_DIR
docker-compose -f docker-compose-travis.yml up --build 
fi

cd $GITHUB_DIR

#  docker commit  



# docker login


# docker push


# az login

# Congratulations! You've configured a custom Linux AZURE container in App Service.



# az delete resource group


# az create resource group


# az create containter group


# blader naar protal.azure.com 

echo
echo "hope the run was ok!"
echo
sleep  5

echo " cd back into " $GIT_DIR
cd $GITHUB_DIR
clear


#boscp08s-mbp:~ boscp08$ ssh boscp08@waardepapieren.westeurope.cloudapp.azure.com
#Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 5.0.0-1025-azure x86_64)
#
# * Documentation:  https://help.ubuntu.com
# * Management:     https://landscape.canonical.com
# * Support:        https://ubuntu.com/advantage
#
#  System information as of Thu Dec  5 17:38:25 UTC 2019
#
#  System load:  0.0                Users logged in:                0
#  Usage of /:   17.3% of 28.90GB   IP address for eth0:            10.0.0.4
#  Memory usage: 35%                IP address for docker0:         172.17.0.1
#  Swap usage:   0%                 IP address for br-f50a21cd3c1e: 172.24.0.1
#  Processes:    134
#
# * Overheard at KubeCon: "microk8s.status just blew my mind".
#
#     https://microk8s.io/docs/commands#microk8s.status
#
# * Canonical Livepatch is available for installation.
#   - Reduce system reboots and improve kernel security. Activate at:
#     https://ubuntu.com/livepatch
#
#15 packages can be updated.
#0 updates are security updates.#
#
#
#Last login: Thu Dec  5 15:02:36 2019 from 85.159.97.71
#boscp08@waardepapierenVM:~$ 


# container brings itś own file system, on every type of system
## docker 
#|step|description|command|
#|--|------------|----------------|
#|1|	install docker download | `sudo  install -y docker docker-common docker-client`  |
#|2| enable docker daemon| 	` systemctl enable docker ` |
#|3| and start docker daemon	| 	` systemctl start docker ` |
#|4| verify that docker daemon is active by running your first container| ` docker run hello-world` |
#
#but now as a 'normal'  user
#`groupadd docker`
#` usermod -aG docker boscp08`
#`systemctl restart docker `
#`docker run hello-world` 
#*hello from docker This message shows that your installation appears to be working correctly. *


