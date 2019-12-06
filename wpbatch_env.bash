
# //////////////////////////////////////////////////////////////////////////////////////////
#    File Type   :- BASH Script (needs docker and docker-composeenvironment installed)
#  
#    Description :- This script makes a backup using export tool (oracle)
#    Modified           Date            Description
#    --------           --------        -------------------------------------------------
#    Peter Bosch       05.12.2019      Initial version.
#
# //////////////////////////////////////////////////////////////////////////////////////////
# File:            :wpbatch_env.bash
# version          :20190412 v0
# File Type        :Bash 
# Purpose          :build waardepapieren      
# Title:           :
# Category         :Discipl deploy script
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI 



echo "#######################"
echo "content of wpbath_env.bash "
echo "#######################"

### barf
enter_cont() {
    echo
    echo
    echo -n "Press enter to Continue"
    read
}

# //////////////////////////////////////////////////////////////////////////////////////////
#######################
## Directories used 
#######################
#echo "--- Directories"

#CERT_HOST_IP=waardepapieren.westeurope.cloudapp.azure.com  #FQDN linux VVM
CERT_HOST_IP=waardepapieren.westeurope.azurecontainer.io  #FQDN AZURE CONTAINER INSTANCES
#CERT_HOST_IP=localhost  #FQDN linux
#portal.azure.com

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


GITHUB_DIR=/Users/boscp08/Dropbox/github/Waardepapieren-AZURE-ACI
PROJECT_DIR=/Users/boscp08/Projects/scratch/virtual-insanity
DOCKER_COMPOSE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren
CLERK_FRONTEND_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
WAARDEPAPIEREN_SERVICE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service

echo "GITHUB_DIR="$GITHUB_DIR
echo "PROJECT_DIR="$PROJECT_DIR
echo "DOCKER_COMPOSE_DIR="$DOCKER_COMPOSE_DIR
echo "CLIENT_FRONTEND_DIR="$CLIENT_FRONTEND_DIR
echo "WAARDEPAPIEREN_SERVICE_DIR="$WAARDEPAPIEREN_SERVICE_DIR
echo "---" 
# //////////////////////////////////////////////////////////////////////////////////////////

#######################
## setters
#######################
 
SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME="JA"
SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME="JA"
SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME="JA"

SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="NEE"
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="NEE"
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="NEE"

echo "---"
echo "SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME     
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME
echo "---"
echo "SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME
echo "---"
# //////////////////////////////////////////////////////////////////////////////////////////

######################
## docker CLI
######################
# docker -v  |Docker version 19.03.5, build 633a0ea
# docker-compose -v |docker-compose version 1.24.1, build 4667896b


CMD_GIT_CLONE="NEE"
CMD_CONTAINER_STOP_AND_PRUNE="NEE"
CMD_IMAGE_REMOVE="NEE"
CMD_DOCKER_COMPOSE="JA"
CMD_DOCKER_COMPOSE_BUILD=" --build"


echo "---"
echo "CMD_GIT_CLONE="$CMD_GIT_CLONE
echo "---"
echo "CMD_CONTAINER_STOP_AND_PRUNE="$CMD_CONTAINER_STOP_AND_PRUNE
echo "CMD_IMAGE_REMOVE="$CMD_IMAGE_REMOVE
echo "---"
echo "CMD_DOCKER_COMPOSE="$CMD_DOCKER_COMPOSE
echo "CMD_DOCKER_COMPOSE_BUILD="$CMD_DOCKER_COMPOSE_BUILD
echo "---"


######################
## AZURE CLI
######################

DOCKER_USER="BOSCP08"
DOCKER_VERSION_TAG="4.0"
DOCKER_PUSH="NEE"
DOCKER_COMMIT="NEE"
AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup4"
AZ_RESOURCE_GROUP_DELETE="NEE"
AZ_RESOURCE_GROUP_CREATE="NEE"
AZ_DEPLOY_ACI_FILE="deploy_aci.yaml"
CREATE_AZ_DEPLOY_ACI_YAML="JA"
CMD_AZ_CREATE_CONTAINERGROUP="NEE"


echo "DOCKER_USER="$DOCKER_USER         
echo "DOCKER_VERSION_TAG"$DOCKER_VERSION_TAG
echo "DOCKER_PUSH="$DOCKER_PUSH
echo "DOCKER_COMMIT="$DOCKER_COMMIT
echo "AZ_RESOURCE_GROUP="$AZ_RESOURCE_GROUP
echo "AZ_RESOURCE_GROUP_DELETE="$AZ_RESOURCE_GROUP_DELETE
echo "AZ_RESOURCE_GROUP_CREATE="$AZ_RESOURCE_GROUP_CREATE
echo "AZ_DEPLOY_ACI_FILE="$AZ_DEPLOY_ACI_FILE
echo "CREATE_AZ_DEPLOY_ACI_YAML="$CREATE_AZ_DEPLOY_ACI_YAML
echo "CMD_AZ_CREATE_CONTAINERGROUP="$CMD_AZ_CREATE_CONTAINERGROUP



#EOF  hope the run will be okay.