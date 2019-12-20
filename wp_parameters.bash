#!/bin/bash
# basic statements
# //////////////////////////////////////////////////////////////////////////////////////////
#    File Type   :- BASH Script (needs docker and docker-composeenvironment installed)
#  
#    Description :- his script builds "waardepapieren" containers and ships images to hub.docker.com
#    Modified           Date            Description
#    --------           --------        -------------------------------------------------
#    Peter Bosch       05.12.2019      Initial version.
#
# //////////////////////////////////////////////////////////////////////////////////////////
# File:            :wp_compose.bash
# version          :20190412 v0
# File Type        :Bash 
# Purpose          : Creating an optimized production build...     
# Title:           :https://github.com/discipl/waardepapieren 
# Category         :Discipl deploy script
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI wp_compose.bash

# big thanks to pim Otte en Stef van Leeuwen Wigo4it  
# rationale
# Use this task in a build or release pipeline to run a Bash script on macOS, Linux, or Windows. 
# DevOps: REST API Execution Through Bash Shell Scripting
# I hope this helps my fellow (bash) hackers out there.
# container brings its own file system, on every type of system
# Run applications in isolated environment, own filesystem with programs, libraries configuration files, data files etcetcect

# ********** instructies **********
#1. start bash shell
#2. in wpprod_env.bash staan de modules hoef je in principe niet te wijzigen
#3. in wpbatch_env.bash staan de  mappen . naar behoefte wijzigen.
#4  run het script `. wp_compose.bash`  


##the_world_is_flat=true
# ...do something interesting...
#if [ "$the_world_is_flat" = true ] ; then
#    echo 'Be careful not to fall off!'
#fi
# grep -lr "waardepapieren.westeurope.azurecontainer.io" * 
# echo "birthday-091216-pics" | cut -d'-' -f 2
# echo "waardepapieren.westeurope.azurecontainer.io" | cut -d'.' -f 1

# tricks
<< "ECT-HOST_COMMENT"
## /etc/hosts 
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1       localhost
#127.0.0.1       waardepapieren.westeurope.azurecontainer.io
127.0.0.1        waardepapieren.westeurope.cloudapp.azure.com
255.255.255.255 broadcasthost
::1             localhost
# Added by Docker Desktop
# To allow the same kube context to work on the host and the container:
127.0.0.1 kubernetes.docker.internal
# End of section
ECT-HOST_COMMENT



### barf
enter_cont() {
    echo
    echo
    echo -n "Press enter to Continue"
    read
}

# //////////////////////////////////////////////////////////////////////////////////////////
#echo "#######################"
#echo "##  check environment
#echo "#######################" 

if [ `uname` = 'Linux' ]
  then  HOME_DIR=/home/boscp08 
  echo "linux"
fi  

if  [ `uname` = 'Darwin' ]
    then  HOME_DIR=/Users/boscp08   
    echo "Darwin"
fi

# //////////////////////////////////////////////////////////////////////////////////////////
#echo "#######################"
#echo "##  setters 
#echo "#######################" 

CERT_HOST_IP=discipl.westeurope.azurecontainer.io  #FQDN linux
CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME=discipl.westeurope.azurecontainer.io
AZ_DNSNAMELABEL=discipl  # `$CERT_HOST_IP | cut -d'.' -f 1`   #waardepapieren or disciple

#EPHEMERAL_RETENTION_TIME=86400  #24h 
EPHEMERAL_RETENTION_TIME=2592001 #30 dage

CMD_CONTAINER_STOP_AND_PRUNE=false
CMD_IMAGE_REMOVE=false
CMD_GIT_CLONE=false

#echo "#######################"
#echo "## Dockerfile  configuration "
#echo "#######################" 

SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME=true       
SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME=true
SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME=true

SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME=false
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME=false
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME=false

SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON=true 
SET_CLERK_FRONTEND_NGINX_CONF=true

#echo "#######################"
#echo "## Dockerfile  build and ship 
#echo "#######################" 

CMD_DOCKER_COMPOSE=true  #volumes and links depreciated
CMD_DOCKER_BUILD=false  # build by container
CMD_DOCKER_COMPOSE_BUILD=" --build"

DOCKER_TAG=true
DOCKER_USER="boscp08"  #NB repository name must be lowercase
DOCKER_VERSION_TAG="3.0"
DOCKER_PUSH=true  #hub.docker.com 

#echo "#######################"
#echo "## AZURE CONTAINER INSTANCE   setters"
#echo "#######################" 

AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup2"
#AZ_DNSNAMELABEL=  # `$CERT_HOST_IP | cut -d'.' -f 1`   #waardepapieren or disciple

AZ_RESOURCE_GROUP_DELETE=true
AZ_RESOURCE_GROUP_CREATE=true
CREATE_AZ_DEPLOY_ACI_YAML=true  #@PROJECT_DIR deploy_aci.yml
CMD_AZ_CREATE_CONTAINERGROUP=true  #.. jeuh - Running ..

