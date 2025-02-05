
# dora

![Version: 0.0.7](https://img.shields.io/badge/Version-0.0.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Beaconchain explorer is a tool that allows users to view and interact with the data on the Ethereum Beacon Chain. It is similar to a blockchain explorer, which allows users to view data on a blockchain such as the current state of transactions and blocks - but focussed on exploring the beaconchain.

**Homepage:** <https://github.com/pk910/dora>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| callRateBurst | int | `10` | Page call burst limit per user |
| callRateLimit | int | `2` | Page call limit per second per user |
| config | string | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Command replacement for the dora container |
| endpoints | list | `[{"archive":false,"headers":{"X-Test":"test","Y-Test":"test2"},"name":"default-endpoint","priority":1,"url":"http://beacon-node:5052"}]` | An array of endpoints to use for the explorer -- url is the only required field |
| ethExplorerLink | string | `""` | Link to the el block explorer |
| executionEndpoints | list | `[]` | An array of execution endpoints to use for the explorer -- url is the only required field |
| extraArgs | list | `[]` | Extra args for the dora container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8080` |  |
| image.pullPolicy | string | `"Always"` | dora container pull policy |
| image.repository | string | `"ethpandaops/dora"` | dora container image repository |
| image.tag | string | `"master"` | dora container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| maxInMemoryEpochs | int | `4` | Maximum number of epochs to keep in memory |
| mevRelays | list | `[]` | An array of mev relays to crawl mev data from (optional) -- index must be a unique id for the relay (0-62) -- {} |
| name | string | `"mainnet"` | Name of the network ("mainnet", "sepolia", "holesky") |
| nameOverride | string | `""` | Overrides the chart's name |
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
| postgresql.auth.database | string | `"dora"` |  |
| postgresql.auth.enablePostgresUser | bool | `true` |  |
| postgresql.auth.password | string | `"postgres"` |  |
| postgresql.auth.postgresPassword | string | `"postgres"` |  |
| postgresql.auth.username | string | `"postgres"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.image.registry | string | `"docker.io"` |  |
| postgresql.image.repository | string | `"bitnami/postgresql"` |  |
| postgresql.image.tag | string | `"15.3.0-debian-11-r7"` |  |
| postgresql.name | string | `"{{ .Release.Name }}-postgresql"` | If enabled a postgres chart will be deployed as a dependency |
| postgresql.persistence.enabled | bool | `true` |  |
| postgresql.persistence.size | string | `"8Gi"` |  |
| postgresql.primary.extendedConfiguration | string | `"max_connections = 1024\n"` |  |
| postgresql.pullPolicy | string | `"IfNotPresent"` |  |
| priorityClassName | string | `nil` | Pod priority class |
| proxyCount | int | `1` | Number of proxy servers in front of the explorer |
| ranges | string | `"0-1: test\n"` |  |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{}` | Additional env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"1m"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type |
| validatorNamesInventory | string | `""` | This can be a url here for example: -- "https://config.dencun-devnet-8.ethpandaops.io/api/v1/nodes/validator-ranges" -- If you want to use a local range file define it in the values.yaml ranges section |

# Example

Usage: dora-explorer -config config.yaml

Helper:
```shell
Usage of ./dora-explorer:
-config string
    Path to the config file, if empty string defaults will be used
```

In order to name validators based on ranges the following file format can be provided YAML:
```yaml
0-500: validator_set_A
500-1000: validator_set_B
1000-1500: validator_set_C
...
```

More details can be found [here](https://github.com/pk910/dora).
