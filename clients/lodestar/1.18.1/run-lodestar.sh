#!/usr/bin/env bash 

set -e 

display_help() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --env-file FILE, -e FILE   Path to .env formatted configuration file."    
    echo "  --help, -h                    Displays this help text and exits."
    echo "  --version, -v                 Displays the version and exits."
    exit 0
}

display_version() {
    local version=$(basename "$(dirname "$(realpath "$0")")")
    echo "$0 version $version"
    exit 0
}

CONFIG_FILE=""
HELP=false
VERSION=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --env-file|-e)
            CONFIG_FILE="$2"
            shift 2
            ;;
        --help|-h)
            HELP=true
            shift
            ;;
        --version|-v)
            VERSION=true
            shift
            ;;  
        *)
            echo "Error: Unknown option $1"
            display_help
            ;;
    esac
done

if [ "$HELP" = true ]; then
    display_help
fi

if [ "$VERSION" = true ]; then
    display_version
fi

if [ -z "$CONFIG_FILE" ]; then
    echo "Error: Configuration file is required. Use --config-file option."
    display_help
fi

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Error: Configuration file not found: $CONFIG_FILE"
    exit 1
fi

echo "Starting with configuration from $CONFIG_FILE"

OPTIONS=""

append_option() {
  local option=$1
  local value=$2
  if [ -n "$value" ]; then
    OPTIONS="$OPTIONS $option $value"
  fi
}

append_flag(){
 local option=$1
  local value=$2
  if [ "$value" = "true" ]; then
    OPTIONS="$OPTIONS $option"
  fi 
}

