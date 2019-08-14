#!/bin/bash

set -euo pipefail

RPC_ENDPOINT=${1}

for key in /keys/*; do
    [ -e "$key" ] || continue

    KEY_SEED=$(cat "$key")

    case "$key" in
        /keys/grandpa-session)
            KEY_TYPE=gran
            ;;
        /keys/babe-session)
            KEY_TYPE=babe
            ;;
        /keys/imonline-session)
            KEY_TYPE=imon
            ;;
        *)
            KEY_TYPE=
            ;;
    esac

    if [ ! -z "${KEY_TYPE}" ]; then
        curl -H "Content-Type: application/json" \
             --data '{ "jsonrpc":"2.0", "method":"author_insertKey", "params":["'"${KEY_TYPE}"'", "'"${KEY_SEED}"'"],"id":1 }' \
             "${RPC_ENDPOINT}"
    fi
done
