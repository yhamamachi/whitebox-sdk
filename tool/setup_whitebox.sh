#!/bin/bash

ZIPNAME=CC-RH_V20500_setup-doc.zip
cd $(dirname $0)

if [[ ! $ZIPNAME = /* ]]; then
  ZIPNAME=$(pwd)/$ZIPNAME
fi

if [ ! -e $ZIPNAME ]; then
  echo -e "\e[31mERROR: CC-RH_install_file(zip) is not found.\e[m"
  exit
fi

./setup_wine.sh
./setup_csp.sh CC-RH_V20500_setup-doc.zip
./setup_ca55.sh
./setup_cr52.sh
./setup_safeg.sh

# あとでどのスクリプトに属するべきか判別して整理する必要あり。
sudo apt install picocom -y
sudo pip3 install pyserial
sudo pip3 install pyserial --upgrade

