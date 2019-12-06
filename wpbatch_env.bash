
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
CERT_HOST_IP=waardepapieren.westeurope.cloudapp.azure.com  #FQDN
GITHUB_DIR=/Users/boscp08/Dropbox/github/Waardepapieren-AZURE-ACI
PROJECT_DIR=/Users/boscp08/Projects/scratch/virtual-insanity

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
 
SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME="NEE"
SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME="NEE"
SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME="NEE"

SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="JA"
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="JA"
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="JA"

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
## CMD
######################
CMD_GIT_CLONE="JA"
CMD_CONTAINER_STOP_AND_PRUNE="NEE"
CMD_IMAGE_REMOVE="NEE"
CMD_DOCKER_COMPOSE="NEE"
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

#EOF  hope the run will be okay.