# run-client
Ethereum client scripts to run clients, but with standardized options

Sure! Here is the updated script with the additional instructions:

## Running a node 

Open two terminals and execute the following commands:

Terminal 1:
```bash 
bash run-client.sh --network <network> --consensus-client <consensus_client> --execution-client <execution_client> --run execution 
```

Terminal 2:
```bash
bash run-client.sh --network <network> --consensus-client <consensus_client>  --execution-client <execution_client> --run consensus 
```

For running a node on:
- Mainnet, see [mainnet.md](mainnet.md)
- Sepolia, see [sepolia.md](sepolia.md)
- Holesky, see [holesky.md](holesky.md)
- Ephemery, see [holesky.md](ephemery.md)