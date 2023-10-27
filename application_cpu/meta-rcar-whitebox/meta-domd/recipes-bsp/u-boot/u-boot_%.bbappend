FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

BRANCH = "v2020.10/rcar-5.1.1.rc9"
SRCREV = "616f05eb5a88014037bd92ea0f1c3bfe6ea2444a"

SRC_URI_append = " \
    file://0001-HACK-Improve-large-file-download-via-TFTP.patch \
    file://0001-Update-default-environmet-variable-for-Whitebox.patch \
"

SRC_URI_append_s4sk = " \
    file://0002-WIP-Add-default-variable-for-Setting-MAC-address-of-.patch \
"

