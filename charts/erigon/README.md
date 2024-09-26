
# erigon

![Version: 1.0.10](https://img.shields.io/badge/Version-1.0.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Erigon, formerly known as Turbo‐Geth, is a fork of Go Ethereum (geth) oriented toward speed and disk‐space efficiency. Erigon is a completely re-architected implementation of Ethereum, currently written in Go but with implementations in other languages planned. Erigon's goal is to provide a faster, more modular, and more optimized implementation of Ethereum.

**Homepage:** <https://twitter.com/ErigonEth>

## Source Code

* <https://github.com/ledgerwatch/erigon>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| authPort | int | `8551` | Engine Port (Auth Port) |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Legacy way of overwriting the default command. You may prefer to change defaultCommandTemplate instead. |
| customCommandRPCDaemon | list | `[]` | Legacy way of overwriting the default command. You may prefer to change defaultCommandRPCDaemonTemplate instead. |
| defaultCommandRPCDaemonTemplate | string | See `values.yaml` | Template used for the default command |
| defaultCommandTemplate | string | See `values.yaml` | Template used for the default command |
| extraArgs | list | `[]` | Extra args for the erigon container |
| extraArgsRPCDaemon | list | `[]` | Extra args for the rpcdaemon container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables for erigon container |
| extraEnvRPCDaemon | list | `[]` | Additional env variables for RPCDaemon container |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8545` | HTTP Port |
| image.pullPolicy | string | `"IfNotPresent"` | erigon container pull policy |
| image.repository | string | `"thorax/erigon"` | erigon container image repository |
| image.tag | string | `"devel"` | erigon container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initChownData.enabled | bool | `true` | Init container to set the correct permissions to access data directories |
| initChownData.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| initChownData.image.repository | string | `"busybox"` | Container repository |
| initChownData.image.tag | string | `"1.34.0"` | Container tag |
| initChownData.resources | object | `{}` | Resource requests and limits |
| initContainers | list | `[]` | Additional init containers |
| jwt | string | `"ecb22bc24e7d4061f7ed690ccd5846d7d73f5d2b9733267e12f56790398d908a"` | JWT secret used by client as a secret. Change this value. |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| livenessProbeRPCDaemon | object | See `values.yaml` | Liveness probe |
| metricsPort | int | `6060` | Metrics Port |
| metricsPortRPCDaemon | int | `6061` | RPC Daemon Port |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| p2pNodePort.enabled | bool | `false` | Expose P2P port via NodePort |
| p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| p2pNodePort.initContainer.image.repository | string | `"lachlanevenson/k8s-kubectl"` | Container image to fetch nodeport information |
| p2pNodePort.initContainer.image.tag | string | `"v1.25.4"` | Container tag |
| p2pNodePort.port | int | `31000` | NodePort to be used |
| p2pNodePort.portForwardContainer.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| p2pNodePort.portForwardContainer.image.repository | string | `"alpine/socat"` | Container image for the port forwarder |
| p2pNodePort.portForwardContainer.image.tag | string | `"latest"` | Container tag |
| p2pPort | int | `30303` | P2P Port |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"20Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy |
| priorityClassName | string | `nil` | Pod priority class |
| rbac.clusterRules | list | See `values.yaml` | Required ClusterRole rules |
| rbac.create | bool | `true` | Specifies whether RBAC resources are to be created |
| rbac.rules | list | See `values.yaml` | Required ClusterRole rules |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| readinessProbeRPCDaemon | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits for the erigon container |
| resourcesRPCDaemon | object | `{}` | Resource requests and limits for the RPC daemon container |
| secretEnv | object | `{}` | Additional env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"1m"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/debug/metrics/prometheus"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| terminationGracePeriodSeconds | int | `300` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update stategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update stategy type |

# Examples

## Connecting to the holesky test network

```yaml
extraArgs:
  - --chain=holesky
  - --maxpeers=60
```

## Exposing the P2P service via NodePort

This will make your node accessible via the Internet using a service of type [NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport).
When using `p2pNodePort.enabled` the exposed IP address on your ENR record will be the "External IP" of the node where the pod is running.

**Limitations:** You can only run a single replica per chart deployment when using `p2pNodePort.enabled=true`.If you need N nodes, simply deploy the chart N times.
Currently erigon doesn't allow you to announce a a different discovery port, which would be a requirement to run multiple replicas within the same chart.

```yaml
replicas: 1

p2pNodePort:
  enabled: true
  port: 31000
```

## Exposing more APIs via the RPC Daemon

```yaml
extraArgsRPCDaemon:
  - --http.corsdomain=yourdomain.tld
  - --http.api=eth,erigon,web3,net,debug,trace,txpool,db
```
