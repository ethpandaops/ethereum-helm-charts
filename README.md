# Ethereum Helm Charts

A set of [Helm](https://helm.sh/) charts to run multiple components of the [Ethereum](https://ethereum.org/) blockchain on [Kubernetes](https://kubernetes.io/).

> **Important**: These charts are currently still under heavy development and the chart versions won't be increased during this initial phase.

## List of charts

- [`lighthouse`](charts/lighthouse) - An open-source Ethereum 2.0 client, written in Rust

## Development

### Pre-commit hooks

This repository used [`pre-commit`](https://pre-commit.com/) to manage and run certain git hooks. Hook definitions can be found within the [`.pre-commit-config.yaml`](.pre-commit-config.yaml) file.

Run the following to add the hooks to your local repository:

```sh
$ pre-commit install
```


### Useful commands

The `README` for every chart is auto generated using [helm-docs](https://github.com/norwoodj/helm-docs). This is defined as a pre-commit hook. If you want to run it manually, you can quickly use docker:

```sh
docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:v1.5.0
```

The [CT (Chart Testing)](https://github.com/helm/chart-testing) tool is used to lint and validate charts. You can run this locally using docker:

```sh
docker run --rm --workdir /workdir --volume "$(pwd):/workdir" quay.io/helmpack/chart-testing:v3.4.0 ct lint
```

## License

[MIT License](LICENSE)
