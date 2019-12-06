### barf
enter_cont() {
    echo
    echo
    echo -n "Press enter to Continue"
    read
}


#
# A start from scratch  git clone 
#

git_clone() {

if [ $GIT_CLONE = "JA" ]
then
echo "afhalen"
cd $PRJ_DIR

 echo "rm -rf waardepapieren sure?"
 echo git --version
 enter_cont
 rm -rf waardepapieren
 git clone https://github.com/discipl/waardepapieren.git
fi
}

