# Ethereum Helm Charts

[![Release Helm Charts](https://github.com/ethpandaops/ethereum-helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/ethpandaops/ethereum-helm-charts/actions/workflows/release.yaml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/ethereum-helm-charts)](https://artifacthub.io/packages/search?repo=ethereum-helm-charts)

A set of [Helm](https://helm.sh/) charts to run multiple components of the [Ethereum](https://ethereum.org/) blockchain on [Kubernetes](https://kubernetes.io/).

Deployment examples that use these helm charts can be found under [ethpandaops/ethereum-k8s-testnets](https://github.com/ethpandaops/ethereum-k8s-testnets).

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```sh
helm repo add ethereum-helm-charts https://ethpandaops.github.io/ethereum-helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run the following command to see the charts.

```sh
helm search repo ethereum-helm-charts
```

To install the ethstats chart:

```sh
helm install ethstats ethereum-helm-charts/ethstats
```

To uninstall the chart:

```sh
helm delete ethstats
```

## List of charts

Execution layer clients

- [`besu`](charts/besu)
- [`erigon`](charts/erigon)
- [`ethereumjs`](charts/ethereumjs)
- [`geth`](charts/geth)
- [`nethermind`](charts/nethermind)
- ['reth'](charts/reth)

Consensus layer clients

- [`lighthouse`](charts/lighthouse)
- [`lodestar`](charts/lodestar)
- [`nimbus`](charts/nimbus)
- [`prysm`](charts/prysm)
- [`teku`](charts/teku)

Generic

- [`ethereum-node`](charts/ethereum-node) - Umbrella chart that uses the execution and consensus layer client charts.

Tooling

- [`beaconchain-explorer`](charts/beaconchain-explorer) - Beacon chain block explorer.
- [`blobscan`](charts/blobscan) - Blobscan is the first blockchain explorer that helps to navigate and visualize those EIP-4844 blobs.
- [`blobscan-api`](charts/blobscan-api) - Blobscan tRPC API.
- [`blobscan-indexer`](charts/blobscan-indexer) - Blobscan-Indexer indexes blobs in MongoDB for use with Blobscan.
- [`blockscout`](charts/blockscout) - Execution layer block explorer.
- [`consensus-monitor`](charts/consensus-monitor) - Web UI to check your ethereum consensus layer nodes via their beacon APIs.
- [`dshackle`](charts/dshackle) - Fault tolerant load balancer for blockchain apis, including Ethereum RPC.
- [`eth2-fork-mon`](charts/eth2-fork-mon) - Fork monitor for a configurable set of beacon nodes.
- [`ethstats`](charts/ethstats) - Web UI to track execution layer node status.
- [`eth-faucet`](charts/eth-faucet) - Ether faucet server built with Go and Svelte.
- [`fauceth`](charts/fauceth) - EIP1559 compatible web faucet using Hcaptcha.
- [`forkmon`](charts/forkmon) - Fork monitor for execution layer nodes.
- [`ganache`](charts/ganache) - Simulator for development and testing purposes of the execution layer.
- [`genesis-generator`](charts/genesis-generator) - A tool to generate and expose genesis files for the execution and consensus layer clients.
- [`rpc-proxy`](charts/rpc-proxy) - A proxy for web3 JSONRPC. Rate limiting and method filtering.
- [`testnet-faucet`](charts/testnet-faucet) - Web faucet that can be used to distribute testnet ETH to users.
- [`testnet-homepage`](charts/testnet-homepage) - Simple website that can be used to display useful information about your testnet.
- [`ethereum-metrics-exporter`](charts/ethereum-metrics-exporter) - A prometheus exporter for Ethereum execution and consensus clients.
- [`checkpointz`](charts/checkpointz) - A beacon chain Checkpoint Sync provider.
- [`ethereum-address-metrics-exporter`](charts/ethereum-address-metrics-exporter) - A prometheus exporter for Ethereum externally owned account and contract addresses.
- [`smart-contract-verifier-http`](charts/smart-contract-verifier-http) - Smart contract verification service.
- [`stubbies`](charts/stubbies) - Ethereum execution client stub for consensus layer clients.
- [`eleel`](charts/eleel) - A multiplexer for Ethereum execution clients.
- [`web3signer`](charts/web3signer) - An open-source remote signing service.
- [`xatu-discovery`](charts/xatu-discovery) - Ethereum p2p monitoring tool that discovers node records.
- [`xatu-mimicry`](charts/xatu-mimicry) - Ethereum p2p monitoring tool that collects data from the execution layer.
- [`xatu-sentry`](charts/xatu-sentry) - Ethereum p2p monitoring tool that runs along side a [Ethereum consensus client](https://ethereum.org/en/developers/docs/nodes-and-clients/#consensus-clients) and collects data via the consensus client's [Beacon API](https://ethereum.github.io/beacon-APIs/).
- [`xatu-server`](charts/xatu-server) - Ethereum p2p monitoring tool that collects events from and controls various Xatu clients.

## Development

### Prerequisites

- [`pre-commit`](https://pre-commit.com/) - Used to setup pre-commit git hooks
- [`docker`](https://www.docker.com/) - Used by many Makefile targets

### Pre-commit hooks

This repository used [`pre-commit`](https://pre-commit.com/) to manage and run certain git hooks. Hook definitions can be found within the [`.pre-commit-config.yaml`](.pre-commit-config.yaml) file.

Run the following to add the hooks to your local repository:

```sh
make init
```

### Useful commands

The `README` for every chart is auto generated using [helm-docs](https://github.com/norwoodj/helm-docs). This is defined as a pre-commit hook. If you want to run it manually, you can run:

```sh
make docs
```

The [CT (Chart Testing)](https://github.com/helm/chart-testing) tool is used to lint and validate charts. You can run this via:

```sh
make lint
```

## License

[MIT License](LICENSE)
