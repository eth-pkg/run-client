#!/usr/bin/env bash 

set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$script_dir/commons.sh"

# Function to display usage information
run_node_usage() {
    echo "Usage: $0 [--network value] [--consensus-client lighthouse|lodestar|nimbus-eth2|prysm|teku] [--execution-client besu|erigon|geth|nethermind] [--run execution|consensus ] [--run-validator]"
    exit 1
}



is_valid_option() {
    local option="$1"
    shift
    local array=("$@")
    for element in "${array[@]}"; do
        if [[ "$element" == "$option" ]]; then
            return 0
        fi
    done
    return 1
}

# Function to parse command-line options
run_node_parse_options() {
    valid_consensus_clients=("lighthouse" "lodestar" "nimbus-eth2" "prysm" "teku")
    valid_execution_clients=("besu" "erigon" "geth" "nethermind")
    valid_networks=("mainnet" "ephemery")
    valid_runs=("execution" "consensus")

    # Initialize variables
    network=
    consensus_client=
    execution_client=
    run=
    run_validator=false

    OPTS=$(getopt -o '' -l "network:,consensus-client:,execution-client:,run:,run-validator" -n "$0" -- "$@")
    if [ $? != 0 ]; then
        run_node_usage
    fi

    eval set -- "$OPTS"

    while true; do
        case "$1" in
            --network)
                network="$2"
                shift 2
                ;;
            --consensus-client)
                consensus_client="$2"
                shift 2
                ;;
            --execution-client)
                execution_client="$2"
                shift 2
                ;;
            --run)
                run="$2"
                shift 2
                ;;
            --run-validator)
                run_validator="$2"
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
    if  [ -z "$network" ]; then
	    echo "please provide a network value"
        run_node_usage
    fi

    if  [ -z "$consensus_client" ]; then
	    echo "please provide consensus-client value"
        run_node_usage
    fi

    if  [ -z "$execution_client" ]; then
	    echo "please provide execution-client value"
        run_node_usage
    fi

    if  [ -z "$run" ]; then
	    echo "please provide run value"
        run_node_usage
    fi

    # Validate consensus client
    if [[ -n "$consensus_client" ]]; then
        if ! is_valid_option "$consensus_client" "${valid_consensus_clients[@]}"; then
            echo "Invalid consensus client: $consensus_client"
            usage
        fi
    fi

    # Validate execution client
    if [[ -n "$execution_client" ]]; then
        if ! is_valid_option "$execution_client" "${valid_execution_clients[@]}"; then
            echo "Invalid execution client: $execution_client"
            usage
        fi
    fi

     # Validate network
    if [[ -n "$network" ]]; then
        if ! is_valid_option "$network" "${valid_networks[@]}"; then
            echo "Invalid network: $network"
            usage
        fi
    fi


     # Validate run
    if [[ -n "$run" ]]; then
        if ! is_valid_option "$run" "${valid_runs[@]}"; then
            echo "Invalid run: $run"
            usage
        fi
    fi

    if [[ "$run_validator" == true && "$run_validator" != false ]]; then
        echo "run-validator value must be true or false"
        echo "provided value is: $run_validator"
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

bootnodes=""
networkid=""
# ephemery setup
if [ "$network" == "ephemery" ]; then 
    echo "fetching ephemery state"
    # TODO option to reset
    # rm -rf $ephemery_dir
    if [ ! -d "$ephemery_dir" ];then
        wget -q https://github.com/ephemery-testnet/ephemery-genesis/releases/download/ephemery-111/testnet-all.tar.gz
        mkdir $ephemery_dir && tar -xzf testnet-all.tar.gz -C $ephemery_dir
        rm testnet-all.tar.gz 
    fi 
    networkid=$(cat $ephemery_dir/genesis.json | grep chainId | tr -d ',' | sed 's/"chainId"://g' | tr -d '[:space:]')
    bootnodes=$(awk '{printf "%s,", $0}' $ephemery_dir/boot_enode.txt | sed 's/,$//')
fi


script=""

if [ "$run" = "execution" ]; then 
    script="$script_dir/clients/$execution_client.sh"
else 
    script="$script_dir/clients/$consensus_client.sh"
fi 

chmod +x "$script"

$script --data-dir "$data_dir" \
        --secrets-file "$secrets_file" \
        --endpoint-url "$endpoint_url" \
        --checkpoint-sync-url "$checkpoint_sync_url" \
        --network "$network" \
        --run-validator "$run_validator" \
        --networkid  "$networkid" \
        --bootnodes "$bootnodes" \
        --genesis-file "$genesis_file"

