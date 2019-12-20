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

# ********** Parameters **********

. wp_parameters.bash

# ********** functions **********

. wpprod_env.bash  

echo "***"   
echo "***  Welcome to  docker-compose "
echo "***"   
echo "***" 
echo "***  You are about to start to build new waardepapieren images and containers "
echo "***  droplet-targethost= https://$CERT_HOST_IP docker-tag = $DOCKER_VERSION_TAG  ACI-resourcegroup=$AZ_RESOURCE_GROUP " 
echo "***" 


#######################
## M A I N
# program starts here actually
#######################

echo "program starts here actually"

enter_cont

if [ $CMD_GIT_CLONE = true ] 
  then git_clone 
fi 

if [ $SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME = true ]
  then docker_compose_travis_yml_with_volumes
fi 

if [ $SET_DOCKERCOMPOSE_TRAVIS_WITHOUT_VOLUME = true ]
  then docker_compose_travis_yml_without_volumes 
fi 


# docker files

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


# bypass vilein docker netwerk effect docker maakt eigen netwerk... obv  waardepapieren-service  mock-nlx

if [ $SET_WAARDEPAPIEREN_SERVICE_CONFIG_COMPOSE_TRAVIS_JSON = true ]
  then waardepapieren_service_config_compose_travis_json      #https://waardepapieren-service:3232 http://mock-nlx:80 docker network... 
fi 

if [ $SET_CLERK_FRONTEND_NGINX_CONF = true ]
    then clerk_frontend_nginx_conf      # docker network fix4https://waardepapieren-service
fi 


if [ $CMD_DOCKER_COMPOSE = true ]
  then docker_compose_min_f_docker-travis_compose_yml_up
fi 


echo "docker login succeeded ?"
enter_cont

if [ $DOCKER_TAG = true ]
  then docker_tag
fi 

if [ $DOCKER_PUSH = true ]
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
