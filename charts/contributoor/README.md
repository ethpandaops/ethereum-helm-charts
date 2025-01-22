
# contributoor

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A lightweight sidecar that runs alongside an Ethereum consensus client and collects data.

**Homepage:** <https://github.com/ethpandaops/contributoor>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| config.beaconNodeAddress | string | `"http://localhost:5052"` |  |
| config.contributoorDirectory | string | `"/config/.contributoor"` |  |
| config.healthCheckAddress | string | `":9191"` |  |
| config.logLevel | string | `"info"` |  |
| config.metricsAddress | string | `":9090"` |  |
| config.networkName | string | `"NETWORK_NAME_MAINNET"` |  |
| config.outputServer.address | string | `"xatu.primary.production.platform.ethpandaops.io:443"` |  |
| config.outputServer.credentials | string | `"Someb64Value"` |  |
| config.outputServer.tls | bool | `true` |  |
| config.runMethod | string | `"RUN_METHOD_DOCKER"` |  |
| config.version | string | `"0.0.49"` |  |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `["--config=/config/config.yaml"]` | Custom args for the contributoor container These are optional, and will be passed to the contributoor container, overriding the values set in 'config'. |
| customCommand | list | `[]` | Command replacement for the contributoor container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | contributoor container pull policy |
| image.repository | string | `"ethpandaops/contributoor"` | contributoor container image repository |
| image.tag | string | `"latest"` | contributoor container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| initContainers | list | `[]` | Additional init containers |
| lifecycle | object | See `values.yaml` | Lifecycle hooks |
| livenessProbe | object | `{"httpGet":{"path":"/healthz","port":9191},"initialDelaySeconds":60,"periodSeconds":120}` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | `{"httpGet":{"path":"/healthz","port":9191},"initialDelaySeconds":10,"periodSeconds":10}` | Readiness probe |
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
