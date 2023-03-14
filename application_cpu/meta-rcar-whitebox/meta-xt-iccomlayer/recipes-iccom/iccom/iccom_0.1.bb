DESCRIPTION = "iccom driver for R-Car S4"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

inherit module

PR = "r0"
PV = "0.1"

SRC_URI = "git://github.com/CogentEmbedded/kernel-module-iccom.git;branch=master;protocol=https"
SRCREV = "a8c50ea65865ca72c7f53e8fcf893b6b512c3db2"

SRC_URI_append = "\
    file://0001-Cleanup-and-improve-performance.patch \
"
S = "${WORKDIR}/git"

