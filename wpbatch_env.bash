
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
# version          :20191204 v0
# File Type        :Bash 
# Purpose          :build waardepapieren      
# Title:           :
# Category         :Discipl deploy script
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI 

### barf
enter_cont() {
    echo
    echo
    echo -n "Press enter to Continue"
    read
}



# //////////////////////////////////////////////////////////////////////////////////////////

echo "#######################"
echo "## FQDN Fully Qualified Name `date "+%Y%m%d-%H%M%S"` "
echo "#######################" 
CMD_GIT_CLONE="JA"
CMD_DOCKER_COMPOSE="JA"
CMD_DOCKER_COMPOSE_BUILD=" --build"

#CERT_HOST_IP=waardepapieren.westeurope.cloudapp.azure.com  #FQDN linux VVM
CERT_HOST_IP=waardepapieren.westeurope.azurecontainer.io  #FQDN AZURE CONTAINER INSTANCES
#CERT_HOST_IP=localhost  #FQDN linux
#portal.azure.com
#grep -lr "waardepapieren.westeurope.azurecontainer.io" * 
#EPHEMERAL_RETENTION_TIME=86400  #24h 
EPHEMERAL_RETENTION_TIME=2592000 #30 dagen

echo "CMD_GIT_CLONE="$CMD_GIT_CLONE
echo "CERT_HOST_IP="$CERT_HOST_IP
echo "EPHEMERAL_RETENTION_TIME="$EPHEMERAL_RETENTION_TIME
echo "CMD_DOCKER_COMPOSE="$CMD_DOCKER_COMPOSE
echo "CMD_DOCKER_COMPOSE_BUILD="$CMD_DOCKER_COMPOSE_BUILD

enter_cont

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

# //////////////////////////////////////////////////////////////////////////////////////////
echo "#######################" 
echo "# Directories used " 
echo "#######################"

if [ uname = 'Linux' ]
  then  HOME_DIR=/home/boscp08 
  echo "linux"
fi  

if  [ uname = 'Darwin' ]
    then  HOME_DIR=/Users/boscp08   
    echo "Darwin"
fi

GITHUB_DIR=$HOME_DIR/Dropbox/github/waardepapieren-AZURE-ACI  #git clone https://github.com/ezahr/Waardepapieren-AZURE-ACI.git 
PROJECT_DIR=$HOME_DIR/Projects/scratch/virtual-insanity       #git clone https://github.com/disciplo/waardepapieren.git
DOCKER_COMPOSE_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren
CLERK_FRONTEND_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
CLERK_FRONTEND_NGINX_DIR=$CLERK_FRONTEND_DIR/nginx
CLERK_FRONTEND_CYPRESS_DIR=$CLERK_FRONTEND_DIR/cypress
WAARDEPAPIEREN_SERVICE_DIR=$HOME_DIR/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service
WAARDEPAPIEREN_SERVICE_CONFIG_DIR=$WAARDEPAPIEREN_SERVICE_DIR/configuration

echo "HOME_DIR"=$HOME_DIR
echo "GITHUB_DIR="$GITHUB_DIR
echo "PROJECT_DIR="$PROJECT_DIR
echo "DOCKER_COMPOSE_DIR="$DOCKER_COMPOSE_DIR
echo "CLERK_FRONTEND_CYPRESS_DIR="$CLERK_FRONTEND_CYPRESS_DIR
echo "WAARDEPAPIEREN_SERVICE_DIR="$WAARDEPAPIEREN_SERVICE_DIR
echo "WAARDEPAPIEREN_SERVICE_CONFIG_DIR="$WAARDEPAPIEREN_SERVICE_CONFIG_DIR
 
# //////////////////////////////////////////////////////////////////////////////////////////
echo "#######################"
echo "## Dockerfile  setters"
echo "#######################" 

SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME="JA"       
SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME="JA"
SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME="JA"

SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="NEE"
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="NEE"
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="NEE"

