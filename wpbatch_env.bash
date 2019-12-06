


CERT_HOST_IP=waardepapieren.westeurope.cloudapp.azure.com  #FQDN
GITHUB_DIR=/Users/boscp08/Dropbox/github/Waardepapieren-AZURE-ACI
PRJ_DIR=/Users/boscp08/Projects/scratch/virtual-insanity
MAIN_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren
CF_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/clerk-frontend
WP_DIR=/Users/boscp08/Projects/scratch/virtual-insanity/waardepapieren/waardepapieren-service

GIT_CLONE="JA"

SET_DOCKERCOMPOSE_TRAVIS_NO_VOLUME="NEE"
SET_DOCKERFILE_CLERK_FRONTEND_NO_VOLUME="NEE"
SET_DOCKERFILE_WAARDEPAPIEREN_NO_VOLUME="NEE"

SET_DOCKERCOMPOSE_TRAVIS_VOLUME="NEE"
SET_DOCKERFILE_CLERK_FRONTEND_VOLUME="NEE"
SET_DOCKERFILE_WAARDEPAPIEREN_VOLUME="NEE"


echo "---"
echo "directories"
echo "GITHUB_DIR="$GITHUB_DIR
echo "PRJ_DIR="$PRJ_DIR
echo "MAIN_DIR="$MAIN_DIR
echo "clerk_fontend="$CF_DIR
echo "---" 

echo "content of wpbatch_env.bash  "
echo "GIT_CLONE= "$GIT_CLONE
echo "DOCKER-COMPOSE= "$COMPOSE
echo "SET_FQDN="$SET_FQDN








