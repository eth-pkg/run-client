#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

erigon --chain $network \
       --datadir $data_dir \
       --http \
       --private.api.addr $endpoint_url \
       --authrpc.jwtsecret $secrets_file

# Confirm node is running 