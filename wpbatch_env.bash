

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
DOCKER_COMPOSE_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren
CLIENT_FRONTEND_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
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
#echo "-- configuration setters " 
SET_DOCKERCOMPOSE_TRAVIS_NO_VOLUME="NEE"
SET_DOCKERFILE_CLERK_FRONTEND_NO_VOLUME="NEE"
SET_DOCKERFILE_WAARDEPAPIEREN_NO_VOLUME="NEE"
SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="NEE"
SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="NEE"
SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="NEE"

echo "SET_DOCKERCOMPOSE_TRAVIS_NO_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_NO_VOLUME     
echo "SET_DOCKERFILE_CLERK_FRONTEND_NO_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_NO_VOLUME
echo "SET_DOCKERFILE_WAARDEPAPIEREN_NO_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_NO_VOLUME
echo "SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME="$SET_DOCKERCOMPOSE_TRAVIS_WITH_VOLUME
echo "SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME="$SET_DOCKERFILE_CLERK_FRONTEND_WITH_VOLUME
echo "SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME="$SET_DOCKERFILE_WAARDEPAPIEREN_WITH_VOLUME
#echo "---"
# //////////////////////////////////////////////////////////////////////////////////////////
######################
## CMD
######################
CMD_GIT_CLONE="JA"
CMD_DOCKER_COMPOSE="NEE"
CMD_DOCKER_COMPOSE_BUILD=" --build"

echo "CMD_GIT_CLONE="$CMD_GIT_CLONE
echo "CMD_DOCKER_COMPOSE="$BUILD_DOCKER_COMPOSE
echo "CMD_DOCKER_COMPOSE_BUILD="$CMD_DOCKER_COMPOSE_BUILD

#EOF