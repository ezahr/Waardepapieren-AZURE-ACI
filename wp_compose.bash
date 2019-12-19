
# //////////////////////////////////////////////////////////////////////////////////////////
#    File Type   :- BASH Script (needs docker and docker-composeenvironment installed)
#  
#    Description :- This script makes a backup using export tool (oracle)
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

# ********** Parameters **********

. wpbatch_env.bash

# ********** functies **********

. wpprod_env.bash  

echo "***"   
echo "***  Welcome to  docker-compose "
echo "***"   
echo "***" 



CMD_CONTAINER_STOP_AND_PRUNE="NEE"
CMD_IMAGE_REMOVE="NEE"
CMD_GIT_CLONE="NEE"
CMD_DOCKER_COMPOSE="JA"
CMD_DOCKER_COMPOSE_BUILD=" --build"
DOCKER_USER="boscp08"  #NB repository name must be lowercase
DOCKER_VERSION_TAG="4.0"
DOCKER_COMMIT="JA"
DOCKER_PUSH="JA"
PROMPT="JA"



CERT_HOST_IP=discipl.westeurope.azurecontainer.io  #FQDN linux
CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME=discipl.westeurope.azurecontainer.io
#grep -lr "waardepapieren.westeurope.azurecontainer.io" * 
#EPHEMERAL_RETENTION_TIME=86400  #24h 
EPHEMERAL_RETENTION_TIME=2592001 #30 dagen

echo "***  You are about to start to build new waardepapieren images and containers "
echo "***  droplet-targethost= https://$CERT_HOST_IP " 
echo "***" 

enter_cont

if [ $PROMPT = "JA" ] 
 then 
  echo "#######################"
  echo "## FQDN Fully Qualified Name $CERT_HOST_IP `date "+%Y%m%d-%H%M%S"` "
  echo "#######################" 
  echo "CMD_GIT_CLONE="$CMD_GIT_CLONE
  echo "CERT_HOST_IP="$CERT_HOST_IP
  echo "CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME" = $CERT_HOST_IP_WAARDEPAPIEREN_SERVICE_HOSTNAME
  echo "EPHEMERAL_RETENTION_TIME="$EPHEMERAL_RETENTION_TIME
  echo "CMD_DOCKER_COMPOSE="$CMD_DOCKER_COMPOSE
  echo "CMD_DOCKER_COMPOSE_BUILD="$CMD_DOCKER_COMPOSE_BUILD
  enter_cont
fi

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
#echo "#######################"
#echo "## Dockerfile  setters"
#echo "#######################" 

SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME="JA"       
SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME="JA"
SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME="JA"

SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="NEE"
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="NEE"
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="NEE"

if [ $PROMPT = "JA" ] 
 then 
echo "#######################"
echo "## Dockerfile  setters"
echo "#######################" 
echo "SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME     
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME

echo "SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME
fi

# //////////////////////////////////////////////////////////////////////////////////////////
#echo "#######################"
#echo "## Networking setters" 
#echo "#######################"

SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON="JA" 
SET_CLERK_FRONTEND_NGINX_CONF="JA"

#SET_WAARDEPAPIEREN_CONFIG_JSON="JA" 
#SET_WAARDEPAPIEREN_CONFIG_COMPOSE_JSON="JA"
#SET_CLERK_FRONTEND_CYPRESS_JSON="JA" 
#SET_CYPRESS_INTEGRATION_SCENARIO_SPEC_JS="JA"

if [ $PROMPT = "JA" ] 
 then
