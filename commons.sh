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
    echo "Usage: $0 [--secrets-file value] \
                    [--data-dir value] \
                    [--network value] \
                    [--endpoint-url value] \
                    [--checkpoint-sync-url value] \
                    [--run-validator value] \
                    [--bootnodes value] \
                    [--genesis-file value]"
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
    networkid=""
    bootnodes=""
    genesis_file=""

    OPTS=$(getopt -o '' -l "secrets-file:\
                            ,data-dir:\
                            ,network:\
                            ,endpoint-url:\
                            ,checkpoint-sync-url:\
                            ,run-validator:\
                            ,networkid:\
                            ,bootnodes:\
                            ,genesis-file:" -n "$0" -- "$@")
    if [ $? != 0 ]; then
        echo "no argument were provided"
        usage
    fi

    echo "options: $@"

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
                network="$2"
                shift 2
                ;;
            --endpoint-url)
                endpoint_url="$2"
                shift 2
                ;;
            --checkpoint-sync-url)
                if [[ $2 == --* ]]; then
                    echo "$2"
                    shift
                    break
                else 
                    checkpoint_sync_url="$2"
                    shift 2
                fi
                ;;  
            --run-validator)
                run_validator="$2"
                shift 2
                ;;   
            --networkid)
                networkid="$2"
                shift 2
                ;;      
            --bootnodes)
                bootnodes="$2"
                shift 2
                ;;    
            --genesis-file)
                genesis_file="$2"
                shift 2
                ;;                  
            --)
                shift
                break
                ;;
            *)
                echo "unrecognized option: $1"
                usage
                ;;
        esac
    done

    echo "Secrets file: $secrets_file"
    echo "Data directory: $data_dir"
    echo "Network: $network"
    echo "Endpoint URL: $endpoint_url"
    echo "Checkpoint sync URL: $checkpoint_sync_url"
    echo "Run validator: $run_validator"
    echo "networkid: $networkid"
    echo "bootnodes: $bootnodes"
    echo "genesis file: $genesis_file"

    if [ -z "$secrets_file" ]; then
        echo "please provide a value for secrets-file"
        usage
    fi

    if [ -z "$data_dir" ]; then
        echo "please provide a value for data-dir"
        usage
    fi

    if [ -z "$network" ]; then
        echo "please provide a value for network"
        usage
    fi

    if [ -z "$endpoint_url" ]; then
        echo "please provide a value for endpoint-url"
        usage
    fi

    # if [ -z "$checkpoint_sync_url" ]; then
    #     echo "please provide a value for checkpoint-sync-url"
    #     usage
    # fi

    if [ -z "$run_validator" ]; then
        echo "please provide a value for run-validator"
        usage
    fi

    if [[ "$run_validator" == true && "$run_validator" != false ]]; then
        echo "run-validator value must be true or false"
        echo "provided value is: $run_validator"
        usage
    fi


 

}
