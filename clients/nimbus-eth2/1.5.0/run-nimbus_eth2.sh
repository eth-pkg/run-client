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
        --config-file|-c)
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

append_option "--config-file" "$NIMBUS_ETH2_CONFIG_FILE"
append_option "--log-level" "$NIMBUS_ETH2_LOG_LEVEL"
append_option "--log-file" "$NIMBUS_ETH2_LOG_FILE"
append_option "--network" "$NIMBUS_ETH2_NETWORK"
append_option "--data-dir" "$NIMBUS_ETH2_DATA_DIR"
append_option "--validators-dir" "$NIMBUS_ETH2_VALIDATORS_DIR"
append_option "--verifying-web3-signer-url" "$NIMBUS_ETH2_VERIFYING_WEB3_SIGNER_URL"
append_option "--proven-block-property" "$NIMBUS_ETH2_PROVEN_BLOCK_PROPERTY"
append_option "--web3-signer-url" "$NIMBUS_ETH2_WEB3_SIGNER_URL"
append_option "--web3-signer-update-interval" "$NIMBUS_ETH2_WEB3_SIGNER_UPDATE_INTERVAL"
append_option "--secrets-dir" "$NIMBUS_ETH2_SECRETS_DIR"
append_option "--wallets-dir" "$NIMBUS_ETH2_WALLETS_DIR"
append_option "--web3-url" "$NIMBUS_ETH2_WEB3_URL"
append_option "--el" "$NIMBUS_ETH2_EL"
append_option "--no-el" "$NIMBUS_ETH2_NO_EL"
append_option "--non-interactive" "$NIMBUS_ETH2_NON_INTERACTIVE"
append_option "--netkey-file" "$NIMBUS_ETH2_NETKEY_FILE"
append_option "--insecure-netkey-password" "$NIMBUS_ETH2_INSECURE_NETKEY_PASSWORD"
append_option "--agent-string" "$NIMBUS_ETH2_AGENT_STRING"
append_option "--subscribe-all-subnets" "$NIMBUS_ETH2_SUBSCRIBE_ALL_SUBNETS"
append_option "--num-threads" "$NIMBUS_ETH2_NUM_THREADS"
append_option "--jwt-secret" "$NIMBUS_ETH2_JWT_SECRET"
append_option "--bootstrap-node" "$NIMBUS_ETH2_BOOTSTRAP_NODE"
append_option "--bootstrap-file" "$NIMBUS_ETH2_BOOTSTRAP_FILE"
append_option "--listen-address" "$NIMBUS_ETH2_LISTEN_ADDRESS"
append_option "--tcp-port" "$NIMBUS_ETH2_TCP_PORT"
append_option "--udp-port" "$NIMBUS_ETH2_UDP_PORT"
append_option "--max-peers" "$NIMBUS_ETH2_MAX_PEERS"
append_option "--hard-max-peers" "$NIMBUS_ETH2_HARD_MAX_PEERS"
append_option "--nat" "$NIMBUS_ETH2_NAT"
append_option "--enr-auto-update" "$NIMBUS_ETH2_ENR_AUTO_UPDATE"
append_option "--weak-subjectivity-checkpoint" "$NIMBUS_ETH2_WEAK_SUBJECTIVITY_CHECKPOINT"
append_option "--external-beacon-api-url" "$NIMBUS_ETH2_EXTERNAL_BEACON_API_URL"
append_option "--sync-light-client" "$NIMBUS_ETH2_SYNC_LIGHT_CLIENT"
append_option "--trusted-block-root" "$NIMBUS_ETH2_TRUSTED_BLOCK_ROOT"
append_option "--trusted-state-root" "$NIMBUS_ETH2_TRUSTED_STATE_ROOT"
append_option "--finalized-checkpoint-state" "$NIMBUS_ETH2_FINALIZED_CHECKPOINT_STATE"
append_option "--genesis-state" "$NIMBUS_ETH2_GENESIS_STATE"
append_option "--genesis-state-url" "$NIMBUS_ETH2_GENESIS_STATE_URL"
append_option "--finalized-deposit-tree-snapshot" "$NIMBUS_ETH2_FINALIZED_DEPOSIT_TREE_SNAPSHOT"
append_option "--node-name" "$NIMBUS_ETH2_NODE_NAME"
append_option "--graffiti" "$NIMBUS_ETH2_GRAFFITI"
append_option "--metrics" "$NIMBUS_ETH2_METRICS"
append_option "--metrics-address" "$NIMBUS_ETH2_METRICS_ADDRESS"
append_option "--metrics-port" "$NIMBUS_ETH2_METRICS_PORT"
append_option "--status-bar" "$NIMBUS_ETH2_STATUS_BAR"
append_option "--status-bar-contents" "$NIMBUS_ETH2_STATUS_BAR_CONTENTS"
append_option "--rest" "$NIMBUS_ETH2_REST"
append_option "--rest-port" "$NIMBUS_ETH2_REST_PORT"
append_option "--rest-address" "$NIMBUS_ETH2_REST_ADDRESS"
append_option "--rest-allow-origin" "$NIMBUS_ETH2_REST_ALLOW_ORIGIN"
append_option "--rest-statecache-size" "$NIMBUS_ETH2_REST_STATECACHE_SIZE"
append_option "--rest-statecache-ttl" "$NIMBUS_ETH2_REST_STATECACHE_TTL"
append_option "--rest-request-timeout" "$NIMBUS_ETH2_REST_REQUEST_TIMEOUT"
append_option "--rest-max-body-size" "$NIMBUS_ETH2_REST_MAX_BODY_SIZE"
append_option "--rest-max-headers-size" "$NIMBUS_ETH2_REST_MAX_HEADERS_SIZE"
append_option "--keymanager" "$NIMBUS_ETH2_KEYMANAGER"
append_option "--keymanager-port" "$NIMBUS_ETH2_KEYMANAGER_PORT"
append_option "--keymanager-address" "$NIMBUS_ETH2_KEYMANAGER_ADDRESS"
append_option "--keymanager-allow-origin" "$NIMBUS_ETH2_KEYMANAGER_ALLOW_ORIGIN"
append_option "--keymanager-token-file" "$NIMBUS_ETH2_KEYMANAGER_TOKEN_FILE"
append_option "--light-client-data-serve" "$NIMBUS_ETH2_LIGHT_CLIENT_DATA_SERVE"
append_option "--light-client-data-import-mode" "$NIMBUS_ETH2_LIGHT_CLIENT_DATA_IMPORT_MODE"
append_option "--light-client-data-max-periods" "$NIMBUS_ETH2_LIGHT_CLIENT_DATA_MAX_PERIODS"
append_option "--in-process-validators" "$NIMBUS_ETH2_IN_PROCESS_VALIDATORS"
append_option "--discv5" "$NIMBUS_ETH2_DISCV5"
append_option "--dump" "$NIMBUS_ETH2_DUMP"
append_option "--direct-peer" "$NIMBUS_ETH2_DIRECT_PEER"
append_option "--doppelganger-detection" "$NIMBUS_ETH2_DOPPELGANGER_DETECTION"
append_option "--validator-monitor-auto" "$NIMBUS_ETH2_VALIDATOR_MONITOR_AUTO"
append_option "--validator-monitor-pubkey" "$NIMBUS_ETH2_VALIDATOR_MONITOR_PUBKEY"
append_option "--validator-monitor-details" "$NIMBUS_ETH2_VALIDATOR_MONITOR_DETAILS"
append_option "--suggested-fee-recipient" "$NIMBUS_ETH2_SUGGESTED_FEE_RECIPIENT"
append_option "--suggested-gas-limit" "$NIMBUS_ETH2_SUGGESTED_GAS_LIMIT"
append_option "--payload-builder" "$NIMBUS_ETH2_PAYLOAD_BUILDER"
append_option "--payload-builder-url" "$NIMBUS_ETH2_PAYLOAD_BUILDER_URL"
append_option "--local-block-value-boost" "$NIMBUS_ETH2_LOCAL_BLOCK_VALUE_BOOST"
append_option "--history" "$NIMBUS_ETH2_HISTORY"

nimbus_beacon_node $OPTIONS