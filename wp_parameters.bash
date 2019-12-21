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
#echo "##  AZURE  https://portal.azure.com/#home
# alles gebeurt via het web; aan de server-kant. 
# Ook toegang tot bestanden en mappen gebeurt via een web-interface, 
# er zijn APIs beschikbaar of er is toegang mogelijk middels andere protocollen,
# zoals: FTP, SFTP en SSH. Het Azure Services Platform gebruikt een aangepast 
# besturingssysteem Microsoft Azure om een cluster van servers te beheren die in het datacenter van Microsoft staan. 
#echo "#######################" 


AZ_DNSNAMELABEL=discipl

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
  # `$CERT_HOST_IP | cut -d'.' -f 1`   #waardepapieren or disciple

#EPHEMERAL_RETENTION_TIME=86400  #24h 
EPHEMERAL_RETENTION_TIME=2592001 #30 dage


#echo "#######################"
#echo "## DOWNLOAD  
#echo "#######################" 

GITHUB_DIR=$HOME_DIR/Dropbox/Github/Waardepapieren-AZURE-ACI  #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
PROJECT_DIR=$HOME_DIR/Projects/scratch/virtual-insanity       #git clone https://github.com/disciplo/waardepapieren.git
DOCKER_COMPOSE_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren
CLERK_FRONTEND_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
#CLERK_FRONTEND_NGINX_DIR=$CLERK_FRONTEND_DIR/nginx
#CLERK_FRONTEND_CYPRESS_DIR=$CLERK_FRONTEND_DIR/cypress
WAARDEPAPIEREN_SERVICE_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
WAARDEPAPIEREN_SERVICE_CONFIG_DIR=$WAARDEPAPIEREN_SERVICE_DIR/configuration


#echo "#######################"
#echo "## CLONE
#echo "#######################" 

CMD_CONTAINER_STOP=false
CMD_IMAGE_REMOVE=false
CMD_CONTAINER_PRUNE=false
CMD_GIT_CLONE=true

#echo "#######################"
#echo "## BUILD
#echo "#######################" 

CMD_DOCKER_COMPOSE=true  #volumes and links depreciated
CMD_DOCKER_BUILD=false  # build by container
CMD_DOCKER_COMPOSE_BUILD=" --build"


SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME=true       
SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME=true
SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME=true

SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME=false
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME=false
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME=false

SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON=true 
SET_CLERK_FRONTEND_NGINX_CONF=true

#echo "#######################"
#echo "## SHIP 
#echo "#######################" 

DOCKER_TAG=true
DOCKER_USER="boscp08"  #NB repository name must be lowercase
DOCKER_VERSION_TAG="2.0"
DOCKER_PUSH=true  #hub.docker.com 


#echo "#######################"
#echo "## DEPLOY
#echo "#######################" 

AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup2"
AZ_RESOURCE_GROUP_DELETE=true
AZ_RESOURCE_GROUP_CREATE=true
CREATE_AZ_DEPLOY_ACI_YAML=true  #@PROJECT_DIR deploy_aci.yml
CMD_AZ_CREATE_CONTAINERGROUP=true  #.. jeuh - Running ..

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
echo "## DOWNLOAD"  
echo "#######################" 
echo "GITHUB_DIR="$GITHUB_DIR        # $HOME_DIR/Dropbox/Github/Waardepapieren-AZURE-ACI  #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
echo "PROJECT_DIR="$PROJECT_DIR         #$HOME_DIR/Projects/scratch/virtual-insanity       #git clone https://github.com/disciplo/waardepapieren.git
echo "DOCKER_COMPOSE_DIR="$DOCKER_COMPOSE_DIR        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren
echo "CLERK_FRONTEND_DIR="$CLERK_FRONTEND_DIR        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
#CLERK_FRONTEND_NGINX_DIR="$         #$CLERK_FRONTEND_DIR/nginx
#CLERK_FRONTEND_CYPRESS_DIR="$         #$CLERK_FRONTEND_DIR/cypress
echo "WAARDEPAPIEREN_SERVICE_DIR="$WAARDEPAPIEREN_SERVICE_DIR        #$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
echo "WAARDEPAPIEREN_SERVICE_CONFIG_DIR="$WAARDEPAPIEREN_SERVICE_CONFIG_DIR        #$WAARDEPAPIEREN_SERVICE_DIR/configuration
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
echo "SET_CLERK_FRONTEND_NGINX_CONF="$SET_CLERK_FRONTEND_NGINX_CONF        #rue
enter_cont
clear
echo "#######################"
echo "## SHIP DOCKER HUB"
echo "#######################" 
echo "DOCKER_TAG="$DOCKER_TAG         #true
echo "DOCKER_USER="$DOCKER_USER       #"boscp08"  #NB repository name must be lowercase
echo "DOCKER_VERSION_TAG="$DOCKER_VERSION_TAG        #"2.0"
echo "DOCKER_PUSH="$DOCKER_PUSH         #true  #hub.docker.com 
echo ""
echo "#######################"
echo "## DEPLOY AZURE"
echo "#######################" 
echo "AZ_RESOURCE_GROUP="$AZ_RESOURCE_GROUP        #"Discipl_Wigo4it_DockerGroup2"
echo "AZ_RESOURCE_GROUP_DELETE="$AZ_RESOURCE_GROUP_DELETE         #true
echo "AZ_RESOURCE_GROUP_CREATE="$AZ_RESOURCE_GROUP_CREATE        #true
echo "CREATE_AZ_DEPLOY_ACI_YAML="$CREATE_AZ_DEPLOY_ACI_YAML        #true  #@PROJECT_DIR deploy_aci.yml
echo "CMD_AZ_CREATE_CONTAINERGROUP="$CMD_AZ_CREATE_CONTAINERGROUP        #true  #.. jeuh - Running ..
enter_cont
# //////////////////////////////////////////////////////////////////////////////////////////
#echo "#######################"
#echo "## end of feedbak 
#echo "#######################" 
echo "" 
echo "" 
echo "hope the run will be okay. "
enter_cont
clear
fi



# //////////////////////////////////////////////////////////////////////////////////////////
#EOF  hope the run will be okay.