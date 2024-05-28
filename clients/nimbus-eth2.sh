#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

nimbus_beacon_node \
  --network=$network \
  --data-dir=$data_dir \
  --tcp-port=9000 \
  --udp-port=9000 \
  --rest \
  --rest-port=5052 \
  --metrics \
  --web3-url=$endpoint_url \
  --jwt-secret=$secrets_file