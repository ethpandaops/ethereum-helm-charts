
# silver

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A high-performance Ethereum consensus client by Gattaca, written in Rust.

**Homepage:** <https://github.com/gattaca-com/silver>

## Source Code

* <https://github.com/gattaca-com/silver>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| checkpointSync | object | `{"enabled":false,"url":""}` | Checkpoint sync. When disabled, Silver uses the network's built-in checkpoint providers. |
| config | string | `""` | Additional TOML appended to the generated config file. The chart manages `data_storage_dir`, `beacon_api_bind`, `discovery_port`, `quic_port`, `external_ip_v4` and (with `checkpointSync.enabled`) `chain_config.checkpoint_sync_urls`. Setting `external_ip_v4` here replaces the advertised address. |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Legacy way of overwriting the default command. You may prefer to change defaultCommandTemplates instead. |
| defaultBeaconCommandTemplate | string | See `values.yaml` | Template used for the default beacon command |
| devnet | object | `{"baseUrl":"https://raw.githubusercontent.com/ethpandaops/fusaka-devnets/master/network-configs","enabled":false,"initContainer":[{"command":["sh","-ac","mkdir -p /data/testnet_spec;\nif [ ! -f /data/testnet_spec/genesis.ssz ]; then\n  echo \"Downloading devnet configuration files...\";\n  wget -O /data/testnet_spec/config.yaml \"{{ tpl .Values.devnet.urls.configYaml . }}\"\n  wget -O /data/testnet_spec/genesis.ssz \"{{ tpl .Values.devnet.urls.genesisSsz . }}\"\n  wget -O /data/testnet_spec/bootstrap_nodes.yaml \"{{ tpl .Values.devnet.urls.bootstrapNodesYaml . }}\"\n  echo \"Devnet configuration download complete.\";\nelse\n  echo \"Genesis file already exists, skipping download.\";\nfi\n"],"image":"alpine:latest","imagePullPolicy":"IfNotPresent","name":"download-devnet-config","securityContext":{"runAsNonRoot":false,"runAsUser":0},"volumeMounts":[{"mountPath":"/data","name":"storage"}]}],"name":"devnet-3","urls":{"bootstrapNodesYaml":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/bootstrap_nodes.yaml","configYaml":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/config.yaml","genesisSsz":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/genesis.ssz"}}` | Devnet configuration |
| devnet.baseUrl | string | `"https://raw.githubusercontent.com/ethpandaops/fusaka-devnets/master/network-configs"` | Base URL for devnet configuration files |
| devnet.enabled | bool | `false` | Enable devnet mode |
| devnet.initContainer | list | `[{"command":["sh","-ac","mkdir -p /data/testnet_spec;\nif [ ! -f /data/testnet_spec/genesis.ssz ]; then\n  echo \"Downloading devnet configuration files...\";\n  wget -O /data/testnet_spec/config.yaml \"{{ tpl .Values.devnet.urls.configYaml . }}\"\n  wget -O /data/testnet_spec/genesis.ssz \"{{ tpl .Values.devnet.urls.genesisSsz . }}\"\n  wget -O /data/testnet_spec/bootstrap_nodes.yaml \"{{ tpl .Values.devnet.urls.bootstrapNodesYaml . }}\"\n  echo \"Devnet configuration download complete.\";\nelse\n  echo \"Genesis file already exists, skipping download.\";\nfi\n"],"image":"alpine:latest","imagePullPolicy":"IfNotPresent","name":"download-devnet-config","securityContext":{"runAsNonRoot":false,"runAsUser":0},"volumeMounts":[{"mountPath":"/data","name":"storage"}]}]` | Init container configuration for downloading devnet files |
| devnet.name | string | `"devnet-3"` | Devnet name (e.g., devnet-3) |
| devnet.urls | object | `{"bootstrapNodesYaml":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/bootstrap_nodes.yaml","configYaml":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/config.yaml","genesisSsz":"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/genesis.ssz"}` | URLs for devnet configuration files. Silver reads only these three files. |
| devnet.urls.bootstrapNodesYaml | string | `"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/bootstrap_nodes.yaml"` | Bootstrap nodes YAML URL |
| devnet.urls.configYaml | string | `"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/config.yaml"` | Chain config YAML URL |
| devnet.urls.genesisSsz | string | `"{{ .Values.devnet.baseUrl }}/{{ .Values.devnet.name }}/metadata/genesis.ssz"` | Genesis state SSZ URL |
| existingJwtSecret | string | `""` | Use an existing Secret for the JWT instead of creating one (e.g. managed by an external secrets operator). The Secret must contain the key `jwt.hex` with the JWT secret as a hex string. When set, `jwt` is ignored. |
| extraArgs | list | `[]` | Extra args for the silver container. Silver's CLI only accepts `--network`, `--execution-endpoint`, `--jwt-secret` and `--pbs-endpoint`; everything else is set through `config`. |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `5052` | Beacon API port. Silver also serves `/metrics` on this port. |
| image.pullPolicy | string | `"IfNotPresent"` | silver container pull policy |
| image.repository | string | `"ghcr.io/gattaca-com/silver"` | silver container image repository |
| image.tag | string | `""` | silver container image tag. Defaults to the chart's appVersion when empty. |
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
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| p2pNodePort.enabled | bool | `false` | Expose P2P ports via NodePort |
| p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| p2pNodePort.initContainer.image.repository | string | `"lachlanevenson/k8s-kubectl"` | Container image to fetch nodeport information |
| p2pNodePort.initContainer.image.tag | string | `"v1.25.4"` | Container tag |
| p2pNodePort.port | int | `31000` | NodePort used for UDP discovery |
| p2pNodePort.quicPort | int | `31001` | NodePort used for UDP QUIC peer connections |
| p2pPort | int | `9000` | UDP discovery port |
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
| quicPort | int | `9001` | UDP QUIC port for peer connections |
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
| sharedMemory.enabled | bool | `true` | Mount a memory-backed emptyDir at /dev/shm |
| sharedMemory.sizeLimit | string | `"2Gi"` | Size limit for /dev/shm. Usage counts against the pod's memory. |
| startupProbe | object | See `values.yaml` | Startup probe. Allows up to 30 minutes for the first checkpoint state download. |
| terminationGracePeriodSeconds | int | `300` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type |