echo "#######################"
echo "## Networking setters" 
echo "#######################"
echo "SET_WAARDEPAPIEREN_CONFIG_COMPOSE_JSON="$SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON
echo "SET_CLERK_FRONTEND_NGINX_CONF="$SET_CLERK_FRONTEND_NGINX_CONF
#echo "SET_WAARDEPAPIEREN_CONFIG_COMPOSE_TRAVIS_JSON="$SET_WAARDEPAPIEREN_CONFIG_COMPOSE_TRAVIS_JSON
#echo "SET_WAARDEPAPIEREN_CONFIG_JSON="$SET_WAARDEPAPIEREN_CONFIG_JSON
echo "SET_CLERK_FRONTEND_CYPRESS_JSON="$SET_CLERK_FRONTEND_CYPRESS_JSON
echo "SET_CYPRESS_INTEGRATION_SCENARIO_SPEC_JS"=$SET_CYPRESS_INTEGRATION_SCENARIO_SPEC_JS
fi

#echo "######################" 
#echo "## docker CLI" 
#echo "######################"

# docker -v  |Docker version 19.03.5, build 633a0ea
# docker-compose -v |docker-compose version 1.24.1, build 4667896b


if [ $PROMPT = "JA" ] 
 then
echo "######################" 
echo "## docker CLI" 
echo "######################"
echo "CMD_CONTAINER_STOP_AND_PRUNE="$CMD_CONTAINER_STOP_AND_PRUNE
echo "CMD_IMAGE_REMOVE="$CMD_IMAGE_REMOVE
echo "DOCKER_USER="$DOCKER_USER         
echo "DOCKER_VERSION_TAG"=$DOCKER_VERSION_TAG
echo "DOCKER_PUSH="$DOCKER_PUSH
echo "DOCKER_COMMIT="$DOCKER_COMMIT
fi


#######################
## M A I N
# program starts here actually
#######################
echo "program starts here actually"
enter_cont

if [ $CMD_GIT_CLONE = "JA" ] 
  then git_clone 
fi 
 #//////////////////////////////////////////////////////////////////////////////////////////

if [ $SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME = "JA" ]
  then docker_compose_travis_yml_with_volumes
fi 

if [ $SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME = "JA" ]
  then docker_compose_travis_yml_without_volumes 
fi 

# //////////////////////////////////////////////////////////////////////////////////////////
# docker files

if [ $SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME = "JA" ]
  then clerk_frontend_dockerfile_with_volumes
fi 

if [ $SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME = "JA" ]
  then waardepapieren_service_dockerfile_with_volumes 
fi 

if [ $SET_DOCKERFILE_CLERK_FRONTEND_WITHOUT_VOLUME = "JA" ]
  then clerk_frontend_dockerfile_without_volumes
fi 

if [ $SET_DOCKERFILE_WAARDEPAPIEREN_WITHOUT_VOLUME = "JA" ]
  then waardepapieren_service_dockerfile_without_volumes
fi 




# //////////////////////////////////////////////////////////////////////////////////////////
# bypass vilein docker netwerk effect docker maakt eigen netwerk... obv  waardepapieren-service  mock-nlx

if [ $SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON = "JA" ]
  then waardepapieren_service_config_compose_travis_json      #https://waardepapieren-service:3232 http://mock-nlx:80 docker network... 
fi 

if [ $SET_CLERK_FRONTEND_NGINX_CONF = "JA" ]
    then clerk_frontend_nginx_conf      # docker network fix4https://waardepapieren-service
fi 

# //////////////////////////////////////////////////////////////////////////////////////////

if [ $CMD_DOCKER_COMPOSE = "JA" ]
  then docker_compose_min_f_docker-travis_compose_yml_up
fi 

# //////////////////////////////////////////////////////////////////////////////////////////

echo "docker login succeeded ?"
enter_cont

# //////////////////////////////////////////////////////////////////////////////////////////

if [ $DOCKER_COMMIT = "JA" ]
  then docker_commit
fi 

if [ $DOCKER_PUSH = "JA" ]
  then docker_push
fi 

echo " cd back into " $GITHUB_DIR
cd $GITHUB_DIR

. wp_deploy_aci.bash  

echo
echo "hope the run was ok!"
echo
sleep  4

echo " cd back into " $GITHUB_DIR
cd $GITHUB_DIR
clear




