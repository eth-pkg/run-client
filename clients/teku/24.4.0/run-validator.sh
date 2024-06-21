set -e 

display_help() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --env-file FILE, -e FILE   Path to .conf formatted configuration file."    
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
    OPTIONS="$OPTIONS $option=$value"
  fi
}

append_flag(){
 local option=$1
  local value=$2
  if [ "$value" = "true" ]; then
    OPTIONS="$OPTIONS $option"
  fi 
}

append_option "--beacon-node-api-endpoints" $TEKU_CLI_VALIDATOR_BEACON_NODE_API_ENDPOINTS
append_option "--beacon-node-ssz-blocks-enabled" $TEKU_CLI_VALIDATOR_BEACON_NODE_SSZ_BLOCKS_ENABLED
append_option "--config-file" $TEKU_CLI_VALIDATOR_CONFIG_FILE
append_option "--data-base-path" $TEKU_CLI_VALIDATOR_DATA_BASE_PATH
append_option "--data-validator-path" $TEKU_CLI_VALIDATOR_DATA_VALIDATOR_PATH
append_option "--doppelganger-detection-enabled" $TEKU_CLI_VALIDATOR_DOPPELGANGER_DETECTION_ENABLED
append_option "--exit-when-no-validator-keys-enabled" $TEKU_CLI_VALIDATOR_EXIT_WHEN_NO_VALIDATOR_KEYS_ENABLED
append_flag "--help" $TEKU_CLI_VALIDATOR_HELP
append_option "--logging" $TEKU_CLI_VALIDATOR_LOGGING
append_option "--log-color-enabled" $TEKU_CLI_VALIDATOR_LOG_COLOR_ENABLED
append_option "--log-destination" $TEKU_CLI_VALIDATOR_LOG_DESTINATION
append_option "--log-file" $TEKU_CLI_VALIDATOR_LOG_FILE
append_option "--log-file-name-pattern" $TEKU_CLI_VALIDATOR_LOG_FILE_NAME_PATTERN
append_option "--log-include-events-enabled" $TEKU_CLI_VALIDATOR_LOG_INCLUDE_EVENTS_ENABLED
append_option "--log-include-validator-duties-enabled" $TEKU_CLI_VALIDATOR_LOG_INCLUDE_VALIDATOR_DUTIES_ENABLED
append_option "--metrics-block-timing-tracking-enabled" $TEKU_CLI_VALIDATOR_METRICS_BLOCK_TIMING_TRACKING_ENABLED
append_option "--metrics-categories" $TEKU_CLI_VALIDATOR_METRICS_CATEGORIES
append_option "--metrics-enabled" $TEKU_CLI_VALIDATOR_METRICS_ENABLED
append_option "--metrics-host-allowlist" $TEKU_CLI_VALIDATOR_METRICS_HOST_ALLOWLIST
append_option "--metrics-interface" $TEKU_CLI_VALIDATOR_METRICS_INTERFACE
append_option "--metrics-port" $TEKU_CLI_VALIDATOR_METRICS_PORT
append_option "--metrics-publish-endpoint" $TEKU_CLI_VALIDATOR_METRICS_PUBLISH_ENDPOINT
append_option "--metrics-publish-interval" $TEKU_CLI_VALIDATOR_METRICS_PUBLISH_INTERVAL
append_option "--network" $TEKU_CLI_VALIDATOR_NETWORK
append_option "--shut-down-when-validator-slashed-enabled" $TEKU_CLI_VALIDATOR_SHUT_DOWN_WHEN_VALIDATOR_SLASHED_ENABLED
append_flag "--version" $TEKU_CLI_VALIDATOR_VERSION
append_option "--validator-api-bearer-file" $TEKU_CLI_VALIDATOR_VALIDATOR_API_BEARER_FILE
append_option "--validator-api-cors-origins" $TEKU_CLI_VALIDATOR_VALIDATOR_API_CORS_ORIGINS
append_option "--validator-api-docs-enabled" $TEKU_CLI_VALIDATOR_VALIDATOR_API_DOCS_ENABLED
append_option "--validator-api-enabled" $TEKU_CLI_VALIDATOR_VALIDATOR_API_ENABLED
append_option "--validator-api-host-allowlist" $TEKU_CLI_VALIDATOR_VALIDATOR_API_HOST_ALLOWLIST
append_option "--validator-api-interface" $TEKU_CLI_VALIDATOR_VALIDATOR_API_INTERFACE
append_option "--validator-api-keystore-file" $TEKU_CLI_VALIDATOR_VALIDATOR_API_KEYSTORE_FILE
append_option "--validator-api-keystore-password-file" $TEKU_CLI_VALIDATOR_VALIDATOR_API_KEYSTORE_PASSWORD_FILE
append_option "--validator-api-port" $TEKU_CLI_VALIDATOR_VALIDATOR_API_PORT
append_option "--validator-is-local-slashing-protection-synchronized-enabled" $TEKU_CLI_VALIDATOR_VALIDATOR_IS_LOCAL_SLASHING_PROTECTION_SYNCHRONIZED_ENABLED
append_option "--validator-keys" $TEKU_CLI_VALIDATOR_VALIDATOR_KEYS
append_option "--validators-builder-registration-default-enabled" $TEKU_CLI_VALIDATOR_VALIDATORS_BUILDER_REGISTRATION_DEFAULT_ENABLED
append_option "--validators-early-attestations-enabled" $TEKU_CLI_VALIDATOR_VALIDATORS_EARLY_ATTESTATIONS_ENABLED
append_option "--validators-external-signer-keystore" $TEKU_CLI_VALIDATOR_VALIDATORS_EXTERNAL_SIGNER_KEYSTORE
append_option "--validators-external-signer-keystore-password-file" $TEKU_CLI_VALIDATOR_VALIDATORS_EXTERNAL_SIGNER_KEYSTORE_PASSWORD_FILE
append_option "--validators-external-signer-public-keys" $TEKU_CLI_VALIDATOR_VALIDATORS_EXTERNAL_SIGNER_PUBLIC_KEYS
append_option "--validators-external-signer-slashing-protection-enabled" $TEKU_CLI_VALIDATOR_VALIDATORS_EXTERNAL_SIGNER_SLASHING_PROTECTION_ENABLED
append_option "--validators-external-signer-timeout" $TEKU_CLI_VALIDATOR_VALIDATORS_EXTERNAL_SIGNER_TIMEOUT
append_option "--validators-external-signer-truststore" $TEKU_CLI_VALIDATOR_VALIDATORS_EXTERNAL_SIGNER_TRUSTSTORE
append_option "--validators-external-signer-truststore-password-file" $TEKU_CLI_VALIDATOR_VALIDATORS_EXTERNAL_SIGNER_TRUSTSTORE_PASSWORD_FILE
append_option "--validators-external-signer-url" $TEKU_CLI_VALIDATOR_VALIDATORS_EXTERNAL_SIGNER_URL
append_option "--validators-graffiti" $TEKU_CLI_VALIDATOR_VALIDATORS_GRAFFITI
append_option "--validators-graffiti-client-append-format" $TEKU_CLI_VALIDATOR_VALIDATORS_GRAFFITI_CLIENT_APPEND_FORMAT
append_option "--validators-graffiti-file" $TEKU_CLI_VALIDATOR_VALIDATORS_GRAFFITI_FILE
append_option "--validators-keystore-locking-enabled" $TEKU_CLI_VALIDATOR_VALIDATORS_KEYSTORE_LOCKING_ENABLED
append_option "--validators-performance-tracking-mode" $TEKU_CLI_VALIDATOR_VALIDATORS_PERFORMANCE_TRACKING_MODE
append_option "--validators-proposer-blinded-blocks-enabled" $TEKU_CLI_VALIDATOR_VALIDATORS_PROPOSER_BLINDED_BLOCKS_ENABLED
append_option "--validators-proposer-config" $TEKU_CLI_VALIDATOR_VALIDATORS_PROPOSER_CONFIG
append_option "--validators-proposer-config-refresh-enabled" $TEKU_CLI_VALIDATOR_VALIDATORS_PROPOSER_CONFIG_REFRESH_ENABLED
append_option "--validators-proposer-default-fee-recipient" $TEKU_CLI_VALIDATOR_VALIDATORS_PROPOSER_DEFAULT_FEE_RECIPIENT


echo "Using Options: $OPTIONS"

teku validator-client $OPTIONS