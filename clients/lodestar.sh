#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

lodestar beacon --network $network \
    --dataDir $data_dir \
	--jwtSecret $secrets_file \
	## this also requires http
	--execution.urls http://$endpoint_url \
	--checkpointSyncUrl $checkpoint_sync_url