echo "SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME     
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME
echo "SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME


# //////////////////////////////////////////////////////////////////////////////////////////
echo "#######################"
echo "## Networking setters" 
echo "#######################"

SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON="JA" 
SET_CLERK_FRONTEND_NGINX_CONF="NEE"

#SET_WAARDEPAPIEREN_CONFIG_JSON="JA" 
#SET_WAARDEPAPIEREN_CONFIG_COMPOSE_JSON="JA"

#SET_CLERK_FRONTEND_CYPRESS_JSON="JA" 
#SET_CYPRESS_INTEGRATION_SCENARIO_SPEC_JS="JA"

echo "SET_WAARDEPAPIEREN_CONFIG_COMPOSE_JSON="$SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON
echo "SSET_CLERK_FRONTEND_NGINX_CONF="$SET_CLERK_FRONTEND_NGINX_CONF
#echo "SET_WAARDEPAPIEREN_CONFIG_COMPOSE_TRAVIS_JSON="$SET_WAARDEPAPIEREN_CONFIG_COMPOSE_TRAVIS_JSON
#echo "SET_WAARDEPAPIEREN_CONFIG_JSON="$SET_WAARDEPAPIEREN_CONFIG_JSON
echo "SET_CLERK_FRONTEND_CYPRESS_JSON="$SET_CLERK_FRONTEND_CYPRESS_JSON
echo "SET_CYPRESS_INTEGRATION_SCENARIO_SPEC_JS"=$SET_CYPRESS_INTEGRATION_SCENARIO_SPEC_JS
 
# //////////////////////////////////////////////////////////////////////////////////////////
echo "######################" 
echo "## docker CLI" 
echo "######################"

# docker -v  |Docker version 19.03.5, build 633a0ea
# docker-compose -v |docker-compose version 1.24.1, build 4667896b
CMD_CONTAINER_STOP_AND_PRUNE="NEE"
CMD_IMAGE_REMOVE="NEE"
DOCKER_USER="boscp08"  #NB repository name must be lowercase
DOCKER_VERSION_TAG="4.0"
DOCKER_COMMIT="NEE"
DOCKER_PUSH="NEE"

echo "CMD_CONTAINER_STOP_AND_PRUNE="$CMD_CONTAINER_STOP_AND_PRUNE
echo "CMD_IMAGE_REMOVE="$CMD_IMAGE_REMOVE
echo "DOCKER_USER="$DOCKER_USER         
echo "DOCKER_VERSION_TAG"=$DOCKER_VERSION_TAG
echo "DOCKER_PUSH="$DOCKER_PUSH
echo "DOCKER_COMMIT="$DOCKER_COMMIT

# ////////////////////////////////////////////////////////////////////////////////////////// 
echo "######################"
echo "## AZURE CLI"
echo "######################"

AZ_RESOURCE_GROUP="Discipl_Wigo4it_DockerGroup4"
AZ_RESOURCE_GROUP_DELETE="NEE"
AZ_RESOURCE_GROUP_CREATE="NEE"
CREATE_AZ_DEPLOY_ACI_YAML="NEE"  #@PROJECT_DIR deploy_aci.yml
CMD_AZ_CREATE_CONTAINERGROUP="NEE"  #.. jeuh - Running ..

echo "AZ_RESOURCE_GROUP="$AZ_RESOURCE_GROUP
echo "AZ_RESOURCE_GROUP_DELETE="$AZ_RESOURCE_GROUP_DELETE
echo "AZ_RESOURCE_GROUP_CREATE="$AZ_RESOURCE_GROUP_CREATE
echo "CREATE_AZ_DEPLOY_ACI_YAML="$CREATE_AZ_DEPLOY_ACI_YAML
echo "CMD_AZ_CREATE_CONTAINERGROUP="$CMD_AZ_CREATE_CONTAINERGROUP
# //////////////////////////////////////////////////////////////////////////////////////////

#EOF  hope the run will be okay.