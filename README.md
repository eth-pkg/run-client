# run-client
Ethereum client scripts to run clients, but with standardized options

## Table of Contents
- [Running a Node](#running-a-node)
  - [mainnet](#mainnet)
  - [ephemery](#ephemery)

## Running a Node 

### Mainnet

<details>
  <summary>besu - lighthouse</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>besu - lodestar</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>besu - nimbus-eth2</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>besu - prysm</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>besu - teku</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client teku --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client teku --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>erigon - lighthouse</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>erigon - lodestar</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>erigon - nimbus-eth2</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>erigon - prysm</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>erigon - teku</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client teku --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client teku --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>geth - lighthouse</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>geth - lodestar</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>geth - nimbus-eth2</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>geth - prysm</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>geth - teku</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client teku --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client teku --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>nethermind - lighthouse</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client nethermind --run consensus 
  ```
</details>

<details>
  <summary>nethermind - lodestar</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client nethermind --run consensus 
  ```
</details>

<details>
  <summary>nethermind - nimbus-eth2</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client nethermind --run consensus 
  ```
</details>

<details>
  <summary>nethermind - prysm</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client nethermind --run consensus 
  ```
</details>

<details>
  <summary>nethermind - teku</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client teku --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client teku --execution-client nethermind --run consensus 
  ```
</details>


### Ephemery

<details>
  <summary>besu - lighthouse</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network ephemery --consensus-client lighthouse --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network ephemery --consensus-client lighthouse --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>besu - lodestar</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>besu - nimbus-eth2</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>besu - prysm</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>besu - teku</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client teku --execution-client besu --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client teku --execution-client besu --run consensus 
  ```
</details>

<details>
  <summary>erigon - lighthouse</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>erigon - lodestar</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>erigon - nimbus-eth2</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>erigon - prysm</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>erigon - teku</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client teku --execution-client erigon --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client teku --execution-client erigon --run consensus 
  ```
</details>

<details>
  <summary>geth - lighthouse</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>geth - lodestar</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>geth - nimbus-eth2</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>geth - prysm</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>geth - teku</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client teku --execution-client geth --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client teku --execution-client geth --run consensus 
  ```
</details>

<details>
  <summary>nethermind - lighthouse</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lighthouse --execution-client nethermind --run consensus 
  ```
</details>

<details>
  <summary>nethermind - lodestar</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client lodestar --execution-client nethermind --run consensus 
  ```
</details>

<details>
  <summary>nethermind - nimbus-eth2</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client nimbus-eth2 --execution-client nethermind --run consensus 
  ```
</details>

<details>
  <summary>nethermind - prysm</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client prysm --execution-client nethermind --run consensus 
  ```
</details>

<details>
  <summary>nethermind - teku</summary>

  Open two terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network mainnet --consensus-client teku --execution-client nethermind --run execution 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network mainnet --consensus-client teku --execution-client nethermind --run consensus 
  ```
</details>

