
# powfaucet

![Version: 0.0.4](https://img.shields.io/badge/Version-0.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
| customArgs | list | `["--datadir=/data"]` | Custom args for the powfaucet container |
| customCommand | list | `[]` | Command replacement for the powfaucet container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| faucetCaptchaEnabled | bool | `false` | Enable captcha module |
| faucetCaptchaProvider | string | `"hcaptcha"` | Captcha module: provider (hcaptcha / recaptcha) |
| faucetCaptchaSecret | string | `"0xCensoredHCaptchaSecretKey"` | Captcha module: provider secret |
| faucetCaptchaSitekey | string | `"00000000-0000-0000-0000-000000000000"` | Captcha module: provider site key |
| faucetEnsEnabled | bool | `true` | Enable ENS module |
| faucetEnsRequired | bool | `false` | ENS module: enforce ens name to use the faucet |
| faucetEnsRpcUrl | string | `"https://rpc.flashbots.net/"` | ENS module: rpc url (mainnet) |
| faucetEthinfoDenyContract | bool | `true` | Ethinfo module: deny contract addresses |
| faucetEthinfoEnabled | bool | `true` | Enable ethinfo module (check target wallet balance / type) |
| faucetEthinfoMaxbalanceWei | float | `100000000000000000000` | Ethinfo module: check balance and deny session if balance exceeds the limit (in wei) |
| faucetExplorerLink | string | `"https://your-el-block-explorer.com/tx/{txid}"` | Link to el block explorer ({txid} as placeholder for transaction hash) |
| faucetGithubClientid | string | `""` | Github module: github app client id |
| faucetGithubEnabled | bool | `false` | Enable github module (require login to github) |
| faucetGithubLimitAmountWei | float | `100000000000000000000` | Github module: max amount each github user is allowed to request in total |
| faucetGithubLimitDuration | int | `86400` | Github module: aggregation duration for the max request amount check |
| faucetGithubMinAge | int | `604800` | Github module: minimum account age (in seconds) |
| faucetGithubMinFollowers | int | `5` | Github module: minimum number of followers |
| faucetGithubMinRepos | int | `5` | Github module: minimum number of repositories |
| faucetGithubSecret | string | `""` | Github module: github app client secret |
| faucetHomeHtml | string | `""` | Additional html to show on the faucet page |
| faucetIpinfoEnabled | bool | `true` | Enable ipinfo module (resolve ip infos from ip-api.com) |
| faucetIpinfoHostingRewards | int | `10` | Ipinfo module: reward rate if ip is in a hosting range (in %) |
| faucetIpinfoProxyRewards | int | `10` | Ipinfo module: reward rate if ip is in a proxy range (in %) |
| faucetMainnetEnabled | bool | `false` | Enable mainnet module (check mainnet wallet balance / nonce) |
| faucetMainnetMinBalanceWei | int | `10000000000000000` | Mainnet module: min balance the user needs to hold in his mainnet wallet to use the faucet |
| faucetMainnetMinTxCount | int | `5` | Mainnet module: min number of transactions the user needs to have sent from the mainnet wallet to use the faucet |
| faucetMainnetRpcUrl | string | `"https://rpc.flashbots.net/"` | Mainnet module: rpc url (mainnet) |
| faucetMaxDropWei | float | `50000000000000000000` | Default/Maximum drop amount in wei |
| faucetMinDropWei | int | `1000000000000000000` | Minimum drop amount in wei |
| faucetOutflowAmountWei | float | `1e+21` | Outflow module: allowed amount of ETH (amount/duration) (in wei) |
| faucetOutflowBufferWei | float | `500000000000000000000` | Outflow module: amount overflow buffer (in wei) |
| faucetOutflowDuration | int | `86400` | Outflow module: duration for the allowed amouunt (amount/duration) (in wei) |
| faucetOutflowEnabled | bool | `false` | Enable outflow module (limit global faucet outflow) |
| faucetPowDifficulty | int | `12` | PoW module: mining difficulty (see https://github.com/pk910/PoWFaucet/wiki/Operator-Wiki#eligible-hashes) |
| faucetPowEnabled | bool | `false` | Enable PoW module (require mining) |
| faucetPowMaxDuration | int | `18000` | PoW module: max mining time (in seconds) |
| faucetPowPingInterval | int | `45` | PoW module: ping interval for websocket connection |
| faucetPowPingTimeout | int | `90` | PoW module: ping timeout for websocket connection |
| faucetPowRewardPerHash | int | `500000000000000000` | PoW module: drop amount per eligible hash |
| faucetPrivkey | string | `"feedbeef12340000feedbeef12340000feedbeef12340000feedbeef12340000"` | Faucet wallet private key |
| faucetRecurringLimitsAmountWei | float | `100000000000000000000` | Recurring module: max amount a recurring user is allowed to request in total |
| faucetRecurringLimitsDuration | int | `86400` | Recurring module: aggregation duration for the max request amount check |
| faucetRecurringLimitsEnabled | bool | `true` | Enable recurring module (enforce limits for recurring users) |
| faucetRpcUrl | string | `"http://your-el-node:8545"` | Faucet el node rpc |
| faucetTitle | string | `"PoW Faucet"` | Faucet title |
| faucetTxGasLimit | int | `21000` | Transaction gas limit |
| faucetTxMaxFee | int | `100000000000` | Max transaction gas fee (in wei) |
| faucetTxMaxPrioFee | int | `2000000000` | Max transaction priority fee (in wei) |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8080` | HTTP port for faucet interface |
| httpProxyCount | int | `1` | number of HTTP proxies in front of the faucet |
| image.pullPolicy | string | `"IfNotPresent"` | powfaucet container pull policy |
| image.repository | string | `"pk910/powfaucet"` | powfaucet container image repository |
| image.tag | string | `"v2-stable"` | powfaucet container image tag |
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
