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
valid_network_options=("mainnet" "sepolia" "ephemery" "holesky" "devnet")
valid_run_options=("execution" "consensus" "validator" "bootnode")

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
  echo "Usage: $0 [ --network mainnet|sepolia|ephemery|holesky|devnet ] \
[ --consensus-client lighthouse|lodestar|nimbus-eth2|prysm|teku ] \
[ --execution-client besu|erigon|geth|nethermind ] \
[ --run execution|consensus|validator|bootnode ] \
[ --with-validator ]
"
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
                            ,with-validator" -n "$0" -- "$@")
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
            --with-validator)
                run_validator=true
                shift 1
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

    if [[ -n "$run" ]]; then
        if ! is_valid_option "$run" "${valid_run_options[@]}"; then
            echo "Invalid run: $run"
            usage
        fi
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
    ENR_FILE="$SHARED_CONFIG_TESTNET_DIR/boot_enr.txt"
    SHARED_CONFIG_BOOTNODES=$(awk '{printf "%s,", $0}' "$ENR_FILE" | sed -e "s/- enr/enr/g" -e 's/,$//')
    SHARED_CONFIG_BOOTNODES_ENODE=$(awk '{printf "%s,", $0}' $SHARED_CONFIG_TESTNET_DIR/boot_enode.txt | sed 's/,$//')

    export SHARED_CONFIG_NETWORK_ID
    export SHARED_CONFIG_BOOTNODES
    export SHARED_CONFIG_BOOTNODES_ENODE
fi

if [ "$network" == "devnet" ]; then 
    CHAIN_ID=${CHAIN_ID:-32382}
    GENESIS_TIME_DELAY=15
    PRYSMCTL=/usr/lib/eth-node-prysm/bin/prysmctl

    create_data_dir_if_not_exists $SHARED_VALIDATOR_DATADIR
    # TODO option to reset
    if [ ! -d "$SHARED_CONFIG_TESTNET_DIR" ];then
        echo "creating genesis state"

        docker run --rm -it -v $SHARED_CONFIG_DATA_DIR:/data \
        -v $PWD/devnet/config/defaults.env:/config/values.env \
        ethpandaops/ethereum-genesis-generator:latest all

        mv $SHARED_CONFIG_DATA_DIR/custom_config_data $SHARED_CONFIG_TESTNET_DIR
        sudo chown -R "$(id -u):$(id -g)" $SHARED_CONFIG_TESTNET_DIR
         
        touch "$SHARED_CONFIG_DATA_DIR/geth_password.txt"

        if [ "$execution_client" = "geth" ];then 
            # 3. Initialize Geth genesis configuration
            geth --datadir=$SHARED_CONFIG_DATA_DIR init $SHARED_CONFIG_GENESIS_FILE 
            cp "./devnet/sk.json" "$SHARED_CONFIG_DATA_DIR"
            cp -R "./devnet/keystore" "$SHARED_CONFIG_DATA_DIR"
        fi 

    fi 
    SHARED_GENESIS_TIME=$(jq -r '.genesis_time' $SHARED_CONFIG_TESTNET_DIR/parsedBeaconState.json)
    SHARED_CONFIG_NETWORK_ID=$CHAIN_ID
    
    echo "SHARED_GENESIS_TIME: $SHARED_GENESIS_TIME"

    export SHARED_GENESIS_TIME
    export SHARED_CONFIG_NETWORK_ID
fi

if [ "$network" == "ephemery" ]; then 
    if [ "$execution_client" == "nethermind" ]; then 
        echo "nethermind does not support ephemery network"
        exit 1
    fi 

    if [ "$execution_client" == "besu" ]; then 
        echo "besu does not support ephemery network"
        exit 1
    fi 
fi 

script=""

latest_execution_client_version=${latest_clients["$execution_client"]}
latest_consensus_client_version=${latest_clients["$consensus_client"]}

SHARED_RUN="$run"

export SHARED_RUN

if [ "$run" = "execution" ]; then 
    script="$script_dir/clients/$execution_client/$latest_execution_client_version/run-$execution_client.sh"
    chmod +x "$script"
    $script --env-file "$script_dir/network/$network/$execution_client-$consensus_client/$execution_client.env"

elif [ "$run" = "consensus" ]; then 
    script="$script_dir/clients/$consensus_client/$latest_consensus_client_version/run-$consensus_client.sh"
    chmod +x "$script"
    $script --env-file "$script_dir/network/$network/$execution_client-$consensus_client/$consensus_client.env"
elif [ "$run" = "validator" ]; then 
    script="$script_dir/clients/$consensus_client/$latest_consensus_client_version/run-validator.sh"
    chmod +x "$script"
    $script --env-file "$script_dir/network/$network/$execution_client-$consensus_client/validator.env"
elif [ "$run" = "bootnode" ]; then 
    script="$script_dir/clients/$consensus_client/$latest_consensus_client_version/run-$consensus_client.sh"
    chmod +x "$script"
    $script --env-file "$script_dir/network/$network/$execution_client-$consensus_client/bootnode.env"   
else 
    echo "unsupported option"
    exit 1     
fi 
