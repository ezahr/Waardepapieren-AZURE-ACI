#!/bin/bash
#basic statements

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

#CERT_HOST_IP=waardepapieren.westeurope.cloudapp.azure.com  #FQDN linux VVM
#CERT_HOST_IP=waardepapieren.westeurope.azurecontainer.io  #FQDN AZURE CONTAINER INSTANCES
#CERT_HOST_IP=discipl.westeurope.azurecontainer.io  #FQDN AZURE CONTAINER INSTANCES
#  https://waardepapieren-demo.discipl.org/   PIM OTTE
# zou nu in een staat moeten zijn dat deze redelijk stabiel is, en ook werkt van achter firewalls. 
#Er is wel een kleine issue dat je het soms 2x moet proberen voor het werkt.
#Als mensen het uitproberen hoor ik graag:
#Als het helemaal niet werkt (ook niet na een tweede keer proberen)
#Als het soms niet werkt (met zo veel mogelijk details)



# //////////////////////////////////////////////////////////////////////////////////////////
#echo "#######################" 
#echo "# Directories used " 
#echo "#######################"

HOME_DIR=/Users/boscp08 
#echo $HOME_DIR
#enter_cont


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


if [ $PROMPT = "JA" ] 
 then 
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
#enter_cont
fi


# //////////////////////////////////////////////////////////////////////////////////////////
#EOF  hope the run will be okay.