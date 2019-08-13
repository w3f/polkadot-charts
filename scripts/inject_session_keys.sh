#!/bin/bash

RPC_ENDPOINT=${1}

for key in /keys/*; do
    [ -e "$key" ] || continue

    KEY_SEED=$(cat "$key")

    case "$key" in
        grandpa-session)
            KEY_TYPE=ed25
            break
            ;;
        *)
            KEY_TYPE=sr25
            ;;
    esac

    echo "KEY_SEED: $KEY_SEED"
    echo "KEY_TYPE: $KEY_TYPE"

    curl -H -v "Content-Type: application/json" \
         --data '{ "jsonrpc":"2.0", "method":"author_insertKey", "params":["keyType": "'"${KEY_TYPE}"'", "suri": "'"${KEY_SEED}"'"],"id":1 }' \
         "${RPC_ENDPOINT}"
done
