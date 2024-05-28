#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

geth \
 --mainnet \
 --datadir "$data_dir" \
 --authrpc.addr "localhost" \
 --authrpc.port 8551 \
 --authrpc.vhosts "localhost" \
 --authrpc.jwtsecret "$secrets_file" \
 --http \
 --http.api eth,net 