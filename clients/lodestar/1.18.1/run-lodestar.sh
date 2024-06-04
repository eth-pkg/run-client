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

# Append options for weak subjectivity
append_option "--checkpointSyncUrl" "$LODESTAR_CLI_BN_CHECKPOINT_SYNC_URL"
append_option "--checkpointState" "$LODESTAR_CLI_BN_CHECKPOINT_STATE"
append_option "--wssCheckpoint" "$LODESTAR_CLI_BN_WSS_CHECKPOINT"
[ "$LODESTAR_CLI_BN_FORCE_CHECKPOINT_SYNC" = "true" ] && append_option "--forceCheckpointSync" ""

# Append options for API
[ "$LODESTAR_CLI_BN_REST" = "true" ] && append_option "--rest" ""
append_option "--rest.namespace" "$LODESTAR_CLI_BN_REST_NAMESPACE"
append_option "--rest.cors" "$LODESTAR_CLI_BN_REST_CORS"
append_option "--rest.address" "$LODESTAR_CLI_BN_REST_ADDRESS"
append_option "--rest.port" "$LODESTAR_CLI_BN_REST_PORT"
[ "$LODESTAR_CLI_BN_REST_SWAGGER_UI" = "true" ] && append_option "--rest.swaggerUI" ""

# Append options for chain
append_option "--suggestedFeeRecipient" "$LODESTAR_CLI_BN_SUGGESTED_FEE_RECIPIENT"
[ "$LODESTAR_CLI_BN_EMIT_PAYLOAD_ATTRIBUTES" = "true" ] && append_option "--emitPayloadAttributes" ""
append_option "--chain.archiveBlobEpochs" "$LODESTAR_CLI_BN_CHAIN_ARCHIVE_BLOB_EPOCHS"

# Append options for Eth1
[ "$LODESTAR_CLI_BN_ETH1" = "true" ] && append_option "--eth1" ""
append_option "--eth1.providerUrls" "$LODESTAR_CLI_BN_ETH1_PROVIDER_URLS"

# Append options for execution
append_option "--execution.urls" "$LODESTAR_CLI_BN_EXECUTION_URLS"
append_option "--execution.timeout" "$LODESTAR_CLI_BN_EXECUTION_TIMEOUT"
append_option "--execution.retries" "$LODESTAR_CLI_BN_EXECUTION_RETRIES"
append_option "--execution.retryDelay" "$LODESTAR_CLI_BN_EXECUTION_RETRY_DELAY"
append_option "--jwtSecret" "$LODESTAR_CLI_BN_JWT_SECRET"
append_option "--jwtId" "$LODESTAR_CLI_BN_JWT_ID"

# Append options for builder
[ "$LODESTAR_CLI_BN_BUILDER" = "true" ] && append_option "--builder" ""
append_option "--builder.url" "$LODESTAR_CLI_BN_BUILDER_URL"
append_option "--builder.timeout" "$LODESTAR_CLI_BN_BUILDER_TIMEOUT"
append_option "--builder.faultInspectionWindow" "$LODESTAR_CLI_BN_BUILDER_FAULT_INSPECTION_WINDOW"
append_option "--builder.allowedFaults" "$LODESTAR_CLI_BN_BUILDER_ALLOWED_FAULTS"

# Append options for metrics
[ "$LODESTAR_CLI_BN_METRICS" = "true" ] && append_option "--metrics" ""
append_option "--metrics.port" "$LODESTAR_CLI_BN_METRICS_PORT"
append_option "--metrics.address" "$LODESTAR_CLI_BN_METRICS_ADDRESS"

# Append options for monitoring
append_option "--monitoring.endpoint" "$LODESTAR_CLI_BN_MONITORING_ENDPOINT"
append_option "--monitoring.interval" "$LODESTAR_CLI_BN_MONITORING_INTERVAL"

# Append options for network
[ "$LODESTAR_CLI_BN_DISCV5" = "true" ] && append_option "--discv5" ""
append_option "--listenAddress" "$LODESTAR_CLI_BN_LISTEN_ADDRESS"
append_option "--port" "$LODESTAR_CLI_BN_PORT"
append_option "--discoveryPort" "$LODESTAR_CLI_BN_DISCOVERY_PORT"
append_option "--listenAddress6" "$LODESTAR_CLI_BN_LISTEN_ADDRESS6"
append_option "--port6" "$LODESTAR_CLI_BN_PORT6"
append_option "--discoveryPort6" "$LODESTAR_CLI_BN_DISCOVERY_PORT6"
append_option "--bootnodes" "$LODESTAR_CLI_BN_BOOTNODES"
append_option "--targetPeers" "$LODESTAR_CLI_BN_TARGET_PEERS"
[ "$LODESTAR_CLI_BN_SUBSCRIBE_ALL_SUBNETS" = "true" ] && append_option "--subscribeAllSubnets" ""
[ "$LODESTAR_CLI_BN_DISABLE_PEER_SCORING" = "true" ] && append_option "--disablePeerScoring" ""
[ "$LODESTAR_CLI_BN_MDNS" = "true" ] && append_option "--mdns" ""

# Append options for ENR
append_option "--enr.ip" "$LODESTAR_CLI_BN_ENR_IP"
append_option "--enr.tcp" "$LODESTAR_CLI_BN_ENR_TCP"
append_option "--enr.udp" "$LODESTAR_CLI_BN_ENR_UDP"
append_option "--enr.ip6" "$LODESTAR_CLI_BN_ENR_IP6"
append_option "--enr.tcp6" "$LODESTAR_CLI_BN_ENR_TCP6"
append_option "--enr.udp6" "$LODESTAR_CLI_BN_ENR_UDP6"

# Append miscellaneous options
append_option "--dataDir" "$LODESTAR_CLI_BN_DATA_DIR"
append_option "--network" "$LODESTAR_CLI_BN_NETWORK"
append_option "--paramsFile" "$LODESTAR_CLI_BN_PARAMS_FILE"
append_option "--terminal-total-difficulty-override" "$LODESTAR_CLI_BN_TERMINAL_TOTAL_DIFFICULTY_OVERRIDE"
append_option "--terminal-block-hash-override" "$LODESTAR_CLI_BN_TERMINAL_BLOCK_HASH_OVERRIDE"
append_option "--terminal-block-hash-epoch-override" "$LODESTAR_CLI_BN_TERMINAL_BLOCK_HASH_EPOCH_OVERRIDE"
append_option "--rcConfig" "$LODESTAR_CLI_BN_RC_CONFIG"
[ "$LODESTAR_CLI_BN_PRIVATE" = "true" ] && append_option "--private" ""
[ "$LODESTAR_CLI_BN_VALIDATOR_MONITOR_LOGS" = "true" ] && append_option "--validatorMonitorLogs" ""
append_option "--logLevel" "$LODESTAR_CLI_BN_LOG_LEVEL"
append_option "--logFile" "$LODESTAR_CLI_BN_LOG_FILE"
append_option "--logFileLevel" "$LODESTAR_CLI_BN_LOG_FILE_LEVEL"
append_option "--logFileDailyRotate" "$LODESTAR_CLI_BN_LOG_FILE_DAILY_ROTATE"

echo "Using Options: $OPTIONS"

lodestar beacon $OPTIONS
