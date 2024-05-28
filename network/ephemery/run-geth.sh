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

network=ephemery
data_dir=/home/eniko/data/geth/$network

mkdir -p "$data_dir"
echo $data_dir

ephemery_dir=/home/eniko/ephemary

if [ ! -d "$ephemery_dir" ]; then 
  wget https://github.com/ephemery-testnet/ephemery-genesis/releases/download/ephemery-111/testnet-all.tar.gz
  mkdir $ephemery_dir && tar -xzf testnet-all.tar.gz -C $ephemery_dir
  rm testnet-all.tar.gz 
fi

networkid=$(cat $ephemery_dir/genesis.json | grep chainId | tr -d ',' | sed 's/"chainId"://g' | tr -d '[:space:]')
bootnodes=$(awk '{printf "%s,", $0}' $ephemery_dir/boot_enode.txt | sed 's/,$//')

echo "networkid: $networkid"
echo "bootnodes: $bootnodes"

geth init --datadir $data_dir $ephemery_dir/genesis.json

geth --networkid $networkid \
     --datadir "$data_dir" \
     --authrpc.addr localhost \
     --authrpc.port 8551 \
     --authrpc.vhosts localhost \
     --authrpc.jwtsecret "$data_dir/jwtsecret" \
     --http \
     --http.api eth,net \
     --http \
     --bootnodes $bootnodes 

