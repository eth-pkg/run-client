#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

besu \
  --auto-log-bloom-caching-enabled="$AUTO_LOG_BLOOM_CACHING_ENABLED" \
  --bonsai-historical-block-limit="$BONSAI_HISTORICAL_BLOCK_LIMIT" \
  --cache-last-blocks="$CACHE_LAST_BLOCKS" \
  --color-enabled="$COLOR_ENABLED" \
  --compatibility-eth64-forkid-enabled="$COMPATIBILITY_ETH64_FORKID_ENABLED" \
  --data-path="$DATA_PATH" \
  --data-storage-format="$DATA_STORAGE_FORMAT" \
  --ethstats="$ETHSTATS" \
  --ethstats-cacert-file="$ETHSTATS_CACERT_FILE" \
  --ethstats-contact="$ETHSTATS_CONTACT" \
  --genesis-file="$GENESIS_FILE" \
  --genesis-state-hash-cache-enabled="$GENESIS_STATE_HASH_CACHE_ENABLED" \
  --host-allowlist="$HOST_ALLOWLIST" \
  --identity="$IDENTITY" \
  --key-value-storage="$KEY_VALUE_STORAGE" \
  --kzg-trusted-setup="$KZG_TRUSTED_SETUP" \
  --logging="$LOGGING" \
  --nat-method="$NAT_METHOD" \
  --network="$NETWORK" \
  --network-id="$NETWORK_ID" \
  --node-private-key-file="$NODE_PRIVATE_KEY_FILE" \
  --pid-path="$PID_PATH" \
  --profile="$PROFILE" \
  --receipt-compaction-enabled="$RECEIPT_COMPACTION_ENABLED" \
  --reorg-logging-threshold="$REORG_LOGGING_THRESHOLD" \
  --required-block="$REQUIRED_BLOCK" \
  --metrics-enabled="$METRICS_ENABLED" \
  --metrics-host="$METRICS_HOST" \
  --metrics-port="$METRICS_PORT" \
  --metrics-protocol="$METRICS_PROTOCOL" \
  --metrics-push-enabled="$METRICS_PUSH_ENABLED" \
  --metrics-push-host="$METRICS_PUSH_HOST" \
  --metrics-push-interval="$METRICS_PUSH_INTERVAL" \
  --metrics-push-port="$METRICS_PUSH_PORT" \
  --metrics-push-prometheus-job="$METRICS_PUSH_PROMETHEUS_JOB" \
  --permissions-accounts-config-file="$PERMISSIONS_ACCOUNTS_CONFIG_FILE" \
  --permissions-accounts-config-file-enabled="$PERMISSIONS_ACCOUNTS_CONFIG_FILE_ENABLED" \
  --permissions-accounts-contract-address="$PERMISSIONS_ACCOUNTS_CONTRACT_ADDRESS" \
  --permissions-accounts-contract-enabled="$PERMISSIONS_ACCOUNTS_CONTRACT_ENABLED" \
  --permissions-nodes-config-file="$PERMISSIONS_NODES_CONFIG_FILE" \
  --permissions-nodes-config-file-enabled="$PERMISSIONS_NODES_CONFIG_FILE_ENABLED" \
  --permissions-nodes-contract-address="$PERMISSIONS_NODES_CONTRACT_ADDRESS" \
  --permissions-nodes-contract-enabled="$PERMISSIONS_NODES_CONTRACT_ENABLED" \
  --permissions-nodes-contract-version="$PERMISSIONS_NODES_CONTRACT_VERSION" \
  --api-gas-price-blocks="$API_GAS_PRICE_BLOCKS" \
  --api-gas-price-max="$API_GAS_PRICE_MAX" \
  --api-gas-price-percentile="$API_GAS_PRICE_PERCENTILE" \
  --rpc-gas-cap="$RPC_GAS_CAP" \
  --rpc-max-logs-range="$RPC_MAX_LOGS_RANGE" \
  --rpc-max-trace-filter-range="$RPC_MAX_TRACE_FILTER_RANGE"