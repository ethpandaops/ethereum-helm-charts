
# armiarma

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A distributed p2p network monitoring tool

**Homepage:** <https://github.com/migalabs/armiarma>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 13.2.23 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `["--log-level=${CRAWLER_LOG_LEVEL}","--psql-endpoint=${CRAWLER_PSQL_ENDP}","--peers-backup=${CRAWLER_PEERS_BACKUP}","--fork-digest=${CRAWLER_FORK_DIGEST}","--gossip-topic=${CRAWLER_GOSSIP_TOPIC}","--subnet=${CRAWLER_SUBNET}","--persist-connevents=${CRAWLER_PERSIST_CONNEVENTS}"]` | Custom args for the armiarma container |
| customCommand | list | `["eth2"]` | Command replacement for the armiarma container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| global | object | `{"postgresql":{"auth":{"database":"armiarmadb","password":"armiarma","user":"armiarma"}}}` | Global values |
| image.pullPolicy | string | `"IfNotPresent"` | armiarma container pull policy |
| image.repository | string | `"migalabs/armiarma"` | armiarma container image repository |
| image.tag | string | `"latest"` | armiarma container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for exposing the SSE port |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| metricsPort | int | `9080` | Metrics port |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| p2pNodePort.enabled | bool | `false` | Expose P2P port via NodePort |
| p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| p2pNodePort.initContainer.image.repository | string | `"lachlanevenson/k8s-kubectl"` | Container image to fetch nodeport information |
| p2pNodePort.initContainer.image.tag | string | `"v1.21.3"` | Container tag |
| p2pNodePort.port | int | `31000` | NodePort to be used |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy |
| postgresql | object | `{"image":{"repository":"bitnami/postgresql","tag":"14-debian-11"},"nameOverride":"armiarma-postgresql"}` | Postgresql subchart configuration |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{"CRAWLER_FORK_DIGEST":"0x4a26c58b","CRAWLER_GOSSIP_TOPIC":"beacon_block","CRAWLER_LOG_LEVEL":"info","CRAWLER_PEERS_BACKUP":"12h","CRAWLER_PERSIST_CONNEVENTS":"false\"","CRAWLER_PSQL_ENDP":"postgres://{{ $.Values.global.postgresql.auth.user }}:{{ $.Values.global.postgresql.auth.password }}@{{ include \"armiarma.fullname\" $ }}-postgresql:5432/{{ $.Values.global.postgresql.auth.database }}","CRAWLER_SUBNET":"all"}` | Env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| ssePort | int | `9099` | SSE port |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update stategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update stategy type |
