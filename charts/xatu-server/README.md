
# xatu-server

![Version: 0.0.12](https://img.shields.io/badge/Version-0.0.12-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Ethereum p2p monitoring tool that collects events from and controls various Xatu clients.

**Homepage:** <https://github.com/ethpandaops/xatu>

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
| config.addr | string | `":8080"` |  |
| config.geoip.enabled | bool | `false` |  |
| config.logging | string | `"info"` |  |
| config.metricsAddr | string | `":9090"` |  |
| config.ntpServer | string | `"time.google.com"` |  |
| config.persistence.enabled | bool | `false` |  |
| config.services.coordinator.enabled | bool | `false` |  |
| config.services.coordinator.nodeRecord.batchTimeout | string | `"5s"` |  |
| config.services.coordinator.nodeRecord.exportTimeout | string | `"30s"` |  |
| config.services.coordinator.nodeRecord.maxExportBatchSize | int | `512` |  |
| config.services.coordinator.nodeRecord.maxQueueSize | int | `51200` |  |
| config.services.eventIngester.enabled | bool | `true` |  |
| config.services.eventIngester.outputs[0].config.address | string | `"http://localhost:8080"` |  |
| config.services.eventIngester.outputs[0].config.batchTimeout | string | `"5s"` |  |
| config.services.eventIngester.outputs[0].config.exportTimeout | string | `"30s"` |  |
| config.services.eventIngester.outputs[0].config.headers.authorization | string | `"Someb64Value"` |  |
| config.services.eventIngester.outputs[0].config.maxExportBatchSize | int | `512` |  |
| config.services.eventIngester.outputs[0].config.maxQueueSize | int | `51200` |  |
| config.services.eventIngester.outputs[0].name | string | `"basic"` |  |
| config.services.eventIngester.outputs[0].type | string | `"http"` |  |
| config.store.type | string | `"memory"` |  |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the xatu container |
| customCommand | list | `[]` | Command replacement for the xatu container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | xatu container pull policy |
| image.repository | string | `"ethpandaops/xatu"` | xatu container image repository |
| image.tag | string | `"latest"` | xatu container image tag |
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
| strategy | object | `{"rollingUpdate":{"maxSurge":"25%","maxUnavailable":"25%"},"type":"RollingUpdate"}` | Deployment rollout strategy |
| terminationGracePeriodSeconds | int | `90` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
