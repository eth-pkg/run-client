#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

beacon-chain \
	--execution-endpoint=http://$endpoint_url \
	--mainnet \
	--jwt-secret=$secrets_file \
	--checkpoint-sync-url=$checkpoint_sync_url \
	--genesis-beacon-api-url=$beacon_api_url \
	--accept-terms-of-use
