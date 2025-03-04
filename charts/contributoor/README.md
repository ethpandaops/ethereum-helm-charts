
# contributoor

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A lightweight sidecar that runs alongside an Ethereum consensus client and collects data.

**Homepage:** <https://github.com/ethpandaops/contributoor>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| beaconNode | object | `{"address":"http://localhost:5052"}` | Beacon node configuration |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| credentials | object | `{"password":"FILL_ME","username":"FILL_ME"}` | Credentials configuration |
| customArgs | list | `[]` | Custom args for the contributoor container |
| customCommand | list | `[]` | Command replacement for the contributoor container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| healthCheck.enabled | bool | `true` |  |
| healthCheck.port | int | `9191` |  |
| image.pullPolicy | string | `"IfNotPresent"` | contributoor container pull policy |
| image.repository | string | `"ethpandaops/contributoor"` | contributoor container image repository |
| image.tag | string | `"latest"` | contributoor container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| initContainers | list | `[]` | Additional init containers |
| lifecycle | object | See `values.yaml` | Lifecycle hooks |
| livenessProbe | object | `{"httpGet":{"path":"/healthz","port":"health"},"initialDelaySeconds":60,"periodSeconds":120}` | Liveness probe |
| logLevel | string | `"info"` | Log level |
| metrics.enabled | bool | `true` |  |
| metrics.port | int | `9090` |  |
| nameOverride | string | `""` | Overrides the chart's name |
| network | string | `"mainnet"` | Network name (mainnet, holesky, sepolia) |
| nodeSelector | object | `{}` | Node selector for pods |
| outputServer | object | `{"address":"xatu.primary.production.platform.ethpandaops.io:443","tls":true}` | Output server configuration to send the data to |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | `{"httpGet":{"path":"/healthz","port":"health"},"initialDelaySeconds":10,"periodSeconds":10}` | Readiness probe |
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
