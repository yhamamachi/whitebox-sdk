#!/bin/bash

BASE_DIR=$(cd `dirname $0` && pwd)

if [ "$1" == "spider" ]; then
    cd ${BASE_DIR}/mcu
    ./build_g4mh_full.sh
    
    cd ${BASE_DIR}/realtime_cpu
    ./build_cr52.sh
	
    cd ${BASE_DIR}/application_cpu
    ./build_ca55.sh
elif [ "$1" == "s4sk" ]; then
    cd ${BASE_DIR}/mcu
    ./build_g4mh_full.sh
    
    cd ${BASE_DIR}/realtime_cpu
    ./build_cr52_s4sk.sh
	
    cd ${BASE_DIR}/application_cpu
    ./build_ca55_s4sk.sh
else
    echo "Please specify the target board to build: \"spider\" or \"s4sk\""
    exit 1
fi

cd ${BASE_DIR}
mkdir -p deploy
cp mcu/safeg-auto/G4MH.srec deploy/App_CDD_ICCOM_S4_Sample_G4MH.srec
cp realtime_cpu/zephyrproject/zephyr/build/zephyr/zephyr.srec deploy/App_CDD_ICCOM_S4_Sample_CR52.srec
cp application_cpu/work/full.img deploy

ls -l deploy

