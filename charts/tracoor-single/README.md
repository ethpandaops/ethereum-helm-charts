
# tracoor-single

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Ethereum debug data capture and indexer

**Homepage:** <https://github.com/ethpandaops/tracoor>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| autoscaling.enabled | bool | `false` | Autoscaling configuration |
| autoscaling.maxReplicas | int | `3` | Maximum number of replicas |
| autoscaling.minReplicas | int | `2` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `85` | Target CPU utilization percentage |
| config.agents[0].ethereum.beacon.nodeAddress | string | `"http://localhost:5052"` |  |
| config.agents[0].ethereum.execution.nodeAddress | string | `"http://localhost:8545"` |  |
| config.agents[0].ethereum.execution.traceDisableMemory | bool | `true` |  |
| config.agents[0].ethereum.execution.traceDisableStack | bool | `true` |  |
| config.agents[0].ethereum.execution.traceDisableStorage | bool | `true` |  |
| config.agents[0].ethereum.overrideNetworkName | string | `"mainnet"` |  |
| config.agents[0].name | string | `"instance-1"` |  |
| config.server.addr | string | `":8081"` |  |
| config.server.gatewayAddr | string | `":8080"` |  |
| config.server.ntpServer | string | `"time.google.com"` |  |
| config.server.persistence.driver_name | string | `"sqlite"` |  |
| config.server.persistence.dsn | string | `"file:/tmp/tracoor.db"` |  |
| config.server.pprofAddr | string | `":6060"` |  |
| config.server.preStopSleepSeconds | int | `1` |  |
| config.server.services.indexer.retention.beaconBlocks | string | `"30m"` |  |
| config.server.services.indexer.retention.beaconStates | string | `"30m"` |  |
| config.server.services.indexer.retention.executionBlockTraces | string | `"30m"` |  |
| config.shared.indexer.address | string | `"localhost:8081"` |  |
| config.shared.logging | string | `"debug"` |  |
| config.shared.metricsAddr | string | `":9091"` |  |
| config.shared.store.config.base_path | string | `"/tmp/tracoor"` |  |
| config.shared.store.type | string | `"fs"` |  |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the tracoor container |
| customCommand | list | `[]` | Command replacement for the tracoor container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | tracoor container pull policy |
| image.repository | string | `"ethpandaops/tracoor"` | tracoor container image repository |
| image.tag | string | `"latest"` | tracoor container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.grpc.annotations | object | `{}` | Annotations for Ingress |
| ingress.grpc.enabled | bool | `false` | Ingress resource for GRPC |
| ingress.grpc.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.grpc.hosts[0].paths | list | `[]` |  |
| ingress.grpc.tls | list | `[]` | Ingress TLS |
| ingress.http.annotations | object | `{}` | Annotations for Ingress |
| ingress.http.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.http.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.http.hosts[0].paths | list | `[]` |  |
| ingress.http.tls | list | `[]` | Ingress TLS |
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
