#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

besu --data-path "$data_dir" \
  --rpc-http-enabled=true      \
  --rpc-http-host=0.0.0.0      \
  --rpc-ws-enabled=true        \
  --rpc-ws-host=0.0.0.0        \
  --host-allowlist=127.0.0.1,localhost        \
  --engine-host-allowlist=127.0.0.1,localhost \
  --engine-rpc-enabled        \
  --engine-jwt-secret=$secrets_file