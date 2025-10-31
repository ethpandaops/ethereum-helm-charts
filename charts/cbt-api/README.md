
# cbt-api

![Version: 0.0.14](https://img.shields.io/badge/Version-0.0.14-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

API server for CBT

**Homepage:** <https://github.com/ethpandaops/cbt-api>

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
| config.api.base_path | string | `"/api/v1"` |  |
| config.api.expose_prefixes[0] | string | `"fct"` |  |
| config.clickhouse.conn_max_lifetime | string | `"60s"` |  |
| config.clickhouse.database | string | `"mainnet"` |  |
| config.clickhouse.dial_timeout | string | `"10s"` |  |
| config.clickhouse.discovery.exclude | string | `nil` |  |
| config.clickhouse.discovery.prefixes[0] | string | `"fct"` |  |
| config.clickhouse.dsn | string | `"https://user:pass@host"` |  |
| config.clickhouse.insecure_skip_verify | bool | `false` |  |
| config.clickhouse.max_execution_time | int | `60` |  |
| config.clickhouse.max_idle_conns | int | `5` |  |
| config.clickhouse.max_open_conns | int | `10` |  |
| config.clickhouse.read_timeout | string | `"30s"` |  |
| config.clickhouse.use_final | bool | `true` |  |
| config.clickhouse.write_timeout | string | `"30s"` |  |
| config.headers.policies | list | `[]` |  |
| config.proto.go_package | string | `"github.com/ethpandaops/cbt-api/pkg/proto/clickhouse"` |  |
| config.proto.include_comments | bool | `true` |  |
| config.proto.output_dir | string | `"./pkg/proto/clickhouse"` |  |
| config.proto.package | string | `"cbt.v1"` |  |
| config.server.host | string | `"0.0.0.0"` |  |
| config.server.idle_timeout | string | `"120s"` |  |
| config.server.port | int | `8080` |  |
| config.server.read_header_timeout | string | `"10s"` |  |
| config.server.read_timeout | string | `"30s"` |  |
| config.server.write_timeout | string | `"30s"` |  |
| config.telemetry.always_sample_errors | bool | `true` |  |
| config.telemetry.enabled | bool | `false` |  |
| config.telemetry.endpoint | string | `"tempo.example.com:443"` |  |
| config.telemetry.environment | string | `"mainnet"` |  |
| config.telemetry.export_batch_size | int | `512` |  |
| config.telemetry.export_timeout | string | `"10s"` |  |
| config.telemetry.insecure | bool | `false` |  |
| config.telemetry.sample_rate | float | `0.1` |  |
| config.telemetry.service_name | string | `"cbt-api"` |  |
| config.telemetry.service_version | string | `"1.0.0"` |  |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the cbt-api container |
| customCommand | list | `[]` | Command replacement for the cbt-api container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | cbt-api container pull policy |
| image.repository | string | `"ethpandaops/cbt-api"` | cbt-api container image repository |
| image.tag | string | `"latest"` | cbt-api container image tag |
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
