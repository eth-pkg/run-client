#!/usr/bin/env bash 

set -e

error_handler() {
    echo "Error occurred in script at line: $1"
    echo "Command executed: $2"
    exit 1
}

# Trap errors and call the error_handler function
trap 'error_handler ${LINENO} "${BASH_COMMAND}"' ERR


valid_execution_clients=("besu" "erigon" "geth" "nethermind")
valid_consensus_clients=("lighthouse" "lodestar" "nimbus-eth2" "prysm" "teku")
valid_network_options=("mainnet" "sepolia" "ephemery")

declare -A latest_clients

latest_clients["besu"]="24.5.1"
latest_clients["erigon"]="2.60.0"
latest_clients["geth"]="1.14.3"
latest_clients["lighthouse"]="5.1.3"
latest_clients["lodestar"]="1.18.1"
latest_clients["nethermind"]="1.26.0"
latest_clients["nimbus-eth2"]="24.5.1"
latest_clients["prysm"]="5.0.3"
latest_clients["teku"]="24.4.0"



create_data_dir_if_not_exists(){
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
    fi
}

create_secrets_file_if_not_exists(){
    if [ ! -f "$1" ]; then
        ## todo apply permissions
        openssl rand -hex 32 | tr -d "\n" | sudo tee $1
    fi 
}

# Function to display usage information
run_node_usage() {
    echo "Usage: $0 [ --network mainnet|sepolia|ephemery ]\
                    [ --consensus-client lighthouse|lodestar|nimbus-eth2|prysm|teku ] \
                    [ --execution-client besu|erigon|geth|nethermind ] \
                    [ --run execution|consensus ] \
                    [ --run-validator ]"
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
    network=
    consensus_client=
    execution_client=
    run=
    run_validator=false

    OPTS=$(getopt -o '' -l "network:\
                            ,consensus-client:\
                            ,execution-client:\
                            ,run:\
                            ,run-validator" -n "$0" -- "$@")
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

    if [[ -n "$network" ]]; then
        if ! is_valid_option "$network" "${valid_network_options[@]}"; then
            echo "Invalid network: $network"
            usage
        fi
    fi


    if [[ "$run" != "consensus" && "$run" != "execution" ]]; then
        echo "run value must be consensus or execution"
        echo "provided value is: $run"
        run_node_usage
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
    echo "Run a validator: $run_validator"

}

# Parse command-line options, standardized options for all clients
run_node_parse_options "$@"

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# source variables
set -a 
source "$script_dir/network/$network/$execution_client-$consensus_client/shared.env"
set +a

create_data_dir_if_not_exists $SHARED_CONFIG_DATA_DIR
create_secrets_file_if_not_exists $SHARED_CONFIG_SECRETS_FILE

if [ "$network" == "ephemery" ]; then 
    echo "fetching ephemery state"
    # TODO option to reset
    # rm -rf $ephemery_dir
    if [ ! -d "$SHARED_CONFIG_TESTNET_DIR" ];then
        wget -q https://github.com/ephemery-testnet/ephemery-genesis/releases/download/ephemery-111/testnet-all.tar.gz
        mkdir $SHARED_CONFIG_TESTNET_DIR && tar -xzf testnet-all.tar.gz -C $SHARED_CONFIG_TESTNET_DIR
        rm testnet-all.tar.gz 
    fi 
    SHARED_CONFIG_NETWORK_ID=$(cat $SHARED_CONFIG_TESTNET_DIR/genesis.json | grep chainId | tr -d ',' | sed 's/"chainId"://g' | tr -d '[:space:]')
    SHARED_CONFIG_BOOTNODES=$(awk '{printf "%s,", $0}' $SHARED_CONFIG_TESTNET_DIR/boot_enode.txt | sed 's/,$//')
    export SHARED_CONFIG_NETWORK_ID
    export SHARED_CONFIG_BOOTNODES
fi

script=""

latest_execution_client_version=${latest_clients["$execution_client"]}
latest_consensus_client_version=${latest_clients["$consensus_client"]}

if [ "$run" = "execution" ]; then 
    script="$script_dir/clients/$execution_client/$latest_execution_client_version/run-$execution_client.sh"
    chmod +x "$script"
    $script --env-file "$script_dir/network/$network/$execution_client-$consensus_client/$execution_client.env"

else 
    script="$script_dir/clients/$consensus_client/$latest_consensus_client_version/run-$consensus_client.sh"
    chmod +x "$script"
    $script --env-file "$script_dir/network/$network/$execution_client-$consensus_client/$consensus_client.env"
fi 
