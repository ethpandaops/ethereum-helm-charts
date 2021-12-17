
# rpc-proxy

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A proxy for web3 JSONRPC

**Homepage:** <https://github.com/gochain/rpc-proxy>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `["--url=http://upstream-node:8545","--wsurl=http://upstream-node:8546","--rpm=1000"]` | Command arguments |
| config | string | `"Allow = [\n  \"clique_getSigners\",\n  \"clique_getSignersAtHash\",\n  \"clique_getSnapshot\",\n  \"clique_getSnapshotAtHash\",\n  \"clique_getVoters\",\n  \"clique_getVotersAtHash\",\n  \"eth_blockNumber\",\n  \"eth_call\",\n  \"eth_chainId\",\n  \"eth_estimateGas\",\n  \"eth_gasPrice\",\n  \"eth_genesisAlloc\",\n  \"eth_getBalance\",\n  \"eth_getBlockByHash\",\n  \"eth_getBlockByNumber\",\n  \"eth_getBlockTransactionCountByHash\",\n  \"eth_getBlockTransactionCountByNumber\",\n  \"eth_getCode\",\n  \"eth_getFilterChanges\",\n  \"eth_getLogs\",\n  \"eth_getStorageAt\",\n  \"eth_getTransactionByBlockHashAndIndex\",\n  \"eth_getTransactionByBlockNumberAndIndex\",\n  \"eth_getTransactionByHash\",\n  \"eth_getTransactionCount\",\n  \"eth_getTransactionReceipt\",\n  \"eth_newBlockFilter\",\n  \"eth_newPendingTransactionFilter\",\n  \"eth_sendRawTransaction\",\n  \"eth_subscribe\",\n  \"eth_totalSupply\",\n  \"eth_uninstallFilter\",\n  \"eth_unsubscribe\",\n  \"net_listening\",\n  \"net_version\",\n  \"rpc_modules\",\n  \"web3_clientVersion\",\n]\n"` |  |
| customArgs | list | `[]` | Custom args for the rpc-proxy container |
| customCommand | list | `[]` | Command replacement for the rpc-proxy container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | rpc-proxy container pull policy |
| image.repository | string | `"ghcr.io/gochain/rpc-proxy/rpc-proxy"` | rpc-proxy container image repository |
| image.tag | string | `"latest"` | rpc-proxy container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{}` | Secret env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |

# Examples

## Defining the upstream node

```yaml
args:
  - --url=http://upstream-node:8545
  - --wsurl=http://upstream-node:8546
```