GITHUB_DIR=$HOME_DIR/Dropbox/Github/Waardepapieren-AZURE-ACI  #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
PROJECT_DIR=$HOME_DIR/Projects/scratch/virtual-insanity       #git clone https://github.com/disciplo/waardepapieren.git
DOCKER_COMPOSE_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren
CLERK_FRONTEND_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
#CLERK_FRONTEND_NGINX_DIR=$CLERK_FRONTEND_DIR/nginx
#CLERK_FRONTEND_CYPRESS_DIR=$CLERK_FRONTEND_DIR/cypress
WAARDEPAPIEREN_SERVICE_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
WAARDEPAPIEREN_SERVICE_CONFIG_DIR=$WAARDEPAPIEREN_SERVICE_DIR/configuration


# //////////////////////////////////////////////////////////////////////////////////////////
#echo "#######################"
#echo "## feedbak 
#echo "#######################" 

PROMPT=true
CHECK_CHECK_DOUBLE_CHECK=true

if [ $PROMPT = true ] 
 then 
clear
enter_cont

echo "#######################"
echo "## CERT_HOST_IP "
echo "#######################" 
echo "CERT_HOST_IP"=$CERT_HOST_IP       #discipl.westeurope.azurecontainer.io  #FQDN linux
echo "CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME"=$CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME #discipl.westeurope.azurecontainer.io
echo "EPHEMERAL_RETENTION_TIME"=$EPHEMERAL_RETENTION_TIME #2592001 #30 dagen
echo "" 
echo "#######################"
echo "## Github clean up disposables  tabula rasa "
echo "#######################" 
echo "CMD_DOCKER_CONTAINER_STOP_AND_PRUNE"=$CMD_CONTAINER_STOP_AND_PRUNE #false
echo "CMD_DOCKER_IMAGE_REMOVE"=$CMD_IMAGE_REMOVE #false
echo "CMD_DOCKER_CONTAINER_PRUNE"=$CMD_DOCKER_CONTAINER_PRUNE #false
echo "CMD_GIT_CLONE"=$CMD_GIT_CLONE #false
echo "" 
enter_cont
echo "#######################"
echo "## Dockerfile  configuration "
echo "#######################" 
echo "SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME"=$SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME #true       
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME"=$SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME #true
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME"=$SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME #true
echo "SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON"=$SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON #true 
echo "SET_CLERK_FRONTEND_NGINX_CONF"=$SET_CLERK_FRONTEND_NGINX_CONF #true
echo "" 
echo "#######################"
echo "## Docke compose volume  configuration "  # depreciated 
echo "#######################" 
echo "SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME"=$SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME #false
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME"=$SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME #false
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME"=$SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME #false
echo "" 
echo "#######################"
echo "## Dockerfile  build and ship "
echo "#######################" 
echo "CMD_DOCKER_COMPOSE"=$CMD_DOCKER_COMPOSE #true
echo "CMD_DOCKER_BUILD"=$CMD_DOCKER_BUILD #true
echo "CMD_DOCKER_COMPOSE_BUILD"=#" --build"
echo "" 
echo "DOCKER_TAG"=$DOCKER_TAG #true
echo "DOCKER_USER"=$DOCKER_USER  #"boscp08"  #NB repository name must be lowercase
echo "DOCKER_VERSION_TAG"=$DOCKER_VERSION_TAG #"3.0"

enter_cont

echo "#######################"
echo "## Ezah ACI Azure Container instance setters"
echo "#######################" 
echo "AZ_RESOURCE_GROUP"=$AZ_RESOURCE_GROUP #"Discipl_Wigo4it_DockerGroup2"
echo "AZ_DNSNAMELABEL"=$AZ_DNSNAMELABEL #$CERT_HOST_IP | cut -d'.' -f 1  #waardepapieren or disciple
echo "AZ_RESOURCE_GROUP_DELETE"=$AZ_RESOURCE_GROUP_DELETE #true
echo "AZ_RESOURCE_GROUP_CREATE"=$AZ_RESOURCE_GROUP_CREATE #true
echo "CREATE_AZ_DEPLOY_ACI_YAML"=$CREATE_AZ_DEPLOY_ACI_YAML #true  #@PROJECT_DIR deploy_aci.yml
echo "CMD_AZ_CREATE_CONTAINERGROUP"=$CMD_AZ_CREATE_CONTAINERGROUP #true  #.. jeuh - Running .. portal.azure.com
echo "" 
echo "#######################" 
echo "# Directories used " 
echo "#######################"
echo "HOME_DIR"=$HOME_DIR
echo "GITHUB_DIR="$GITHUB_DIR
echo "PROJECT_DIR="$PROJECT_DIR
echo "DOCKER_COMPOSE_DIR="$DOCKER_COMPOSE_DIR
echo "CLERK_FRONTEND_CYPRESS_DIR="$CLERK_FRONTEND_CYPRESS_DIR
echo "WAARDEPAPIEREN_SERVICE_DIR="$WAARDEPAPIEREN_SERVICE_DIR
echo "WAARDEPAPIEREN_SERVICE_CONFIG_DIR="$WAARDEPAPIEREN_SERVICE_CONFIG_DIR

# //////////////////////////////////////////////////////////////////////////////////////////
#echo "#######################"
#echo "## end of feedbak 
#echo "#######################" 
echo "" 
echo "" 
echo "hope the run will be okay. "
enter_cont

fi



# //////////////////////////////////////////////////////////////////////////////////////////
#EOF  hope the run will be okay.