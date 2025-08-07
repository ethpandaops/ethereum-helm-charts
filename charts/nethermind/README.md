
# nethermind

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Nethermind is an Ethereum execution layer implementation created with the C# .NET tech stack, running on all major platforms including ARM.

**Homepage:** <https://nethermind.io/>

## Source Code

* <https://github.com/NethermindEth/nethermind>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| authPort | int | `8551` | Engine Port (Auth Port) |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Legacy way of overwriting the default command. You may prefer to change defaultCommandTemplate instead. |
| defaultCommandTemplate | string | See `values.yaml` | Template used for the default command |
| devnet | object | `{"baseUrl":"https://raw.githubusercontent.com/ethpandaops/fusaka-devnets/master/network-configs","enabled":false,"initContainer":[{"command":["sh","-ac","mkdir -p /data/devnet_config;\nif [ ! -f /data/devnet_config/genesis.json ]; then\n  echo \"Downloading devnet configuration files...\";\n\n  # Download genesis.json for execution layer\n  echo \"Downloading genesis.json from {{ tpl .Values.devnet.urls.genesisJson . }}\"\n  wget -O /data/devnet_config/genesis.json \"{{ tpl .Values.devnet.urls.genesisJson . }}\"\n\n  # Download execution layer bootnodes\n  echo \"Downloading enodes.txt from {{ tpl .Values.devnet.urls.elBootnode . }}\"\n  wget -O /data/devnet_config/enodes.txt \"{{ tpl .Values.devnet.urls.elBootnode . }}\"\n\n  echo \"Devnet configuration download complete.\";\nelse\n  echo \"Genesis file already exists, skipping download.\";\nfi\n"],"image":"alpine:latest","imagePullPolicy":"IfNotPresent","name":"download-devnet-config","securityContext":{"runAsNonRoot":false,"runAsUser":0},"volumeMounts":[{"mountPath":"/data","name":"storage"}]}],"name":"devnet-3","urls":{"elBootnode":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/enodes.txt","genesisJson":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/genesis.json"}}` | Devnet configuration |
| devnet.baseUrl | string | `"https://raw.githubusercontent.com/ethpandaops/fusaka-devnets/master/network-configs"` | Base URL for devnet configuration files |
| devnet.enabled | bool | `false` | Enable devnet mode |
| devnet.initContainer | list | `[{"command":["sh","-ac","mkdir -p /data/devnet_config;\nif [ ! -f /data/devnet_config/genesis.json ]; then\n  echo \"Downloading devnet configuration files...\";\n\n  # Download genesis.json for execution layer\n  echo \"Downloading genesis.json from {{ tpl .Values.devnet.urls.genesisJson . }}\"\n  wget -O /data/devnet_config/genesis.json \"{{ tpl .Values.devnet.urls.genesisJson . }}\"\n\n  # Download execution layer bootnodes\n  echo \"Downloading enodes.txt from {{ tpl .Values.devnet.urls.elBootnode . }}\"\n  wget -O /data/devnet_config/enodes.txt \"{{ tpl .Values.devnet.urls.elBootnode . }}\"\n\n  echo \"Devnet configuration download complete.\";\nelse\n  echo \"Genesis file already exists, skipping download.\";\nfi\n"],"image":"alpine:latest","imagePullPolicy":"IfNotPresent","name":"download-devnet-config","securityContext":{"runAsNonRoot":false,"runAsUser":0},"volumeMounts":[{"mountPath":"/data","name":"storage"}]}]` | Init container configuration for downloading devnet files |
| devnet.name | string | `"devnet-3"` | Devnet name (e.g., devnet-3) |
| devnet.urls | object | `{"elBootnode":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/enodes.txt","genesisJson":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/genesis.json"}` | URLs for devnet configuration files |
| devnet.urls.elBootnode | string | `"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/enodes.txt"` | Execution layer bootnode URL |
| devnet.urls.genesisJson | string | `"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/genesis.json"` | Genesis JSON URL for execution layer |
| extraArgs | list | `[]` | Extra args for the nethermind container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8545` | HTTP Port |
| image.pullPolicy | string | `"IfNotPresent"` | nethermind container pull policy |
| image.repository | string | `"nethermind/nethermind"` | nethermind container image repository |
| image.tag | string | `"latest"` | nethermind container image tag |
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
| metricsPort | int | `9545` | Metrics Port |
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
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
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
| serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| terminationGracePeriodSeconds | int | `300` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type |
| wsPort | int | `8545` | WS Port |

# Examples

## Connecting to the holesky test network

```yaml
extraArgs:
  - --config=holesky
  - --Network.MaxActivePeers=60
```

## Exposing the P2P service via NodePort

This will make your node accessible via the Internet using a service of type [NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport).
When using `p2pNodePort.enabled` the exposed IP address on your ENR record will be the "External IP" of the node where the pod is running.

**Limitations:** You can only run a single replica per chart deployment when using `p2pNodePort.enabled=true`.If you need N nodes, simply deploy the chart N times.
Currently nethermind doesn't allow you to announce a a different discovery port, which would be a requirement to run multiple replicas within the same chart.

```yaml
replicas: 1

p2pNodePort:
  enabled: true
  port: 31000
```
