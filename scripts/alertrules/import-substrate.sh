#!/bin/bash

CURRENT_DIR=$(dirname "$0")
source ${CURRENT_DIR}/vars.sh

git clone -b ${SUBSTRATE_VER} https://github.com/paritytech/substrate.git ${SUBSTRATE_FOLDER}
