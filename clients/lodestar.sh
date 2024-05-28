#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

lodestar beacon --network $network \
	--jwtSecret $secrets_file \
	--execution.urls $endpoint_url \
	--checkpointSyncUrl $checkpoint_sync_url
