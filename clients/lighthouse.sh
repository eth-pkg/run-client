#!/usr/bin/env bash 

set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

lighthouse bn \
  --network $network \
  --execution-endpoint $endpoint_url \
  --execution-jwt $secrets_file \
  --checkpoint-sync-url $checkpoint_sync_url \
  --disable-deposit-contract-sync
