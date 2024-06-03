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

append_option "--datadir" "$ERIGON_CLI_DATADIR"
append_option "--ethash.dagdir" "$ERIGON_CLI_ETHASH_DAGDIR"
append_option "--snapshots" "$ERIGON_CLI_SNAPSHOTS"
append_option "--internalcl" "$ERIGON_CLI_INTERNALCL"
append_option "--txpool.disable" "$ERIGON_CLI_TXPOOL_DISABLE"
append_option "--txpool.locals" "$ERIGON_CLI_TXPOOL_LOCALS"
append_option "--txpool.nolocals" "$ERIGON_CLI_TXPOOL_NOLOCALS"
append_option "--txpool.pricelimit" "$ERIGON_CLI_TXPOOL_PRICELIMIT"
append_option "--txpool.pricebump" "$ERIGON_CLI_TXPOOL_PRICEBUMP"
append_option "--txpool.blobpricebump" "$ERIGON_CLI_TXPOOL_BLOBPRICEBUMP"
append_option "--txpool.accountslots" "$ERIGON_CLI_TXPOOL_ACCOUNTSLOTS"
append_option "--txpool.blobslots" "$ERIGON_CLI_TXPOOL_BLOBSLOTS"
append_option "--txpool.totalblobpoollimit" "$ERIGON_CLI_TXPOOL_TOTALBLOBPOOLLIMIT"
append_option "--txpool.globalslots" "$ERIGON_CLI_TXPOOL_GLOBALSLOTS"
append_option "--txpool.globalbasefeeslots" "$ERIGON_CLI_TXPOOL_GLOBALBASEFEESLOTS"
append_option "--txpool.accountqueue" "$ERIGON_CLI_TXPOOL_ACCOUNTQUEUE"
append_option "--txpool.globalqueue" "$ERIGON_CLI_TXPOOL_GLOBALQUEUE"
append_option "--txpool.lifetime" "$ERIGON_CLI_TXPOOL_LIFETIME"
append_option "--txpool.trace.senders" "$ERIGON_CLI_TXPOOL_TRACE_SENDERS"
append_option "--txpool.commit.every" "$ERIGON_CLI_TXPOOL_COMMIT_EVERY"
append_option "--prune" "$ERIGON_CLI_PRUNE"
append_option "--prune.h.older" "$ERIGON_CLI_PRUNE_H_OLDER"
append_option "--prune.r.older" "$ERIGON_CLI_PRUNE_R_OLDER"
append_option "--prune.t.older" "$ERIGON_CLI_PRUNE_T_OLDER"
append_option "--prune.c.older" "$ERIGON_CLI_PRUNE_C_OLDER"
append_option "--prune.h.before" "$ERIGON_CLI_PRUNE_H_BEFORE"
append_option "--prune.r.before" "$ERIGON_CLI_PRUNE_R_BEFORE"
append_option "--prune.t.before" "$ERIGON_CLI_PRUNE_T_BEFORE"
append_option "--prune.c.before" "$ERIGON_CLI_PRUNE_C_BEFORE"
append_option "--batchSize" "$ERIGON_CLI_BATCH_SIZE"
append_option "--bodies.cache" "$ERIGON_CLI_BODIES_CACHE"
append_option "--database.verbosity" "$ERIGON_CLI_DATABASE_VERBOSITY"
append_option "--private.api.addr" "$ERIGON_CLI_PRIVATE_API_ADDR"
append_option "--private.api.ratelimit" "$ERIGON_CLI_PRIVATE_API_RATELIMIT"
append_option "--etl.bufferSize" "$ERIGON_CLI_ETL_BUFFER_SIZE"
append_option "--tls" "$ERIGON_CLI_TLS"
append_option "--tls.cert" "$ERIGON_CLI_TLS_CERT"
append_option "--tls.key" "$ERIGON_CLI_TLS_KEY"
append_option "--tls.cacert" "$ERIGON_CLI_TLS_CACERT"
append_option "--state.stream.disable" "$ERIGON_CLI_STATE_STREAM_DISABLE"
append_option "--sync.loop.throttle" "$ERIGON_CLI_SYNC_LOOP_THROTTLE"
append_option "--bad.block" "$ERIGON_CLI_BAD_BLOCK"
append_option "--http" "$ERIGON_CLI_HTTP"
append_option "--http.enabled" "$ERIGON_CLI_HTTP_ENABLED"
append_option "--graphql" "$ERIGON_CLI_GRAPHQL"
append_option "--http.addr" "$ERIGON_CLI_HTTP_ADDR"
append_option "--http.port" "$ERIGON_CLI_HTTP_PORT"
append_option "--authrpc.addr" "$ERIGON_CLI_AUTHRPC_ADDR"
append_option "--authrpc.port" "$ERIGON_CLI_AUTHRPC_PORT"
append_option "--authrpc.jwtsecret" "$ERIGON_CLI_AUTHRPC_JWTSECRET"
append_option "--http.compression" "$ERIGON_CLI_HTTP_COMPRESSION"
append_option "--http.corsdomain" "$ERIGON_CLI_HTTP_CORSDOMAIN"
append_option "--http.vhosts" "$ERIGON_CLI_HTTP_VHOSTS"
append_option "--authrpc.vhosts" "$ERIGON_CLI_AUTHRPC_VHOSTS"
append_option "--http.api" "$ERIGON_CLI_HTTP_API"
append_option "--ws.port" "$ERIGON_CLI_WS_PORT"
append_option "--ws" "$ERIGON_CLI_WS"
append_option "--ws.compression" "$ERIGON_CLI_WS_COMPRESSION"
append_option "--http.trace" "$ERIGON_CLI_HTTP_TRACE"
append_option "--http.dbg.single" "$ERIGON_CLI_HTTP_DBG_SINGLE"
append_option "--state.cache" "$ERIGON_CLI_STATE_CACHE"
append_option "--rpc.batch.concurrency" "$ERIGON_CLI_RPC_BATCH_CONCURRENCY"
append_option "--rpc.streaming.disable" "$ERIGON_CLI_RPC_STREAMING_DISABLE"
append_option "--db.read.concurrency" "$ERIGON_CLI_DB_READ_CONCURRENCY"
append_option "--rpc.accessList" "$ERIGON_CLI_RPC_ACCESSLIST"
append_option "--trace.compat" "$ERIGON_CLI_TRACE_COMPAT"
append_option "--rpc.gascap" "$ERIGON_CLI_RPC_GASCAP"
append_option "--rpc.batch.limit" "$ERIGON_CLI_RPC_BATCH_LIMIT"
append_option "--rpc.returndata.limit" "$ERIGON_CLI_RPC_RETURNDATA_LIMIT"
append_option "--rpc.allow-unprotected-txs" "$ERIGON_CLI_RPC_ALLOW_UNPROTECTED_TXS"
append_option "--rpc.maxgetproofrewindblockcount.limit" "$ERIGON_CLI_RPC_MAXGETPROOFREWINDBLOCKCOUNT_LIMIT"
append_option "--rpc.txfeecap" "$ERIGON_CLI_RPC_TXFEECAP"
append_option "--txpool.api.addr" "$ERIGON_CLI_TXPOOL_API_ADDR"
append_option "--trace.maxtraces" "$ERIGON_CLI_TRACE_MAXTRACES"
append_option "--http.timeouts.read" "$ERIGON_CLI_HTTP_TIMEOUTS_READ"
append_option "--http.timeouts.write" "$ERIGON_CLI_HTTP_TIMEOUTS_WRITE"
append_option "--http.timeouts.idle" "$ERIGON_CLI_HTTP_TIMEOUTS_IDLE"
append_option "--authrpc.timeouts.read" "$ERIGON_CLI_AUTHRPC_TIMEOUTS_READ"
append_option "--authrpc.timeouts.write" "$ERIGON_CLI_AUTHRPC_TIMEOUTS_WRITE"
append_option "--authrpc.timeouts.idle" "$ERIGON_CLI_AUTHRPC_TIMEOUTS_IDLE"
append_option "--rpc.evmtimeout" "$ERIGON_CLI_RPC_EVMTIMEOUT"
append_option "--rpc.overlay.getlogstimeout" "$ERIGON_CLI_RPC_OVERLAY_GETLOGSTIMEOUT"
append_option "--rpc.overlay.replayblocktimeout" "$ERIGON_CLI_RPC_OVERLAY_REPLAYBLOCKTIMEOUT"
append_option "--snap.keepblocks" "$ERIGON_CLI_SNAP_KEEPBLOCKS"
append_option "--snap.stop" "$ERIGON_CLI_SNAP_STOP"
append_option "--db.pagesize" "$ERIGON_CLI_DB_PAGESIZE"
append_option "--db.size.limit" "$ERIGON_CLI_DB_SIZE_LIMIT"
append_option "--force.partial.commit" "$ERIGON_CLI_FORCE_PARTIAL_COMMIT"
append_option "--torrent.port" "$ERIGON_CLI_TORRENT_PORT"
append_option "--torrent.conns.perfile" "$ERIGON_CLI_TORRENT_CONN_PERFILE"
append_option "--torrent.download.slots" "$ERIGON_CLI_TORRENT_DOWNLOAD_SLOTS"
append_option "--torrent.staticpeers" "$ERIGON_CLI_TORRENT_STATICPEERS"
append_option "--torrent.upload.rate" "$ERIGON_CLI_TORRENT_UPLOAD_RATE"
append_option "--torrent.download.rate" "$ERIGON_CLI_TORRENT_DOWNLOAD_RATE"
append_option "--torrent.verbosity" "$ERIGON_CLI_TORRENT_VERBOSITY"
append_option "--port" "$ERIGON_CLI_PORT"
append_option "--p2p.protocol" "$ERIGON_CLI_P2P_PROTOCOL"
append_option "--p2p.allowed-ports" "$ERIGON_CLI_P2P_ALLOWED_PORTS"
append_option "--nat" "$ERIGON_CLI_NAT"
append_option "--nodiscover" "$ERIGON_CLI_NODISCOVER"
append_option "--v5disc" "$ERIGON_CLI_V5DISC"
append_option "--netrestrict" "$ERIGON_CLI_NETRESTRICT"
append_option "--nodekey" "$ERIGON_CLI_NODEKEY"
append_option "--nodekeyhex" "$ERIGON_CLI_NODEKEYHEX"
append_option "--discovery.dns" "$ERIGON_CLI_DISCOVERY_DNS"
append_option "--bootnodes" "$ERIGON_CLI_BOOTNODES"
append_option "--staticpeers" "$ERIGON_CLI_STATICPEERS"
append_option "--trustedpeers" "$ERIGON_CLI_TRUSTEDPEERS"
append_option "--maxpeers" "$ERIGON_CLI_MAXPEERS"
append_option "--chain" "$ERIGON_CLI_CHAIN"
append_option "--dev.period" "$ERIGON_CLI_DEV_PERIOD"
append_option "--vmdebug" "$ERIGON_CLI_VMDEBUG"
append_option "--networkid" "$ERIGON_CLI_NETWORKID"
append_option "--fakepow" "$ERIGON_CLI_FAKEPOW"
append_option "--gpo.blocks" "$ERIGON_CLI_GPO_BLOCKS"
append_option "--gpo.percentile" "$ERIGON_CLI_GPO_PERCENTILE"
append_option "--allow-insecure-unlock" "$ERIGON_CLI_ALLOW_INSECURE_UNLOCK"
append_option "--identity" "$ERIGON_CLI_IDENTITY"
append_option "--clique.checkpoint" "$ERIGON_CLI_CLIQUE_CHECKPOINT"
append_option "--clique.snapshots" "$ERIGON_CLI_CLIQUE_SNAPSHOTS"
append_option "--clique.signatures" "$ERIGON_CLI_CLIQUE_SIGNATURES"
append_option "--clique.datadir" "$ERIGON_CLI_CLIQUE_DATADIR"
append_option "--mine" "$ERIGON_CLI_MINE"
append_option "--proposer.disable" "$ERIGON_CLI_PROPOSER_DISABLE"
append_option "--miner.notify" "$ERIGON_CLI_MINER_NOTIFY"
append_option "--miner.gaslimit" "$ERIGON_CLI_MINER_GASLIMIT"
append_option "--miner.etherbase" "$ERIGON_CLI_MINER_ETHERBASE"
append_option "--miner.extradata" "$ERIGON_CLI_MINER_EXTRADATA"
append_option "--miner.noverify" "$ERIGON_CLI_MINER_NOVERIFY"
append_option "--miner.sigfile" "$ERIGON_CLI_MINER_SIGFILE"
append_option "--miner.recommit" "$ERIGON_CLI_MINER_RECOMMIT"
append_option "--sentry.api.addr" "$ERIGON_CLI_SENTRY_API_ADDR"
append_option "--sentry.log-peer-info" "$ERIGON_CLI_SENTRY_LOG_PEER_INFO"
append_option "--downloader.api.addr" "$ERIGON_CLI_DOWNLOADER_API_ADDR"
append_option "--downloader.disable.ipv4" "$ERIGON_CLI_DOWNLOADER_DISABLE_IPV4"
append_option "--downloader.disable.ipv6" "$ERIGON_CLI_DOWNLOADER_DISABLE_IPV6"
append_option "--no-downloader" "$ERIGON_CLI_NO_DOWNLOADER"
append_option "--downloader.verify" "$ERIGON_CLI_DOWNLOADER_VERIFY"
append_option "--healthcheck" "$ERIGON_CLI_HEALTHCHECK"
append_option "--bor.heimdall" "$ERIGON_CLI_BOR_HEIMDALL"
append_option "--webseed" "$ERIGON_CLI_WEBSEED"
append_option "--bor.withoutheimdall" "$ERIGON_CLI_BOR_WITHOUTHEIMDALL"
append_option "--bor.period" "$ERIGON_CLI_BOR_PERIOD"
append_option "--bor.minblocksize" "$ERIGON_CLI_BOR_MINBLOCKSIZE"
append_option "--bor.milestone" "$ERIGON_CLI_BOR_MILESTONE"
append_option "--bor.waypoints" "$ERIGON_CLI_BOR_WAYPOINTS"
append_option "--polygon.sync" "$ERIGON_CLI_POLYGON_SYNC"
append_option "--ethstats" "$ERIGON_CLI_ETHSTATS"
append_option "--override.prague" "$ERIGON_CLI_OVERRIDE_PRAGUE"
append_option "--lightclient.discovery.addr" "$ERIGON_CLI_LIGHTCLIENT_DISCOVERY_ADDR"
append_option "--lightclient.discovery.port" "$ERIGON_CLI_LIGHTCLIENT_DISCOVERY_PORT"
append_option "--lightclient.discovery.tcpport" "$ERIGON_CLI_LIGHTCLIENT_DISCOVERY_TCPPORT"
append_option "--sentinel.addr" "$ERIGON_CLI_SENTINEL_ADDR"
append_option "--sentinel.port" "$ERIGON_CLI_SENTINEL_PORT"
append_option "--ots.search.max.pagesize" "$ERIGON_CLI_OTS_SEARCH_MAX_PAGESIZE"
append_option "--silkworm.exec" "$ERIGON_CLI_SILKWORM_EXEC"
append_option "--silkworm.rpc" "$ERIGON_CLI_SILKWORM_RPC"
append_option "--silkworm.sentry" "$ERIGON_CLI_SILKWORM_SENTRY"
append_option "--silkworm.verbosity" "$ERIGON_CLI_SILKWORM_VERBOSITY"
append_option "--silkworm.contexts" "$ERIGON_CLI_SILKWORM_CONTEXTS"
append_option "--silkworm.rpc.log" "$ERIGON_CLI_SILKWORM_RPC_LOG"
append_option "--silkworm.rpc.log.maxsize" "$ERIGON_CLI_SILKWORM_RPC_LOG_MAXSIZE"
append_option "--silkworm.rpc.log.maxfiles" "$ERIGON_CLI_SILKWORM_RPC_LOG_MAXFILES"
append_option "--silkworm.rpc.log.response" "$ERIGON_CLI_SILKWORM_RPC_LOG_RESPONSE"
append_option "--silkworm.rpc.workers" "$ERIGON_CLI_SILKWORM_RPC_WORKERS"
append_option "--silkworm.rpc.compatibility" "$ERIGON_CLI_SILKWORM_RPC_COMPATIBILITY"
append_option "--beacon.api" "$ERIGON_CLI_BEACON_API"
append_option "--beacon.api.addr" "$ERIGON_CLI_BEACON_API_ADDR"
append_option "--beacon.api.cors.allow-methods" "$ERIGON_CLI_BEACON_API_CORS_ALLOW_METHODS"
append_option "--beacon.api.cors.allow-origins" "$ERIGON_CLI_BEACON_API_CORS_ALLOW_ORIGINS"
append_option "--beacon.api.cors.allow-credentials" "$ERIGON_CLI_BEACON_API_CORS_ALLOW_CREDENTIALS"
append_option "--beacon.api.port" "$ERIGON_CLI_BEACON_API_PORT"
append_option "--beacon.api.read.timeout" "$ERIGON_CLI_BEACON_API_READ_TIMEOUT"
append_option "--beacon.api.write.timeout" "$ERIGON_CLI_BEACON_API_WRITE_TIMEOUT"
append_option "--beacon.api.protocol" "$ERIGON_CLI_BEACON_API_PROTOCOL"
append_option "--beacon.api.ide.timeout" "$ERIGON_CLI_BEACON_API_IDE_TIMEOUT"
append_option "--caplin.backfilling" "$ERIGON_CLI_CAPLIN_BACKFILLING"
append_option "--caplin.backfilling.blob" "$ERIGON_CLI_CAPLIN_BACKFILLING_BLOB"
append_option "--caplin.backfilling.blob.no-pruning" "$ERIGON_CLI_CAPLIN_BACKFILLING_BLOB_NO_PRUNING"
append_option "--caplin.archive" "$ERIGON_CLI_CAPLIN_ARCHIVE"
append_option "--trusted-setup-file" "$ERIGON_CLI_TRUSTED_SETUP_FILE"
append_option "--rpc.slow" "$ERIGON_CLI_RPC_SLOW"
append_option "--txpool.gossip.disable" "$ERIGON_CLI_TXPOOL_GOSSIP_DISABLE"
append_option "--sync.loop.block.limit" "$ERIGON_CLI_SYNC_LOOP_BLOCK_LIMIT"
append_option "--sync.loop.break.after" "$ERIGON_CLI_SYNC_LOOP_BREAK_AFTER"
append_option "--sync.loop.prune.limit" "$ERIGON_CLI_SYNC_LOOP_PRUNE_LIMIT"
append_option "--pprof" "$ERIGON_CLI_PPROF"
append_option "--pprof.addr" "$ERIGON_CLI_PPROF_ADDR"
append_option "--pprof.port" "$ERIGON_CLI_PPROF_PORT"
append_option "--pprof.cpuprofile" "$ERIGON_CLI_PPROF_CPUPROFILE"
append_option "--trace" "$ERIGON_CLI_TRACE"
append_option "--metrics" "$ERIGON_CLI_METRICS"
append_option "--metrics.addr" "$ERIGON_CLI_METRICS_ADDR"
append_option "--metrics.port" "$ERIGON_CLI_METRICS_PORT"
append_option "--diagnostics.disabled" "$ERIGON_CLI_DIAGNOSTICS_DISABLED"
append_option "--diagnostics.endpoint.addr" "$ERIGON_CLI_DIAGNOSTICS_ENDPOINT_ADDR"
append_option "--diagnostics.endpoint.port" "$ERIGON_CLI_DIAGNOSTICS_ENDPOINT_PORT"
append_option "--log.json" "$ERIGON_CLI_LOG_JSON"
append_option "--log.console.json" "$ERIGON_CLI_LOG_CONSOLE_JSON"
append_option "--log.dir.json" "$ERIGON_CLI_LOG_DIR_JSON"
append_option "--verbosity" "$ERIGON_CLI_VERBOSITY"
append_option "--log.console.verbosity" "$ERIGON_CLI_LOG_CONSOLE_VERBOSITY"
append_option "--log.dir.disable" "$ERIGON_CLI_LOG_DIR_DISABLE"
append_option "--log.dir.path" "$ERIGON_CLI_LOG_DIR_PATH"
append_option "--log.dir.prefix" "$ERIGON_CLI_LOG_DIR_PREFIX"
append_option "--log.dir.verbosity" "$ERIGON_CLI_LOG_DIR_VERBOSITY"
append_option "--log.delays" "$ERIGON_CLI_LOG_DELAYS"
append_option "--config" "$ERIGON_CLI_CONFIG"
append_option "--help" "$ERIGON_CLI_HELP"
append_option "--version" "$ERIGON_CLI_VERSION"

erigon $OPTIONS