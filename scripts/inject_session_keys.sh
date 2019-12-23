#!/bin/bash

set -euo pipefail
set -x

RPC_ENDPOINT=${1}
STATEFULSET_NAME=${2}

extract_public_key(){
    local key_type=${1}
    local key_seed=${2}

    if [ "$key_type" = "gran" ]; then
        CRYPTO=ed25519
    else
        CRYPTO=sr25519
    fi

    echo -n $(subkey --"${CRYPTO}" inspect "${key_seed}" | grep "Public key" | cut -d':' -f2 | tr -d '[:space:]')
}

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
        /keys/parachain-session)
            KEY_TYPE=para
            ;;
        *)
            KEY_TYPE=
            ;;
    esac

    if [ ! -z "${KEY_TYPE}" ]; then
        PUBLIC_KEY=$(extract_public_key "${KEY_TYPE}" "${KEY_SEED}")

        curl -H "Content-Type: application/json" \
             --data '{ "jsonrpc":"2.0", "method":"author_insertKey", "params":["'"${KEY_TYPE}"'", "'"${KEY_SEED}"'", "'"${PUBLIC_KEY}"'"],"id":1 }' \
             "${RPC_ENDPOINT}"
    fi
done

# restart pod to start using the grandpa key
CURRENT_DIR=$(dirname "$0")

$CURRENT_DIR/restart_pods.sh "${STATEFULSET_NAME}"
