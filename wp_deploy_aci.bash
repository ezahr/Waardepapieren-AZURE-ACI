
# //////////////////////////////////////////////////////////////////////////////////////////
#    File Type   :- BASH Script (needs docker and docker-composeenvironment installed)
#  
#    Description :- This script makes a backup using export tool (oracle)
#    Modified           Date            Description
#    --------           --------        -------------------------------------------------
#    Peter Bosch       05.12.2019      Initial version.
#
# //////////////////////////////////////////////////////////////////////////////////////////
# File:            :wp_deploy_aci.bash
# version          :20190412 v0
# File Type        :Bash 
# Purpose          :Creating an optimized production build...     
# Title:           :https://github.com/discipl/waardepapieren 
# Category         :Discipl deploy script
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI wp_compose.bash

# big thanks to pim Otte en Stef van Leeuwen Wigo4it  
# rationale
# Use this task in a build or release pipeline to run a Bash script on macOS, Linux, or Windows. 
# DevOps: REST API Execution Through Bash Shell Scripting
# I hope this helps my fellow (bash) hackers out there.
# container brings its own file system, on every type of system

# ********** instructies **********
#1. start bash shell
#2. in wpprod_env.bash staan de modules hoef je in principe niet te wijzigen
#3. in wpbatch_env.bash staan de stuurparameters worden aan begin getoond. naar behoefte wijzigen.
#4  run het script `. wp_deploy_aci.bash`  

# ********** Parameters **********

. wpbatch_env.bash

# ********** functies **********

. wpprod_env.bash  


echo "***"   
echo "***  Welcome to  depdocker-compose "
echo "***"   
echo "***" 
echo "***  You are about to bring waardepapieren new images via dockerhub to azure cloud  AZURE Container Instances "
echo "***  droplet-targethost= https://$CERT_HOST_IP " 
echo "***" 



#######################
## M A I N
# program starts here actually
#######################


echo "docker login succeeded ?"
enter_cont

echo "az login succeeded ?"
enter_cont


echo "DOCKER_USER="$DOCKER_USER         
echo "DOCKER_VERSION_TAG"$DOCKER_VERSION_TAG
echo "DOCKER_PUSH="$DOCKER_PUSH
echo "DOCKER_COMMIT="$DOCKER_COMMIT
echo "AZ_RESOURCE_GROUP="$AZ_RESOURCE_GROUP=
echo "AZ_RESOURCE_GROUP_DELETE="$AZ_RESOURCE_GROUP_DELETE
echo "AZ_RESOURCE_GROUP_DELETE"$AZ_RESOURCE_GROUP_CREATE
echo "AZ_CREATE_DEPLOY_ACI_FILE="$AZ_DEPLOY_ACI_FILE
echo "AZ_RESOURCE_GROUP_DELETE="$CREATE_AZ_DEPLOY_ACI_YAML
echo "CMD_AZ_CREATE_CONTAINERGROUP="$CMD_AZ_CREATE_CONTAINERGROUP



# //////////////////////////////////////////////////////////////////////////////////////////

if [ $DOCKER_COMMIT = "JA" ]
  then docker_commit
fi 

if [ $DOCKER_PUSH= "JA" ]
  then docker_push
fi 

# //////////////////////////////////////////////////////////////////////////////////////

if [ $CREATE_AZ_DEPLOY_ACI_YAML "JA" ]
  then create_azure_deploy_aci_yml
fi 

# //////////////////////////////////////////////////////////////////////////////////////////



if [ $SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME = "JA" ]
  then waardepapieren_service_dockerfile_with_volumes 
fi 

AZ_RESOURCE_GROUP_DELETE


AZ_RESOURCE_GROUP_DELETE



# //////////////////////////////////////////////////////////////////////////////////////////





echo
echo "hope the run was ok!"
echo
sleep  4

echo " cd back into " $GITHUB_DIR
cd $GITHUB_DIR
clear