# Notes

- Published images support Linux amd64 only.
- Silver uses two UDP ports: one for discovery (`p2pPort`) and one for QUIC peer connections (`quicPort`). It has no TCP P2P port.
- The chart renders a TOML config from its values and passes it with `--config`. Use `config` for any setting without a CLI flag.
- Silver pins each of its tiles (OS threads) to fixed CPU cores 1-7. Without the kubelet's static CPU manager policy those cores are shared with other pods.
- Silver serves `/metrics` on the beacon API port, so `serviceMonitor` scrapes `http-api`.

# Examples

## Beacon node on hoodi

```yaml
extraArgs:
  - --network=hoodi
  - --execution-endpoint=http://<EXECUTION-ENDPOINT>:8551
```

## Supernode

```yaml
config: |
  data_column_custody_group_count = 128
  attestation_subnet_count = 64
```

## Using an existing JWT Secret

If the JWT secret is managed outside of Helm (e.g. by an external secrets operator such as External Secrets, Vault or Doppler), reference it instead of letting the chart create one. The Secret must contain the JWT secret as a hex string under the key `jwt.hex`:

```yaml
existingJwtSecret: my-jwt-secret
```

## Exposing the P2P ports via NodePort

This will make your node accessible via the Internet using a service of type [NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport).
When using `p2pNodePort.enabled` the IP address in your ENR is the "External IP" of the node where the pod is running, and both UDP ports are exposed with the same NodePort numbers.

**Limitations:** You can only run a single replica per chart deployment when using `p2pNodePort.enabled=true`. If you need N nodes, simply deploy the chart N times.

```yaml
replicas: 1

p2pNodePort:
  enabled: true
  port: 31000
  quicPort: 31001
```
