# observoor

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

An eBPF-based kernel-level monitoring agent for Ethereum consensus and execution clients.

**Homepage:** <https://github.com/ethpandaops/observoor>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| samcm | sam.calder-mason@ethereum.org |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| args | list | `[]` | Command arguments |
| config.beacon | object | `{"endpoint":"http://localhost:5052","timeout":"10s"}` | Beacon node configuration |
| config.beacon.endpoint | string | `"http://localhost:5052"` | Beacon node HTTP API endpoint |
| config.beacon.timeout | string | `"10s"` | HTTP request timeout |
| config.healthAddr | string | `":9090"` | Prometheus metrics server address |
| config.logLevel | string | `"info"` | Log level (debug, info, warn, error) |
| config.metaClientName | string | `""` | Metadata for exported data (used in ClickHouse meta_* columns) |
| config.metaNetworkName | string | `""` | Network name metadata |
| config.pid | object | `{"processNames":[]}` | Process discovery configuration |
| config.pid.processNames | list | `[]` | Discover processes by name (scans /proc) If empty, defaults to all known Ethereum client names |
| config.ringBufferSize | int | `4194304` | BPF ring buffer size in bytes (default 4MB) |
| config.sinks | object | `{"aggregated":{"clickhouse":{"batchSize":10000,"database":"observoor","endpoint":"clickhouse:9000","flushInterval":"1s"},"dimensions":{"disk":{"includeDevice":true,"includeRw":true},"network":{"includeDirection":true,"includePort":true}},"enabled":true,"resolution":{"interval":"50ms","slotAligned":true,"syncStatePollInterval":"12s"}},"raw":{"clickhouse":{"batchSize":10000,"database":"observoor","endpoint":"clickhouse:9000","flushInterval":"1s","password":"","table":"raw_events","username":""},"enabled":false,"includeFilenames":true}}` | Data export sinks configuration |
| config.sinks.aggregated | object | `{"clickhouse":{"batchSize":10000,"database":"observoor","endpoint":"clickhouse:9000","flushInterval":"1s"},"dimensions":{"disk":{"includeDevice":true,"includeRw":true},"network":{"includeDirection":true,"includePort":true}},"enabled":true,"resolution":{"interval":"50ms","slotAligned":true,"syncStatePollInterval":"12s"}}` | Aggregated metrics sink - configurable resolution aggregation |
| config.sinks.aggregated.dimensions.disk.includeDevice | bool | `true` | Include device ID in disk metrics |
| config.sinks.aggregated.dimensions.disk.includeRw | bool | `true` | Include read/write breakdown in disk metrics |
| config.sinks.aggregated.dimensions.network.includeDirection | bool | `true` | Include TX/RX direction in network metrics |
| config.sinks.aggregated.dimensions.network.includePort | bool | `true` | Include local port in network metrics |
| config.sinks.aggregated.resolution.interval | string | `"50ms"` | Aggregation window duration (50ms, 100ms, 500ms, 1s, 5s, 1m) |
| config.sinks.aggregated.resolution.slotAligned | bool | `true` | Reset aggregation at slot boundaries |
| config.sinks.aggregated.resolution.syncStatePollInterval | string | `"12s"` | How often to write sync state |
| config.sinks.raw | object | `{"clickhouse":{"batchSize":10000,"database":"observoor","endpoint":"clickhouse:9000","flushInterval":"1s","password":"","table":"raw_events","username":""},"enabled":false,"includeFilenames":true}` | Raw events sink - writes every event to ClickHouse Warning: High cardinality, requires ClickHouse setup |
| config.syncPollInterval | string | `"30s"` | Beacon sync status polling frequency |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the observoor container |
| customCommand | list | `[]` | Command replacement for the observoor container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | observoor container pull policy |
| image.repository | string | `"ethpandaops/observoor"` | observoor container image repository |
| image.tag | string | `"master"` | observoor container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| initContainers | list | `[]` | Additional init containers |
| lifecycle | object | See `values.yaml` | Lifecycle hooks |
| livenessProbe | object | `{"httpGet":{"path":"/healthz","port":"http"},"initialDelaySeconds":60,"periodSeconds":120}` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | `{"httpGet":{"path":"/healthz","port":"http"},"initialDelaySeconds":10,"periodSeconds":10}` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{"limits":{"cpu":"500m","memory":"512Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Resource requests and limits |
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
