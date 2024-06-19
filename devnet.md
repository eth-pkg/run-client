# devnet

Run clients on private devnet

## Table of Contents
- [Running a Node](#running-a-node)
  - [besu - lighthouse](#besu---lighthouse)
  - [besu - lodestar](#besu---lodestar)
  - [besu - nimbus-eth2](#besu---nimbus-eth2)
  - [besu - prysm](#besu---prysm)
  - [besu - teku](#besu---teku)
  - [erigon - lighthouse](#erigon---lighthouse)
  - [erigon - lodestar](#erigon---lodestar)
  - [erigon - nimbus-eth2](#erigon---nimbus-eth2)
  - [erigon - prysm](#erigon---prysm)
  - [erigon - teku](#erigon---teku)
  - [geth - lighthouse](#geth---lighthouse)
  - [geth - lodestar](#geth---lodestar)
  - [geth - nimbus-eth2](#geth---nimbus-eth2)
  - [geth - prysm](#geth---prysm)
  - [geth - teku](#geth---teku)
  - [nethermind - lighthouse](#nethermind---lighthouse)
  - [nethermind - lodestar](#nethermind---lodestar)
  - [nethermind - nimbus-eth2](#nethermind---nimbus-eth2)
  - [nethermind - prysm](#nethermind---prysm)
  - [nethermind - teku](#nethermind---teku)

## Running a Node

<details>
  <summary>besu - lighthouse</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client besu \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client besu \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client besu \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>besu - lodestar</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client besu \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client besu \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client besu \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>besu - nimbus-eth2</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client besu \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client besu \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client besu \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>besu - prysm</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client besu \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client besu \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client besu \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>besu - teku</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client besu \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client besu \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client besu \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>erigon - lighthouse</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client erigon \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client erigon \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client erigon \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>erigon - lodestar</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client erigon \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client erigon \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client erigon \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>erigon - nimbus-eth2</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client erigon \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client erigon \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client erigon \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>erigon - prysm</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client erigon \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client erigon \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client erigon \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>erigon - teku</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client erigon \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client erigon \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash


  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client erigon \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>geth - lighthouse</summary>

  Open four terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client geth \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client geth \
                     --run bootnode \
                     --with-validator 

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client geth \
                     --run consensus \
                     --with-validator 
  ```

  Terminal 4:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client geth \
                     --run validator \
                     --with-validator
  ```

</details>

<details>
  <summary>geth - lodestar</summary>

  Open four terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client geth \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client geth \
                     --run bootnode \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client geth \
                     --run consensus \
                     --with-validator
  ```

  Terminal 4:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client geth \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>geth - nimbus-eth2</summary>

  Open four terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client geth \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client geth \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client geth \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>geth - prysm</summary>

  Open three terminals and execute the following commands:
  Prysm does not require the presence of bootnode. 

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client geth \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client geth \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client geth \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>geth - teku</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client geth \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client geth \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client geth \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>nethermind - lighthouse</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client nethermind \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client nethermind \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lighthouse \
                     --execution-client nethermind \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>nethermind - lodestar</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client nethermind \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client nethermind \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client lodestar \
                     --execution-client nethermind \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>nethermind - nimbus-eth2</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client nethermind \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client nethermind \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client nimbus-eth2 \
                     --execution-client nethermind \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>nethermind - prysm</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client nethermind \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client nethermind \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client prysm \
                     --execution-client nethermind \
                     --run validator \
                     --with-validator 
  ```

</details>

<details>
  <summary>nethermind - teku</summary>

  Open three terminals and execute the following commands:

  Terminal 1:
  ```bash 
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client nethermind \
                     --run execution \
                     --with-validator 
  ```

  Terminal 2:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client nethermind \
                     --run consensus \
                     --with-validator
  ```

  Terminal 3:
  ```bash
  bash run-client.sh --network devnet \
                     --consensus-client teku \
                     --execution-client nethermind \
                     --run validator \
                     --with-validator 
  ```

</details>