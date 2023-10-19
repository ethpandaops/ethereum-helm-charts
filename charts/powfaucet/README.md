
# powfaucet

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

PoW Faucet for EVM chains

**Homepage:** <https://github.com/pk910/PoWFaucet>

## Source Code

* <https://github.com/pk910/PoWFaucet>

## Example Configuration

[Upstream docs](https://github.com/pk910/PoWFaucet/wiki/Operator-Wiki)

```yaml
faucetTitle: "PoW Faucet"
faucetPrivkey: "feedbeef12340000feedbeef12340000feedbeef12340000feedbeef12340000"
faucetRpcUrl: "http://your-el-node:8545"
faucetExplorerLink: "https://your-el-block-explorer.com/tx/{txid}"
faucetHomeHtml: ""

faucetMaxDropWei: 50000000000000000000 # 50 ETH
faucetPowEnabled: true
faucetPowRewardPerHash: 500000000000000000 # 0.5 ETH
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| config | string | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `["--datadir=/data"]` | Custom args for the fauceth container |
| customCommand | list | `[]` | Command replacement for the fauceth container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| faucetCaptchaEnabled | bool | `false` |  |
| faucetCaptchaProvider | string | `"hcaptcha"` |  |
| faucetCaptchaSecret | string | `"0xCensoredHCaptchaSecretKey"` |  |
| faucetCaptchaSitekey | string | `"00000000-0000-0000-0000-000000000000"` |  |
| faucetEnsEnabled | bool | `true` |  |
| faucetEnsRequired | bool | `false` |  |
| faucetEnsRpcUrl | string | `"https://rpc.flashbots.net/"` |  |
| faucetEthinfoDenyContract | bool | `true` |  |
| faucetEthinfoEnabled | bool | `true` |  |
| faucetEthinfoMaxbalanceWei | float | `100000000000000000000` |  |
| faucetExplorerLink | string | `"https://your-el-block-explorer.com/tx/{txid}"` |  |
| faucetGithubClientid | string | `""` |  |
| faucetGithubEnabled | bool | `false` |  |
| faucetGithubLimitAmountWei | float | `100000000000000000000` |  |
| faucetGithubLimitDuration | int | `86400` |  |
| faucetGithubMinAge | int | `604800` |  |
| faucetGithubMinFollowers | int | `5` |  |
| faucetGithubMinRepos | int | `5` |  |
| faucetGithubSecret | string | `""` |  |
| faucetHomeHtml | string | `""` |  |
| faucetIpinfoEnabled | bool | `true` |  |
| faucetIpinfoHostingRewards | int | `10` |  |
| faucetIpinfoProxyRewards | int | `10` |  |
| faucetMainnetEnabled | bool | `false` |  |
| faucetMainnetMinBalanceWei | int | `10000000000000000` |  |
| faucetMainnetMinTxCount | int | `5` |  |
| faucetMainnetRpcUrl | string | `"https://rpc.flashbots.net/"` |  |
| faucetMaxDropWei | float | `50000000000000000000` |  |
| faucetMinDropWei | int | `1000000000000000000` |  |
| faucetOutflowAmountWei | float | `1e+21` |  |
| faucetOutflowBufferWei | float | `500000000000000000000` |  |
| faucetOutflowDuration | int | `86400` |  |
| faucetOutflowEnabled | bool | `false` |  |
| faucetPowDifficulty | int | `12` |  |
| faucetPowEnabled | bool | `false` |  |
| faucetPowMaxDuration | int | `18000` |  |
| faucetPowRewardPerHash | int | `500000000000000000` |  |
| faucetPrivkey | string | `"feedbeef12340000feedbeef12340000feedbeef12340000feedbeef12340000"` |  |
| faucetRecurringLimitsAmountWei | float | `100000000000000000000` |  |
| faucetRecurringLimitsDuration | int | `86400` |  |
| faucetRecurringLimitsEnabled | bool | `true` |  |
| faucetRpcUrl | string | `"http://your-el-node:8545"` |  |
| faucetTitle | string | `"PoW Faucet"` |  |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8080` |  |
| httpProxyCount | int | `1` |  |
| image.pullPolicy | string | `"IfNotPresent"` | fauceth container pull policy |
| image.repository | string | `"pk910/powfaucet"` | fauceth container image repository |
| image.tag | string | `"v2-stable"` | fauceth container image tag |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"5Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy |
| priorityClassName | string | `nil` | Pod priority class |
| resources | object | `{}` | Resource requests and limits |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update stategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update stategy type |
