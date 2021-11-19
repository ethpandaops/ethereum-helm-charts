# Ethereum Helm Charts

[![Release Helm Charts](https://github.com/skylenet/ethereum-helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/skylenet/ethereum-helm-charts/actions/workflows/release.yaml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/ethereum-helm-charts)](https://artifacthub.io/packages/search?repo=ethereum-helm-charts)

A set of [Helm](https://helm.sh/) charts to run multiple components of the [Ethereum](https://ethereum.org/) blockchain on [Kubernetes](https://kubernetes.io/).

A set of deployment examples that use these helm charts can be found under [skylenet/ethereum-k8s-testnets](https://github.com/skylenet/ethereum-k8s-testnets).

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```sh
helm repo add ethereum-helm-charts https://skylenet.github.io/ethereum-helm-charts
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
- [`geth`](charts/geth)
- [`nethermind`](charts/nethermind)

Consensus layer clients
- [`lighthouse`](charts/lighthouse)
- [`lodestar`](charts/lodestar)
- [`nimbus`](charts/nimbus)
- [`prysm`](charts/prysm)
- [`teku`](charts/teku)

Tooling
- [`beaconchain-explorer`](charts/beaconchain-explorer) - Beacon chain block explorer
- [`blockscout`](charts/blockscout) - Execution layer block explorer
- [`dshackle`](charts/dshackle) - Fault tolerant load balancer for blockchain apis, including Ethereum RPC
- [`eth2-fork-mon`](charts/eth2-fork-mon) - Fork monitor for a configurable set of beacon nodes
- [`ethstats`](charts/ethstats) - Web UI to track execution layer node status
- [`ganache`](charts/ganache) - Simulator for development and testing purposes of the execution layer
- [`genesis-generator`](charts/genesis-generator) - A tool to generate and expose genesis files for the execution and consensus layer clients

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