if [ "$SHARED_CONFIG_NETWORK" != "dev" ]; then 
    append_flag "--forceCheckpointSync" "$LODESTAR_CLI_BN_FORCE_CHECKPOINT_SYNC"
    append_flag "--rest" "$LODESTAR_CLI_BN_REST"
    append_flag "--rest.swaggerUI" "$LODESTAR_CLI_BN_REST_SWAGGER_UI"
    append_flag "--emitPayloadAttributes" "$LODESTAR_CLI_BN_EMIT_PAYLOAD_ATTRIBUTES"
    append_option "--eth1" "$LODESTAR_CLI_BN_ETH1"
    append_flag "--builder" "$LODESTAR_CLI_BN_BUILDER"
    append_flag "--metrics" "$LODESTAR_CLI_BN_METRICS"
    append_flag "--discv5" "$LODESTAR_CLI_BN_DISCV5"
    append_flag "--subscribeAllSubnets" "$LODESTAR_CLI_BN_SUBSCRIBE_ALL_SUBNETS"
    append_flag "--disablePeerScoring" "$LODESTAR_CLI_BN_DISABLE_PEER_SCORING"
    append_flag "--mdns" "$LODESTAR_CLI_BN_MDNS"
    append_flag "--private" "$LODESTAR_CLI_BN_PRIVATE"
    append_flag "--validatorMonitorLogs" "$LODESTAR_CLI_BN_VALIDATOR_MONITOR_LOGS"

    append_option "--checkpointSyncUrl" "$LODESTAR_CLI_BN_CHECKPOINT_SYNC_URL"
    append_option "--checkpointState" "$LODESTAR_CLI_BN_CHECKPOINT_STATE"
    append_option "--wssCheckpoint" "$LODESTAR_CLI_BN_WSS_CHECKPOINT"
    if [ "$LODESTAR_CLI_DEV_REST_NAMESPACE" == "*" ]; then
            OPTIONS="$OPTIONS --rest.namespace '*'"
    else  
        append_option "--rest.namespace" "$LODESTAR_CLI_DEV_REST_NAMESPACE"
    fi 
    append_option "--rest.cors" "$LODESTAR_CLI_BN_REST_CORS"
    append_option "--rest.address" "$LODESTAR_CLI_BN_REST_ADDRESS"
    append_option "--rest.port" "$LODESTAR_CLI_BN_REST_PORT"
    append_option "--suggestedFeeRecipient" "$LODESTAR_CLI_BN_SUGGESTED_FEE_RECIPIENT"
    append_option "--chain.archiveBlobEpochs" "$LODESTAR_CLI_BN_CHAIN_ARCHIVE_BLOB_EPOCHS"
    append_option "--eth1.providerUrls" "$LODESTAR_CLI_BN_ETH1_PROVIDER_URLS"
    append_option "--execution.urls" "$LODESTAR_CLI_BN_EXECUTION_URLS"
    append_option "--execution.timeout" "$LODESTAR_CLI_BN_EXECUTION_TIMEOUT"
    append_option "--execution.retries" "$LODESTAR_CLI_BN_EXECUTION_RETRIES"
    append_option "--execution.retryDelay" "$LODESTAR_CLI_BN_EXECUTION_RETRY_DELAY"
    append_option "--jwtSecret" "$LODESTAR_CLI_BN_JWT_SECRET"
    append_option "--jwtId" "$LODESTAR_CLI_BN_JWT_ID"
    append_option "--builder.url" "$LODESTAR_CLI_BN_BUILDER_URL"
    append_option "--builder.timeout" "$LODESTAR_CLI_BN_BUILDER_TIMEOUT"
    append_option "--builder.faultInspectionWindow" "$LODESTAR_CLI_BN_BUILDER_FAULT_INSPECTION_WINDOW"
    append_option "--builder.allowedFaults" "$LODESTAR_CLI_BN_BUILDER_ALLOWED_FAULTS"
    append_option "--metrics.port" "$LODESTAR_CLI_BN_METRICS_PORT"
    append_option "--metrics.address" "$LODESTAR_CLI_BN_METRICS_ADDRESS"
    append_option "--monitoring.endpoint" "$LODESTAR_CLI_BN_MONITORING_ENDPOINT"
    append_option "--monitoring.interval" "$LODESTAR_CLI_BN_MONITORING_INTERVAL"
    append_option "--listenAddress" "$LODESTAR_CLI_BN_LISTEN_ADDRESS"
    append_option "--port" "$LODESTAR_CLI_BN_PORT"
    append_option "--discoveryPort" "$LODESTAR_CLI_BN_DISCOVERY_PORT"
    append_option "--listenAddress6" "$LODESTAR_CLI_BN_LISTEN_ADDRESS6"
    append_option "--port6" "$LODESTAR_CLI_BN_PORT6"
    append_option "--discoveryPort6" "$LODESTAR_CLI_BN_DISCOVERY_PORT6"
    append_option "--bootnodes" "$LODESTAR_CLI_BN_BOOTNODES"
    append_option "--targetPeers" "$LODESTAR_CLI_BN_TARGET_PEERS"
    append_option "--enr.ip" "$LODESTAR_CLI_BN_ENR_IP"
    append_option "--enr.tcp" "$LODESTAR_CLI_BN_ENR_TCP"
    append_option "--enr.udp" "$LODESTAR_CLI_BN_ENR_UDP"
    append_option "--enr.ip6" "$LODESTAR_CLI_BN_ENR_IP6"
    append_option "--enr.tcp6" "$LODESTAR_CLI_BN_ENR_TCP6"
    append_option "--enr.udp6" "$LODESTAR_CLI_BN_ENR_UDP6"
    append_option "--dataDir" "$LODESTAR_CLI_BN_DATA_DIR"
    append_option "--network" "$LODESTAR_CLI_BN_NETWORK"
    append_option "--paramsFile" "$LODESTAR_CLI_BN_PARAMS_FILE"
    append_option "--terminal-total-difficulty-override" "$LODESTAR_CLI_BN_TERMINAL_TOTAL_DIFFICULTY_OVERRIDE"
    append_option "--terminal-block-hash-override" "$LODESTAR_CLI_BN_TERMINAL_BLOCK_HASH_OVERRIDE"
    append_option "--terminal-block-hash-epoch-override" "$LODESTAR_CLI_BN_TERMINAL_BLOCK_HASH_EPOCH_OVERRIDE"
    append_option "--rcConfig" "$LODESTAR_CLI_BN_RC_CONFIG"

    append_option "--logLevel" "$LODESTAR_CLI_BN_LOG_LEVEL"
    append_option "--logFile" "$LODESTAR_CLI_BN_LOG_FILE"
    append_option "--logFileLevel" "$LODESTAR_CLI_BN_LOG_FILE_LEVEL"
    append_option "--logFileDailyRotate" "$LODESTAR_CLI_BN_LOG_FILE_DAILY_ROTATE"
