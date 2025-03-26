# spamoor

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.2](https://img.shields.io/badge/AppVersion-1.0.2-informational?style=flat-square)

Ethereum transaction spammer for testnets and stress testing

## Installation

```console
helm repo add ethereum-helm-charts https://ethpandaops.github.io/ethereum-helm-charts
helm install [RELEASE_NAME] ethereum-helm-charts/spamoor
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| amount | int | `20` | Transaction amount per transaction (in gwei) |
| annotations | object | `{}` | Annotations for the StatefulSet |
| baseFee | int | `20` | Base fee per gas (in gwei) |
| blob | object | `{"enabled":false,"maxBlobs":2}` | Blob specific settings |
| blob.enabled | bool | `false` | Whether to use blob transactions (only for blob scenarios) |
| blob.maxBlobs | int | `2` | Maximum number of blobs per transaction |
| containerSecurityContext | object | `{}` | The security context for containers |
| customArgs | list | `[]` | Custom args for the spamoor container |
| customCommand | list | `[]` | Command replacement for the spamoor container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional environment variables |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| gasLimit | int | `21000` | Gas limit for transactions |
| image.pullPolicy | string | `"IfNotPresent"` | spamoor container pull policy |
| image.repository | string | `"ethpandaops/spamoor"` | spamoor container image repository |
| image.tag | string | `"1.0.2"` | spamoor container image tag |
| initContainers | list | `[]` | Additional init containers |
| maxPending | int | `1000` | Maximum number of pending transactions |
| maxWallets | int | `500` | Maximum number of child wallets to use |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy |
| priorityClassName | string | `nil` | Pod priority class |
| privateKey | string | `""` | Required private key for the main wallet |
| randomAmount | bool | `false` | Whether to use random transaction amounts |
| randomTarget | bool | `false` | Whether to use random target addresses |
| rebroadcastInterval | int | `120` | Rebroadcast interval in seconds |
| refillAmount | int | `5` | Amount of ETH to fund/refill each child wallet |
| refillBalance | int | `2` | Minimum balance before refilling a child wallet |
| refillInterval | int | `300` | Interval for child wallet balance check (in seconds) |
| resources | object | `{}` | Resource requests and limits |
| rpcEndpoint | string | `"http://execution-client:8545"` | RPC endpoint to use for transactions |
| scenario | string | `"eoatx"` | Spamoor scenario to use (options: eoatx, erctx, deploytx, deploy-destruct, blobs, gasburnertx) |
| securityContext | object | `{"fsGroup":10001,"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001}` | The security context for pods |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator |
| serviceMonitor.interval | string | `"15s"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"2s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| throughput | int | `100` | Number of transactions to send per second |
| tipFee | int | `2` | Tip fee per gas (in gwei) |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| traceEnabled | bool | `false` | Enables tracing output for debugging |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type |
| walletSeed | string | `""` | Child wallet seed for generating multiple transaction wallets |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)