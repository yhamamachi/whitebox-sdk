#!/bin/bash

#################################
# Global variable
#################################
WB_VER=v4.1
CCRH_COMPILER=CC-RH_V20500_setup-doc.zip
WORK=$(pwd)

#################################
# Check proprietary package
#################################
if [[ ! -e ${WORK}/$CCRH_COMPILER ]] ; then
    echo "Error: ${WORK}/$CCRH_COMPILER is not found !!"
    exit -1
fi

#################################
# Setup Repository
#################################
echo Install git client # 既に入っている環境の場合はスキップする処理を入れる

if [[ $(git --version > /dev/null 2>&1 ; echo $?) -ne 0 ]]; then
    echo sudo apt install git
    sudo apt install git
else
    echo "--> Skipped because git clinet is already installed."
fi
echo ------ # splitter

echo "Setup git config(Add username and email)"
if [[ "$(git config --global --list | grep user)" == "" ]]; then
    git config --global user.name "Dummy"
    git config --global user.email "dummy@example.com"
else
    echo "--> Skipped because user infomation is already setup."
    git config --global --list | grep user
fi
echo ------ # splitter

echo Download whitebox SDK repository
if [[ ! -d ${WORK}/whitebox-sdk ]] ;then
    git clone https://github.com/renesas-rcar/whitebox-sdk.git -b ${WB_VER} ${WORK}/whitebox-sdk
else
    echo "--> whitebox-sdk is already downloaded."
    echo "    Try to download latest version if possible."
    cd ${WORK}/whitebox-sdk
    echo -n "    " && git fetch && git reset --hard ${WB_VER}
    cd ${WORK}
fi

#################################
# Setup build env
#################################
cd ${WORK}/whitebox-sdk/tool
cp ${WORK}/${CCRH_COMPILER} ./
./setup_whitebox.sh

#################################
# build s4sk image
#################################
cd ${WORK}/whitebox-sdk
./build_whitebox_${WB_VER}.sh s4sk

echo "+------------------+"
echo "|  Build is done!  |"
echo "+------------------+"

