# Ethereum Helm Charts

A set of [Helm](https://helm.sh/) charts to run multiple components of the [Ethereum](https://ethereum.org/) blockchain on [Kubernetes](https://kubernetes.io/).

## How to use

Add the repository to helm:

```sh
helm repo add skylenet https://skylenet.github.io/ethereum-helm-charts
```

Check the available charts:

```sh
helm search repo skylenet
```

Fetch the most recent version via:

```sh
helm repo update skylenet
```

## More infos

You can find the source code for all charts under [github.com/skylenet/ethereum-helm-charts](https://github.com/skylenet/ethereum-helm-charts/).
