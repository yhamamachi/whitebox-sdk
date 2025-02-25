#!/bin/bash

export LANG=C

unset DISPLAY

TMP_DIR=$(pwd)/tmp

rm -rf ${TMP_DIR}

if [ $# != 1 ]; then
  echo "Usage : setup_csp CC-RH_install_file(zip)"
  exit -1
fi

ZIPNAME=$1

if [[ ! $ZIPNAME = /* ]]; then
  ZIPNAME=$(pwd)/$ZIPNAME
fi

if [ ! -e $ZIPNAME ]; then
  echo -e "\e[31mERROR: CC-RH_install_file(zip) is not found.\e[m"
  exit -2
fi

sudo apt install p7zip-full -y

FILENAME=${ZIPNAME##*/}
FOLDERNAME=${FILENAME%%.*}
EXENAME=${FOLDERNAME%%-doc}.exe

mkdir -p ${TMP_DIR}
cd ${TMP_DIR}

unzip $ZIPNAME
cd $FOLDERNAME

echo $FILENAME
echo $FOLDERNAME
echo $EXENAME


wine $EXENAME /s /v"/qn"

