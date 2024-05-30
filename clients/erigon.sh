#!/usr/bin/env bash 

set -e 

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$script_dir/../commons.sh"

# Parse command-line options, standardized options for all clients
parse_options "$@"

erigon \
  --datadir="$DATADIR" \
  --ethash.dagdir="$ETHASH_DAGDIR" \
  --snapshots="$SNAPSHOTS" \
  --internalcl="$INTERNALCL" \
  --txpool.disable="$TXPOOL_DISABLE" \
  --txpool.locals="$TXPOOL_LOCALS" \
  --txpool.nolocals="$TXPOOL_NOLOCALS" \
  --txpool.pricelimit="$TXPOOL_PRICELIMIT" \
  --txpool.pricebump="$TXPOOL_PRICEBUMP" \
  --txpool.blobpricebump="$TXPOOL_BLOBPRICEBUMP" \
  --txpool.accountslots="$TXPOOL_ACCOUNTSLOTS" \
  --txpool.blobslots="$TXPOOL_BLOBSLOTS" \
  --txpool.totalblobpoollimit="$TXPOOL_TOTALBLOBPOOLLIMIT" \
  --txpool.globalslots="$TXPOOL_GLOBALSLOTS" \
  --txpool.globalbasefeeslots="$TXPOOL_GLOBALBASEFEESLOTS" \
  --txpool.accountqueue="$TXPOOL_ACCOUNTQUEUE" \
  --txpool.globalqueue="$TXPOOL_GLOBALQUEUE" \
  --txpool.lifetime="$TXPOOL_LIFETIME" \
  --txpool.trace.senders="$TXPOOL_TRACE_SENDERS" \
  --txpool.commit.every="$TXPOOL_COMMIT_EVERY" \
  --prune="$PRUNE" \
  --prune.h.older="$PRUNE_H_OLDER" \
  --prune.r.older="$PRUNE_R_OLDER" \
  --prune.t.older="$PRUNE_T_OLDER" \
  --prune.c.older="$PRUNE_C_OLDER" \
  --prune.h.before="$PRUNE_H_BEFORE" \
  --prune.r.before="$PRUNE_R_BEFORE" \
  --prune.t.before="$PRUNE_T_BEFORE" \
  --prune.c.before="$PRUNE_C_BEFORE" \
  --batchSize="$BATCHSIZE" \
  --bodies.cache="$BODIES_CACHE" \
  --database.verbosity="$DATABASE_VERBOSITY" \
  --private.api.addr="$PRIVATE_API_ADDR" \
  --private.api.ratelimit="$PRIVATE_API_RATELIMIT" \
  --etl.bufferSize="$ETL_BUFFERSIZE" \
  --tls="$TLS" \
  --tls.cert="$TLS_CERT" \
  --tls.key="$TLS_KEY" \
  --tls.cacert="$TLS_CACERT" \
  --state.stream.disable="$STATE_STREAM_DISABLE" \
  --sync.loop.throttle="$SYNC_LOOP_THROTTLE" \
  --bad.block="$BAD_BLOCK" \
  --http="$HTTP" \
  --http.enabled="$HTTP_ENABLED" \
  --graphql="$GRAPHQL" \
  --http.addr="$HTTP_ADDR" \
  --http.port="$HTTP_PORT" \
  --authrpc.addr="$AUTHRPC_ADDR" \
  --authrpc.port="$AUTHRPC_PORT" \
  --authrpc.jwtsecret="$AUTHRPC_JWTSECRET" \
  --http.compression="$HTTP_COMPRESSION" \
  --http.corsdomain="$HTTP_CORSDOMAIN" \
  --http.vhosts="$HTTP_VHOSTS" \
  --authrpc.vhosts="$AUTHRPC_VHOSTS" \
  --http.api="$HTTP_API" \
  --ws.port="$WS_PORT" \
  --ws="$WS" \
  --ws.compression="$WS_COMPRESSION" \
  --http.trace="$HTTP_TRACE" \
  --http.dbg.single="$HTTP_DBG_SINGLE" \
  --state.cache="$STATE_CACHE" \
  --rpc.batch.concurrency="$RPC_BATCH_CONCURRENCY" \
  --rpc.streaming.disable="$RPC_STREAMING_DISABLE" \
  --db.read.concurrency="$DB_READ_CONCURRENCY" \
  --rpc.accessList="$RPC_ACCESSLIST" \
  --trace.compat="$TRACE_COMPAT" \
  --rpc.gascap="$RPC_GASCAP" \
  --rpc.batch.limit="$RPC_BATCH_LIMIT" \
  --rpc.returndata.limit="$RPC_RETURNDATA_LIMIT" \
  --rpc.allow-unprotected-txs="$RPC_ALLOW_UNPROTECTED_TXS" \
  --rpc.maxgetproofrewindblockcount.limit="$RPC_MAXGETPROOFREWINDBLOCKCOUNT_LIMIT" \
  --rpc.txfeecap="$RPC_TXFEECAP" \
  --txpool.api.addr="$TXPOOL_API_ADDR" \
  --trace.maxtraces="$TRACE_MAXTRACES" \
  --http.timeouts.read="$HTTP_TIMEOUTS_READ" \
  --http.timeouts.write="$HTTP_TIMEOUTS_WRITE" \
  --http.timeouts.idle="$HTTP_TIMEOUTS_IDLE" \
  --authrpc.timeouts.read="$AUTHRPC_TIMEOUTS_READ" \
  --authrpc.timeouts.write="$AUTHRPC_TIMEOUTS_WRITE" \
  --authrpc.timeouts.idle="$AUTHRPC_TIMEOUTS_IDLE" \
  --rpc.evmtimeout="$RPC_EVMTIMEOUT" \
  --rpc.overlay.getlogstimeout="$RPC_OVERLAY_GETLOGSTIMEOUT" \
  --rpc.overlay.replayblocktimeout="$RPC_OVERLAY_REPLAYBLOCKTIMEOUT" \
  --snap.keepblocks="$SNAP_KEEPBLOCKS" \
  --snap.stop="$SNAP_STOP" \
  --db.pagesize="$DB_PAGESIZE" \
  --db.size.limit="$DB_SIZE_LIMIT" \
  --force.partial.commit="$FORCE_PARTIAL_COMMIT" \
  --torrent.port="$TORRENT_PORT" \
  --torrent.maxpeers="$TORRENT_MAXPEERS" \
  --torrent.conns.perfile="$TORRENT_CONNS_PERFILE" \
  --torrent.download.slots="$TORRENT_DOWNLOAD_SLOTS" \
  --torrent.staticpeers="$TORRENT_STATICPEERS" \
  --torrent.upload.rate="$TORRENT_UPLOAD_RATE" \
  --torrent.download.rate="$TORRENT_DOWNLOAD_RATE" \
  --torrent.verbosity="$TORRENT_VERBOSITY" \
  --port="$PORT" \
  --p2p.protocol="$P2P_PROTOCOL" \
  --p2p.allowed-ports="$P2P_ALLOWED_PORTS" \
  --nat="$NAT" \
  --nodiscover="$NODISCOVER" \
  --v5disc="$V5DISC" \
  --netrestrict="$NETRESTRICT" \
  --nodekey="$NODEKEY" \
  --nodekeyhex="$NODEKEYHEX" \
  --discovery.dns="$DISCOVERY_DNS" \
  --bootnodes="$BOOTNODES" \
  --staticpeers="$STATICPEERS" \
  --trustedpeers="$TRUSTEDPEERS" \
  --maxpeers="$MAXPEERS" \
  --chain="$CHAIN" \
  --dev.period="$DEV_PERIOD" \
  --vmdebug="$VMDEBUG" \
  --networkid="$NETWORKID" \
  --fakepow="$FAKEPOW" \
  --gpo.blocks="$GPO_BLOCKS" \
  --gpo.percentile="$GPO_PERCENTILE" \
  --allow-insecure-unlock="$ALLOW_INSECURE_UNLOCK" \
  --identity="$IDENTITY" \
  --clique.checkpoint="$CLIQUE_CHECKPOINT" \
  --clique.snapshots="$CLIQUE_SNAPSHOTS" \
  --clique.signatures="$CLIQUE_SIGNATURES" \
  --clique.datadir="$CLIQUE_DATADIR" \
  --mine="$MINE" \
  --proposer.disable="$PROPOSER_DISABLE" \
  --miner.notify="$MINER_NOTIFY" \
  --miner.gaslimit="$MINER_GASLIMIT" \
  --miner.etherbase="$MINER_ETHERBASE" \
  --miner.extradata="$MINER_EXTRADATA" \
  --miner.noverify="$MINER_NOVERIFY" \
  --miner.sigfile="$MINER_SIGFILE" \
  --miner.recommit="$MINER_RECOMMIT" \
  --sentry.api.addr="$SENTRY_API_ADDR" \
  --sentry.log-peer-info="$SENTRY_LOG_PEER_INFO" \
  --downloader.api.addr="$DOWNLOADER_API_ADDR" \
  --downloader.disable.ipv4="$DOWNLOADER_DISABLE_IPV4" \
  --downloader.disable.ipv6="$DOWNLOADER_DISABLE_IPV6" \
  --no-downloader="$NO_DOWNLOADER" \
  --downloader.verify="$DOWNLOADER_VERIFY" \
  --healthcheck="$HEALTHCHECK" \
  --bor.heimdall="$BOR_HEIMDALL" \
  --webseed="$WEBSEED" \
  --bor.withoutheimdall="$BOR_WITHOUTHEIMDALL" \
  --bor.period="$BOR_PERIOD" \
  --bor.minblocksize="$BOR_MINBLOCKSIZE" \
  --bor.milestone="$BOR_MILESTONE" \
  --bor.waypoints="$BOR_WAYPOINTS" \
  --polygon.sync="$POLYGON_SYNC" \
  --ethstats="$ETHSTATS" \
  --override.prague="$OVERRIDE_PRAGUE" \
  --lightclient.discovery.addr="$LIGHTCLIENT_DISCOVERY_ADDR" \
  --lightclient.discovery.port="$LIGHTCLIENT_DISCOVERY_PORT" \
  --lightclient.discovery.tcpport="$LIGHTCLIENT_DISCOVERY_TCPPORT" \
  --sentinel.addr="$SENTINEL_ADDR" \
  --sentinel.port="$SENTINEL_PORT" \
  --ots.search.max.pagesize="$OTS_SEARCH_MAX_PAGESIZE" \
  --silkworm.exec="$SILKWORM_EXEC" \
  --silkworm.rpc="$SILKWORM_RPC" \
  --silkworm.sentry="$SILKWORM_SENTRY" \
  --silkworm.verbosity="$SILKWORM_VERBOSITY" \
  --silkworm.contexts="$SILKWORM_CONTEXTS" \
  --silkworm.rpc.log="$SILKWORM_RPC_LOG" \
  --silkworm.rpc.log.maxsize="$SILKWORM_RPC_LOG_MAXSIZE" \
  --silkworm.rpc.log.maxfiles="$SILKWORM_RPC_LOG_MAXFILES" \
  --silkworm.rpc.log.response="$SILKWORM_RPC_LOG_RESPONSE" \
  --silkworm.rpc.workers="$SILKWORM_RPC_WORKERS" \
  --silkworm.rpc.compatibility="$SILKWORM_RPC_COMPATIBILITY" \
  --beacon.api="$BEACON_API" \
  --beacon.api.addr="$BEACON_API_ADDR" \
  --beacon.api.cors.allow-methods="$BEACON_API_CORS_ALLOW_METHODS" \
  --beacon.api.cors.allow-origins="$BEACON_API_CORS_ALLOW_ORIGINS" \
  --beacon.api.cors.allow-credentials="$BEACON_API_CORS_ALLOW_CREDENTIALS" \
  --beacon.api.port="$BEACON_API_PORT" \
  --beacon.api.read.timeout="$BEACON_API_READ_TIMEOUT" \
  --beacon.api.write.timeout="$BEACON_API_WRITE_TIMEOUT" \
  --beacon.api.protocol="$BEACON_API_PROTOCOL" \
  --beacon.api.ide.timeout="$BEACON_API_IDE_TIMEOUT" \
  --caplin.backfilling="$CAPLIN_BACKFILLING" \
  --caplin.backfilling.blob="$CAPLIN_BACKFILLING_BLOB" \
  --caplin.backfilling.blob.no-pruning="$CAPLIN_BACKFILLING_BLOB_NO_PRUNING" \
  --caplin.archive="$CAPLIN_ARCHIVE" \
  --trusted-setup-file="$TRUSTED_SETUP_FILE" \
  --rpc.slow="$RPC_SLOW" \
  --txpool.gossip.disable="$TXPOOL_GOSSIP_DISABLE" \
  --sync.loop.block.limit="$SYNC_LOOP_BLOCK_LIMIT" \
  --sync.loop.break.after="$SYNC_LOOP_BREAK_AFTER" \
  --sync.loop.prune.limit="$SYNC_LOOP_PRUNE_LIMIT" \
  --pprof="$PPROF" \
  --pprof.addr="$PPROF_ADDR" \
  --pprof.port="$PPROF_PORT" \
  --pprof.cpuprofile="$PPROF_CPUPROFILE" \
  --trace="$TRACE" \
  --metrics="$METRICS" \
  --metrics.addr="$METRICS_ADDR" \
  --metrics.port="$METRICS_PORT" \
  --diagnostics.disabled="$DIAGNOSTICS_DISABLED" \
  --diagnostics.endpoint.addr="$DIAGNOSTICS_ENDPOINT_ADDR" \
  --diagnostics.endpoint.port="$DIAGNOSTICS_ENDPOINT_PORT" \
  --log.json="$LOG_JSON" \
  --log.console.json="$LOG_CONSOLE_JSON" \
  --log.dir.json="$LOG_DIR_JSON" \
  --verbosity="$VERBOSITY" \
  --log.console.verbosity="$LOG_CONSOLE_VERBOSITY" \
  --log.dir.disable="$LOG_DIR_DISABLE" \
  --log.dir.path="$LOG_DIR_PATH" \
  --log.dir.prefix="$LOG_DIR_PREFIX" \
  --log.dir.verbosity="$LOG_DIR_VERBOSITY" \
  --log.delays="$LOG_DELAYS"