else 
    append_option "--checkpointSyncUrl" "$LODESTAR_CLI_DEV_CHECKPOINT_SYNC_URL"
    append_option "--checkpointState" "$LODESTAR_CLI_DEV_CHECKPOINT_STATE"
    append_option "--wssCheckpoint" "$LODESTAR_CLI_DEV_WSS_CHECKPOINT"
    append_flag "--forceCheckpointSync" "$LODESTAR_CLI_DEV_FORCE_CHECKPOINT_SYNC"

    append_flag "--rest" "$LODESTAR_CLI_DEV_REST"
    if [ "$LODESTAR_CLI_DEV_REST_NAMESPACE" == "*" ]; then
            OPTIONS="$OPTIONS --rest.namespace=*"
    else  
        append_option "--rest.namespace" "$LODESTAR_CLI_DEV_REST_NAMESPACE"
    fi 
    append_option "--rest.cors" "$LODESTAR_CLI_DEV_REST_CORS"
    append_option "--rest.address" "$LODESTAR_CLI_DEV_REST_ADDRESS"
    append_option "--rest.port" "$LODESTAR_CLI_DEV_REST_PORT"
    append_flag "--rest.swaggerUI" "$LODESTAR_CLI_DEV_REST_SWAGGER_UI"

    append_flag "--emitPayloadAttributes" "$LODESTAR_CLI_DEV_EMIT_PAYLOAD_ATTRIBUTES"
    append_option "--chain.archiveBlobEpochs" "$LODESTAR_CLI_DEV_CHAIN_ARCHIVE_BLOB_EPOCHS"

    append_option "--eth1" "$LODESTAR_CLI_DEV_ETH1"
    append_option "--eth1.providerUrls" "$LODESTAR_CLI_DEV_ETH1_PROVIDER_URLS"

    append_option "--execution.urls" "$LODESTAR_CLI_DEV_EXECUTION_URLS"
    append_option "--execution.timeout" "$LODESTAR_CLI_DEV_EXECUTION_TIMEOUT"
    append_option "--execution.retries" "$LODESTAR_CLI_DEV_EXECUTION_RETRIES"
    append_option "--execution.retryDelay" "$LODESTAR_CLI_DEV_EXECUTION_RETRY_DELAY"
    append_option "--jwtSecret" "$LODESTAR_CLI_DEV_JWT_SECRET"
    append_option "--jwtId" "$LODESTAR_CLI_DEV_JWT_ID"

    append_flag "--builder" "$LODESTAR_CLI_DEV_BUILDER"
    append_option "--builder.url" "$LODESTAR_CLI_DEV_BUILDER_URL"
    append_option "--builder.timeout" "$LODESTAR_CLI_DEV_BUILDER_TIMEOUT"
    append_option "--builder.faultInspectionWindow" "$LODESTAR_CLI_DEV_BUILDER_FAULT_INSPECTION_WINDOW"
    append_option "--builder.allowedFaults" "$LODESTAR_CLI_DEV_BUILDER_ALLOWED_FAULTS"
    append_option "--builder.selection" "$LODESTAR_CLI_DEV_BUILDER_SELECTION"
    append_option "--builder.boostFactor" "$LODESTAR_CLI_DEV_BUILDER_BOOST_FACTOR"

    append_flag "--metrics" "$LODESTAR_CLI_DEV_METRICS"
    append_option "--metrics.port" "$LODESTAR_CLI_DEV_METRICS_PORT"
    append_option "--metrics.address" "$LODESTAR_CLI_DEV_METRICS_ADDRESS"

    append_option "--monitoring.endpoint" "$LODESTAR_CLI_DEV_MONITORING_ENDPOINT"
    append_option "--monitoring.interval" "$LODESTAR_CLI_DEV_MONITORING_INTERVAL"

    append_flag "--discv5" "$LODESTAR_CLI_DEV_DISCV5"
    append_option "--listenAddress" "$LODESTAR_CLI_DEV_LISTEN_ADDRESS"
    append_option "--port" "$LODESTAR_CLI_DEV_PORT"
    append_option "--discoveryPort" "$LODESTAR_CLI_DEV_DISCOVERY_PORT"
    append_option "--listenAddress6" "$LODESTAR_CLI_DEV_LISTEN_ADDRESS6"
    append_option "--port6" "$LODESTAR_CLI_DEV_PORT6"
    append_option "--discoveryPort6" "$LODESTAR_CLI_DEV_DISCOVERY_PORT6"
    append_option "--bootnodes" "$LODESTAR_CLI_DEV_BOOTNODES"
    append_option "--targetPeers" "$LODESTAR_CLI_DEV_TARGET_PEERS"
    append_flag "--subscribeAllSubnets" "$LODESTAR_CLI_DEV_SUBSCRIBE_ALL_SUBNETS"
    append_flag "--disablePeerScoring" "$LODESTAR_CLI_DEV_DISABLE_PEER_SCORING"
    append_flag "--mdns" "$LODESTAR_CLI_DEV_MDNS"

    append_option "--enr.ip" "$LODESTAR_CLI_DEV_ENR_IP"
    append_option "--enr.tcp" "$LODESTAR_CLI_DEV_ENR_TCP"
    append_option "--enr.udp" "$LODESTAR_CLI_DEV_ENR_UDP"
    append_option "--enr.ip6" "$LODESTAR_CLI_DEV_ENR_IP6"
    append_option "--enr.tcp6" "$LODESTAR_CLI_DEV_ENR_TCP6"
    append_option "--enr.udp6" "$LODESTAR_CLI_DEV_ENR_UDP6"
    append_flag "--nat" "$LODESTAR_CLI_DEV_NAT"

    append_flag "--keymanager" "$LODESTAR_CLI_DEV_KEYMANAGER"
    append_flag "--keymanager.authEnabled" "$LODESTAR_CLI_DEV_KEYMANAGER_AUTH_ENABLED"
    append_option "--keymanager.tokenFile" "$LODESTAR_CLI_DEV_KEYMANAGER_TOKEN_FILE"
    append_option "--keymanager.port" "$LODESTAR_CLI_DEV_KEYMANAGER_PORT"
    append_option "--keymanager.address" "$LODESTAR_CLI_DEV_KEYMANAGER_ADDRESS"
    append_option "--keymanager.cors" "$LODESTAR_CLI_DEV_KEYMANAGER_CORS"

    append_option "--externalSigner.url" "$LODESTAR_CLI_DEV_EXTERNAL_SIGNER_URL"
    append_option "--externalSigner.pubkeys" "$LODESTAR_CLI_DEV_EXTERNAL_SIGNER_PUBKEYS"
    append_flag "--externalSigner.fetch" "$LODESTAR_CLI_DEV_EXTERNAL_SIGNER_FETCH"
    append_option "--externalSigner.fetchInterval" "$LODESTAR_CLI_DEV_EXTERNAL_SIGNER_FETCH_INTERVAL"

    append_option "--genesisEth1Hash" "$LODESTAR_CLI_DEV_GENESIS_ETH1_HASH"
    append_option "--genesisValidators" "$LODESTAR_CLI_DEV_GENESIS_VALIDATORS"
    append_option "--startValidators" "$LODESTAR_CLI_DEV_START_VALIDATORS"
    append_option "--genesisTime" "$LODESTAR_CLI_DEV_GENESIS_TIME"
    append_flag "--reset" "$LODESTAR_CLI_DEV_RESET"
    append_option "--dumpTestnetFiles" "$LODESTAR_CLI_DEV_DUMP_TESTNET_FILES"

    append_option "--dataDir" "$LODESTAR_CLI_DEV_DATA_DIR"
    append_option "--network" "$LODESTAR_CLI_DEV_NETWORK"
    append_option "--paramsFile" "$LODESTAR_CLI_DEV_PARAMS_FILE"
    append_option "--terminal-total-difficulty-override" "$LODESTAR_CLI_DEV_TERMINAL_TOTAL_DIFFICULTY_OVERRIDE"
    append_option "--terminal-block-hash-override" "$LODESTAR_CLI_DEV_TERMINAL_BLOCK_HASH_OVERRIDE"
    append_option "--terminal-block-hash-epoch-override" "$LODESTAR_CLI_DEV_TERMINAL_BLOCK_HASH_EPOCH_OVERRIDE"
    append_option "--rcConfig" "$LODESTAR_CLI_DEV_RC_CONFIG"
    append_flag "--private" "$LODESTAR_CLI_DEV_PRIVATE"
    append_flag "--validatorMonitorLogs" "$LODESTAR_CLI_DEV_VALIDATOR_MONITOR_LOGS"
    append_option "--logLevel" "$LODESTAR_CLI_DEV_LOG_LEVEL"
    append_option "--logFile" "$LODESTAR_CLI_DEV_LOG_FILE"
    append_option "--logFileLevel" "$LODESTAR_CLI_DEV_LOG_FILE_LEVEL"
    append_option "--logFileDailyRotate" "$LODESTAR_CLI_DEV_LOG_FILE_DAILY_ROTATE"
    append_option "--suggestedFeeRecipient" "$LODESTAR_CLI_DEV_SUGGESTED_FEE_RECIPIENT"
    append_option "--beaconNodes" "$LODESTAR_CLI_DEV_BEACON_NODES"
    append_flag "--force" "$LODESTAR_CLI_DEV_FORCE"
    append_option "--graffiti" "$LODESTAR_CLI_DEV_GRAFFITI"
    append_option "--proposerSettingsFile" "$LODESTAR_CLI_DEV_PROPOSER_SETTINGS_FILE"
    append_flag "--strictFeeRecipientCheck" "$LODESTAR_CLI_DEV_STRICT_FEE_RECIPIENT_CHECK"
    append_option "--defaultGasLimit" "$LODESTAR_CLI_DEV_DEFAULT_GAS_LIMIT"
    append_flag "--useProduceBlockV3" "$LODESTAR_CLI_DEV_USE_PRODUCE_BLOCK_V3"
    append_option "--broadcastValidation" "$LODESTAR_CLI_DEV_BROADCAST_VALIDATION"
    append_flag "--blindedLocal" "$LODESTAR_CLI_DEV_BLINDED_LOCAL"
    append_option "--importKeystores" "$LODESTAR_CLI_DEV_IMPORT_KEYSTORES"
    append_option "--importKeystoresPassword" "$LODESTAR_CLI_DEV_IMPORT_KEYSTORES_PASSWORD"
    append_flag "--doppelgangerProtection" "$LODESTAR_CLI_DEV_DOPPELGANGER_PROTECTION"
    append_flag "--distributed" "$LODESTAR_CLI_DEV_DISTRIBUTED"

    append_option "--params.ALTAIR_FORK_EPOCH" "$LODESTAR_CLI_DEV_PARAMS_ALTAIR_FORK_EPOCH"
    append_option "--params.BELLATRIX_FORK_EPOCH" "$LODESTAR_CLI_DEV_PARAMS_BELLATRIX_FORK_EPOCH"
    append_option "--network.rateLimitMultiplier" "$LODESTAR_CLI_NETWORK_RATE_LIMIT_MULTIPLIER"

fi 

if [ "$SHARED_CONFIG_NETWORK" != "dev" ]; then 
    echo "Starting lodestar beacon $OPTIONS"
    lodestar beacon $OPTIONS
else
    echo "docker run chainsafe/lodestar dev $OPTIONS"
    # TODO regression with eth-node-lodestar
    docker run -p 9596:9596 chainsafe/lodestar dev $OPTIONS
fi 