# Function to handle errors
error_handler() {
    echo "Error occurred in script at line: $1"
    echo "Command executed: $2"
    exit 1
}

# Trap errors and call the error_handler function
trap 'error_handler ${LINENO} "${BASH_COMMAND}"' ERR

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

node_is_running(){
    curl -X POST --data '{"jsonrpc":"2.0","method":"eth_chainId","params":[],"id":1}' localhost:8545
}

# Function to display usage information
usage() {
    echo "Usage: $0 [--secrets-file value] [--data-dir value] [--network value] [--endpoint-url value] [--checkpoint-sync-url value] [--run-validator value]"
    exit 1
}

# Function to parse command-line options
parse_options() {
    # Initialize variables
    data_dir=""
    secrets_file=""
    network=""
    endpoint_url=""
    checkpoint_sync_url=""
    run_validator=false

    OPTS=$(getopt -o '' -l "secrets-file:,data-dir:,network:,endpoint-url:,checkpoint-sync-url:,run-validator" -n "$0" -- "$@")
    if [ $? != 0 ]; then
        usage
    fi

    eval set -- "$OPTS"

    while true; do
        case "$1" in
            --secrets-file)
                secrets_file="$2"
                shift 2
                ;;
            --data-dir)
                data_dir="$2"
                shift 2
                ;;
            --network)
                network="$3"
                shift 2
                ;;
            --endpoint-url)
                endpoint_url="$4"
                shift 2
                ;;
            --checkpoint-sync-url)
                checkpoint_sync_url="$5"
                shift 2
                ;;  
            --run-validator)
                run_validator="$6"
                shift 2
                ;;      
            --)
                shift
                break
                ;;
            *)
                usage
                ;;
        esac
    done

    # Validate required options, everything is required, defaults are given
    if [ -z "$secrets_file" ] || [ -z "$data_dir" ] || [ -z "$network" ] || [ -z "$endpoint_url" ] || [ -z "$checkpoint_sync_url" ] || [ -z "$run_validator" ]; then
        usage
    fi

    if [[ "$value" == "true" || "$value" == "false" ]]; then
        # do nothing
    else
        usage
    fi

    echo "Secrets file: $secrets_file"
    echo "Data directory: $data_dir"
    echo "Network: $network"
    echo "Endpoint URL: $endpoint_url"
    echo "Checkpoint sync URL: $checkpoint_sync_url"
    echo "Run validator: $run_validator"

}