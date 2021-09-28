# Example using Kubernetes on Digitalocean

## Creating your Kubernetes cluster

### Prerequisites

- [`terraform`](https://www.terraform.io/)
- [`doctl`](https://github.com/digitalocean/doctl)
- [`kubectl`](https://kubernetes.io/docs/tasks/tools/#kubectl)

The terraform directory contains an example on how to create a Kubernetes cluster on Digitalocean.

```sh
# Move to terraform dir
$ cd terraform

# Initialize terraform
$ terraform init

# See what's going to happen
$ terraform plan

# If all looks good, apply changes to create your cluster
$ terraform apply
```

Once the stack is created you can obtain your `~/.kube` config file by using the `doctl` cli.

```sh
# Initialize authentication
$ doctl auth init

# List available clusters
$ doctl kubernetes cluster list

# Save your connection iformation to ~/.kube/config
$ doctl kubernetes cluster kubeconfig save <CLUSTER_ID>

# Check that it works
$ kubectl get nodes
```

## Using helmsman to deploy multiple helm charts

### Prerequisites

- [`helm`](https://helm.sh/)
- [`helmsman`](https://github.com/Praqma/helmsman)
- [`helm-diff`](https://github.com/databus23/helm-diff)

The helmsman directory contains an example on how to deploy the helm charts using helmsman.

```sh
# Install shared services (e.g. Kube Prometheus Stack)
helmsman -f shared-services.yaml --apply

# Install the charts defined in ethereum.yaml
# Note: You should check the file before applying it and adjust values to your requirements
helmsman -f ethereum.yaml --apply
```


## Cleanup

Destroy the whole kubernetes cluster

```sh
# Destroy all terraform resources
cd terraform && terraform destroy
```
