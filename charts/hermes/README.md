
# hermes

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A GossipSub listener and tracer, subscribing to all relevant pubsub topics and traces all protocol interactions.

**Homepage:** <https://github.com/ethpandaops/hermes>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| config.ethereum.chain | string | `"mainnet"` | Ethereum chain (mainnet, holesky, etc.) |
| config.ethereum.devp2p | object | `{"host":"0.0.0.0"}` | Which address devp2p (discv5) should bind to. |
| config.ethereum.libp2p | object | `{"host":"0.0.0.0"}` | Which address libp2p (discv5) should bind to. |
| config.ethereum.prysm | object | `{"host":"127.0.0.1","ports":{"grpc":4000,"http":5052},"trusted":true}` | Prysm host |
| config.ethereum.prysm.trusted | bool | `true` | If Prysm node is running on the same machine (localhost). |
| config.metrics.addr | string | `"0.0.0.0"` | Metrics host |
| config.metrics.port | int | `6060` | Metrics port |
| config.stream.kinesis | object | `{"enabled":false,"region":"","stream":""}` | Kinesis configuration |
| config.stream.s3 | object | `{"bucket":"","byteLimit":"25000000","enabled":true,"endpoint":"","flushInterval":"40s","flushers":12,"region":"","tag":""}` | S3 configuration |
| config.stream.type | string | `"s3"` | Stream type (kinesis, s3, callback, logger) |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the hermes container |
| customCommand | list | `[]` | Command replacement for the hermes container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | hermes container pull policy |
| image.repository | string | `"ethpandaops/hermes"` | hermes container image repository |
| image.tag | string | `"latest"` | hermes container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| lifecycle | object | See `values.yaml` | Lifecycle hooks |
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
| secrets | object | `{"s3AccessKeyId":"","s3AccessSecretKey":""}` | Secrets configuration |
| secrets.s3AccessKeyId | string | `""` | S3 access key ID (required if using S3) |
| secrets.s3AccessSecretKey | string | `""` | S3 secret access key (required if using S3) |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"15s"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| terminationGracePeriodSeconds | int | `90` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
