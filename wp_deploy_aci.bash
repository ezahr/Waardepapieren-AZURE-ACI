
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
# version          :20191204 v0
# File Type        :Bash 
# Purpose          :software is increasingly complex, containers alow to deploy application together     
# Title:           :https://github.com/discipl/waardepapieren 
# Category         :Discipl deploy script
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI wp_compose.bash

# big thanks to pim Otte en Stef van Leeuwen Wigo4it  
# rationale
# Use this task in a build or release pipeline to run a Bash script on macOS, Linux, or Windows. 
# DevOps: REST API Execution Through Bash Shell Scripting
# I hope this helps my fellow (bash) hackers out there.
# container brings its own file system, on every type of system

 
# Je bouwt een docker op je laptop en is daarna hetzelfde als in productie. Daarom zou je containers moeten gebruiken. 
# Applicatie is binnen de DTAP straat overal het zelfde. OTAP is het belangrijkste. Pets & Cattle!
# Docker is niet snel, k8s zijn voor  highperformance wil doen 

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
#https://docs.microsoft.com/en-us/azure/virtual-machines/azure-cli-arm-commands
#https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli?view=azure-cli-latest
az group list
enter_cont

# //////////////////////////////////////////////////////////////////////////////////////////

if [ $DOCKER_COMMIT = "JA" ]
  then docker_commit
fi 

if [ $DOCKER_PUSH = "JA" ]
  then docker_push
fi 

# //////////////////////////////////////////////////////////////////////////////////////


if [ $CREATE_AZ_DEPLOY_ACI_YAML = "JA" ]
  then create_azure_deploy_aci_yaml
fi 

if [ $AZ_RESOURCE_GROUP_DELETE = "JA" ]
  then delete_azure_resource_group
fi 

if [ $AZ_RESOURCE_GROUP_CREATE = "JA" ]
  then create_azure_resource_group
fi 

if [ $CMD_AZ_CREATE_CONTAINERGROUP =  "JA" ]
  then create_azure_container_group   #blader naar portal.azure.com  bosch.peter@outlook.com 0l....n
fi 

# //////////////////////////////////////////////////////////////////////////////////////////


echo
echo "hope the run was ok!"
echo
sleep  2

echo " cd back into " $GITHUB_DIR
cd $GITHUB_DIR
clear




