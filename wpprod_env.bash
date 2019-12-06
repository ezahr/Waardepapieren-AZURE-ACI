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
# version          :20190412 v0
# File Type        :Bash 
# Purpose          :build waardepapieren Docker introductie.      
# Title:           :
# Category         :Discipl container deploy script
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI 

#'big thanks to pim Otte en Stef van Leeuwen Wigo4il  
# rationale
# software wordt steeds complexer. Developerteam moet de productieomgeving begrijpen
# operatie team moet software internals begrijpen
# containers laten toe om applicaties samen met zijn runtime-omgevingen te implementeren infrastructure as code
# dezelfde bundel in verschillende omgevingen ontwikkeling test acceptatie productie, veel implementaties
# pssst vermijden configuratiedrift a.k.a. 100% genereren.

### barf
enter_cont() {
    echo
    echo
    echo -n "Press enter to Continue"
    read
}


# //////////////////////////////////////////////////////////////////////////////////////////

clerk_frontend_dockerfile_with_volumes() {
#CLERK_FRONTEND_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
echo "clerk_frontend_dockerfile_with_volumes"
sleep 1
cd $CLERK_FRONTEND_DIR
mv Dockerfile  Dockerfile_`date "+%Y%m%d-%H%M%S"`.yml
touch Dockerfile

echo "FROM node:10
RUN mkdir /app
ADD package.json package-lock.json /app/
ENV REACT_APP_EPHEMERAL_ENDPOINT=https://$CERT_HOST_IP:443/api/eph
ENV REACT_APP_EPHEMERAL_WEBSOCKET_ENDPOINT=wss://l$CERT_HOST_IP:443/api/eph-ws
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
#CLERK_FRONTEND_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
echo "clerk_frontend_dockerfile_without_volumes"
sleep 1
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

# //////////////////////////////////////////////////////////////////////////////////////////

waardepapieren_service_dockerfile_with_volumes() {

#WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
echo "waardepapieren_service_dockerfile_with_volumes"
sleep 1
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
#WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
echo "waardepapieren_service_dockerfile_without_volumes"
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

# /////////////////////////////////////////////////////////////////////////////////////////

# //////////////////////////////////////////////////////////////////////////////////////////
docker_compose_travis_yml_with_volumes() {

#DOCKER_COMPOSE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren

echo "docker_compose_travis_yml_with_volumes"
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
    volumes:
      - ./clerk-frontend/nginx/certs:/etc/nginx/certs:ro
  mock-nlx:
    build: mock-nlx/
    ports:
      - 80:80"  > docker-compose-travis.yml
}

docker_compose_travis_yml_without_volumes() {
echo "docker_compose_travis_yml_without_volumes"
sleep 1
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

# //////////////////////////////////////////////////////////////////////////////////////////

git_clone() {
#echo "git clone A start from scratch  git clone "
 echo "rm -rf $PROJECT_DIR/waardepapieren sure?"
 enter_cont
 cd $PROJECT_DIR
 rm -rf waardepapieren
 git clone https://github.com/discipl/waardepapieren.git
}



<< 'MULTILINE-COMMENT'




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


# https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf
# https://code.visualstudio.com/docs/getstarted/tips-and-tricks
# In Visual Studio Code  you can now select columns by holding down Shift + Alt , 
# then click and drag with the mouse. This can also be done using just the keyboard by holding down 
# Ctrl + Shift + Alt and then using the arrow keys.

# You can select blocks of text by holding Shift+Alt (Shift+Option on macOS) while you drag your mouse. 
# A separate cursor will be added to the end of each selected line. You can also use keyboard shortcuts to trigger 
# column selection.


boscp08s-MacBook-Pro:~ boscp08$ ssh boscp08@waardepapieren.westeurope.cloudapp.azure.com
Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 5.0.0-1025-azure x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Fri Dec  6 14:24:04 UTC 2019

  System load:  0.09               Users logged in:                0
  Usage of /:   18.3% of 28.90GB   IP address for eth0:            10.0.0.4
  Memory usage: 35%                IP address for docker0:         172.17.0.1
  Swap usage:   0%                 IP address for br-f50a21cd3c1e: 172.24.0.1
  Processes:    132

 * Overheard at KubeCon: "microk8s.status just blew my mind".

     https://microk8s.io/docs/commands#microk8s.status

 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

16 packages can be updated.
0 updates are security updates.


*** System restart required ***
Last login: Thu Dec  5 17:38:25 2019 from 86.86.102.241

MULTILINE-COMMENT