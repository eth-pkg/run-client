#!/usr/bin/env bash 

set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$script_dir/commons.sh"

# Function to display usage information
run_node_usage() {
    echo "Usage: $0 [--network value] [--consensus-client value] [--execution-client value] [--run execution|consensus ] [--run-validator]"
    exit 1
}

# Function to parse command-line options
run_node_parse_options() {
    # Initialize variables
    network=""
    consensus_client=""
    execution_client=""
    run=execution
    run_validator=false

    OPTS=$(getopt -o '' -l "network:,consensus-client:,execution-client:run-validator" -n "$0" -- "$@")
    if [ $? != 0 ]; then
        run_node_usage
    fi

    eval set -- "$OPTS"

    while true; do
        case "$1" in
            --network)
                secrets_file="$2"
                shift 2
                ;;
            --consensus-client)
                data_dir="$2"
                shift 2
                ;;
            --execution-client)
                network="$3"
                shift 2
                ;;
            --run)
                run="$4"
                shift 2
                ;;
            --run-validator)
                run_validator=true
                shift 2
                ;;    
            --)
                shift
                break
                ;;
            *)
                run_node_usage
                ;;
        esac
    done

    # Validate required options, everything is required, defaults are given
    if  [ -z "$network" ] || [ -z "$consensus_client" ] || [ -z "$execution_client" ] || [ -z "$run" ]; then
        run_node_usage
    fi

    if [[ "$value" == "consensus" || "$value" == "execution" ]]; then
        # do nothing
    else
        run_node_usage
    fi

    if [[ "$value" == "consensus" || "$value" == "execution" ]]; then
        # do nothing
    else
        run_node_usage
    fi

    echo "Network: $network"
    echo "Consensus Client: $consensus_client"
    echo "Execution Client: $execution_client"
    echo "Running Client: $run"
    echo "Run validator: $run_validator"

}

# Parse command-line options, standardized options for all clients
run_node_parse_options "$@"

# source variables
source "$script_dir/network/$network/$execution_client-$consensus_client/vars.env"


create_data_dir_if_not_exists $data_dir
create_secrets_file_if_not_exists $secrets_file

script=""

if [ "$run" = "execution" ]; then 
    script="$script_dir/clients/$execution_client.sh"
else 
    script="$script_dir/clients/$consensus_client.sh"
fi 

chmod +x "$script"

$script --data_dir $data_dir \
        --secrets-file $secrets_file \
        --endpoint-url $endpoint_url \
        --checkpoint-sync-url $checkpoint_sync_url \
        --network $network \
        --run-validator $run_validator

