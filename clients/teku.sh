#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

teku \
    --ee-endpoint=http://$endpoint_url                    \
    --ee-jwt-secret-file=$secrets_file                     \
    --metrics-enabled=true                                 \
    --rest-api-enabled=true                                \
    --checkpoint-sync-url=$checkpoint_sync_url  \
    --data-path $data_dir
