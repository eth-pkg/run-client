#!/usr/bin/env bash 

set -e

# Function to handle errors
error_handler() {
    echo "Error occurred in script at line: $1"
    echo "Command executed: $2"
    exit 1
}

# Trap errors and call the error_handler function
trap 'error_handler ${LINENO} "${BASH_COMMAND}"' ERR

checkpoint_sync_url=https://checkpointz.bordel.wtf
network=ephemary
data_dir=$HOME/data/geth/$network
testnet_dir=$HOME/ephemary
bootnodes=$(cat $testnet_dir/boot_enode.txt | awk '{printf "\"%s\",", $0}' | sed 's/,$/\n/')
bootnodes="\"enode://466ec34d079a9a5b8d7aff0ec8e692107a97fb98b90a44ad61ca58e8001170c7b5ccfe383f8e4dda352ecad9e16ceff88e9ae640084af232fcd5ca1a0f799b0a@137.74.203.240:30303\""
#bootnodes="$bootnodes,enode://0f2c301a9a3f9fa2ccfa362b79552c052905d8c2982f707f46cd29ece5a9e1c14ecd06f4ac951b228f059a43c6284a1a14fce709e8976cac93b50345218bf2e9@135.181.140.168:30343"
echo "bootnodes: $bootnodes"

lighthouse bn \
  --testnet-dir $testnet_dir \
  --datadir $data_dir
  --execution-endpoint http://localhost:8551 \
  --execution-jwt $data_dir/jwtsecret \
  --checkpoint-sync-url $checkpoint_sync_url \
  --disable-deposit-contract-sync 
//  --boot-nodes "$bootnodes"

