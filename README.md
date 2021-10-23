# Ethereum Helm Charts

A set of [Helm](https://helm.sh/) charts to run multiple components of the [Ethereum](https://ethereum.org/) blockchain on [Kubernetes](https://kubernetes.io/).

> **Important**: These charts are currently still under heavy development and the chart versions won't be increased during this initial phase.

## List of charts

Execution layer clients
- [`besu`](charts/besu)
- [`erigon`](charts/erigon)
- [`geth`](charts/geth)
- [`nethermind`](charts/nethermind)

Consensus layer clients
- [`lighthouse`](charts/lighthouse)
- [`nimbus-eth2`](charts/nimbus-eth2)
- [`prysm`](charts/prysm)
- [`teku`](charts/teku)

Tooling
- [`eth2-fork-mon`](charts/eth2-fork-mon) - Fork monitor for a configurable set of beacon nodes
- [`ethstats`](charts/ethstats) - Web UI to track execution layer node status
- [`ganache`](charts/ganache) - Simulator for development and testing purposes of the execution layer
- [`genesis-cl`](charts/genesis-cl) - A tool to generate and expose genesis files for the consensus layer clients. Useful for testnets

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
