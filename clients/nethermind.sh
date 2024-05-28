#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

nethermind \
  -c $network \
  --JsonRpc.JwtSecretFile $secrets_file \
  --datadir $data_dir