
# forkmon

![Version: 0.1.6](https://img.shields.io/badge/Version-0.1.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

This is a little tool to keep track on a set of nodes, and see if they keep in step or if they go out of consensus.

**Homepage:** <https://github.com/ethereum/nodemonitor>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| config | string | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Command replacement for the forkmon container |
| endpoints | list | `[{"addr":"http://execution-client:8545","kind":"rpc","name":"execution-client-name"}]` | Endpoints that you would like to monitor |
| extraArgs | list | `[]` | Extra args for the forkmon container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8080` |  |
| image.pullPolicy | string | `"IfNotPresent"` | forkmon container pull policy |
| image.repository | string | `"holiman/nodemonitor"` | forkmon container image repository |
| image.tag | string | `"latest"` | forkmon container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| network | string | `""` | Set a network name such as mainnet, holesky, sepolia |
| nodeSelector | object | `{}` | Node selector for pods |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"1Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{}` | Additional env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| thirdparty_endpoints | list | `[{"kind":"infura","name":"mainnet-infura","rate_limit":5},{"kind":"alchemy","name":"mainnet-alchemy","rate_limit":5},{"kind":"etherscan","name":"mainnet-etherscan","rate_limit":5}]` | Third party endpoints that you would like to monitor |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type |

# Examples

## Setting the configuration file

```toml
config.toml:
    # How often to reload data from the nodes
    reload_interval = "10s"
    # If specified, a http server will serve static content here
    server_address = "0.0.0.0:8080"

    # Shown in the document title, if specified
    chain_name="<NETWORK_NAME>"

    # Third party providers
    infura_key          = "<INFURA_API_KEY>"
    infura_endpoint     = "https://mainnet.infura.io/v3/"
    alchemy_key         = "<ALCHEMY_API_KEY>"
    alchemy_endpoint    = "https://eth-mainnet.g.alchemy.com/v2/"
    etherscan_key       = "<ETHERSCAN_API_KEY>"
    etherscan_endpoint  = "https://api.etherscan.io/api"

    [Metrics]

    enabled = true
    endpoint = "<INFLUX_ENDPOINT>"
    username = "<INFLUX_USERNAME>"
    database  = "<INFLUX_DB_NAME>"
    password  = "<INFLUX_PASSWORD>"

    # Local or non third party connection require rpc kind
    [[clients]]
      name = "<execution-client-name>"
      kind ="rpc"
      url  = "http://<execution-client>:<execution-client-port>"

    # Third party client configuration doesn't require url
    # Kind can vary between infura, alchemy or etherscan
    # Recommended to enable rate limit for third party services
    [[clients]]
      name = infura|alchemy|etcherscan
      kind = infura|alchemy|etherscan
      rate_limit = 5
```
