#!/bin/bash

# //////////////////////////////////////////////////////////////////////////////////////////
#    File Type   :- BASH Script (needs docker and docker-composeenvironment installed)
#  
#    Description :- This script makes a backup using export tool (oracle)
#    Modified           Date            Description
#    --------           --------        -------------------------------------------------
#    Peter Bosch       05.12.2019      Initial version.
#
# //////////////////////////////////////////////////////////////////////////////////////////
# File:            :echo2.bash
# version          :20190412 v0
# File Type        :Bash 
# Purpose          :build waardepapieren      
# Title:           :
# Category         :Discipl deploy script
# Identificatie    :https://github.com/ezahr/Waardepapieren-AZURE-ACI 

#'big thanks to pim Otte en Stef van Leeuwen Wigo4il  
# rationale
# Use this task in a build or release pipeline to run a Bash script on macOS, Linux, or Windows. 
# DevOps: REST API Execution Through Bash Shell Scripting
# I hope this helps my fellow (bash) hackers out there.

# ********** instructies **********
#1. start bash shell
#2. in wpprod_env.bash staan de modules hoef je in principe niet te wijzigen
#3. in wpbatch_env.bash staan de stuurparameters worden aan begin getoond. naar behoefte wijzigen.
#4  run het script `. echo2.bash`  

# ********** functies **********

. wpprod_env.bash  

# ********** Parameters **********

. wpbatch_env.bash

echo "***"   
echo "***  Welcome to  docker-compose "
echo "***"   
echo "***" 
echo "***  You are about to start to build new waardepapieren images and containers "
echo "***  targethost= https://$CERT_HOST_IP " 
echo "***" 

enter_cont

#######################
## M A I N
# program starts here actually
#######################

if [ $GIT_CLONE = "JA" ] 
then git_clone 
fi 


echo
echo "hope the run was ok!"
echo
sleep  5

echo " cd back into " $GIT_DIR
cd $GITHUB_DIR
clear




