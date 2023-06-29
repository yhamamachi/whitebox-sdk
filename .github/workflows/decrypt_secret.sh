#!/bin/bash

# Decrypt the file
# --batch to prevent interactive command
# --yes to assume "yes" for questions
SCRIPT_DIR=$(cd `dirname $0` && pwd)
gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" \
    --output ${SCRIPT_DIR}/../../tool/CC-RH_V20500_setup-doc.zip \
    ${SCRIPT_DIR}/CC-RH_V20500_setup-doc.zip.gpg

