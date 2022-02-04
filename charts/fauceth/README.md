
# fauceth

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Faucet for EVM chains

**Homepage:** <https://github.com/komputing/fauceth>

## Source Code

* <https://github.com/komputing/fauceth>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| customArgs | list | `[]` | Custom args for the fauceth container |
| customCommand | list | `[]` | Command replacement for the fauceth container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | fauceth container pull policy |
| image.repository | string | `"ghcr.io/komputing/fauceth"` | fauceth container image repository |
| image.tag | string | `"release"` | fauceth container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{"APP_AMOUNT":"1000000000000000000","APP_CHAINS":"5","APP_ETHKEY":"key in hex format","APP_TITLE":"%CHAINNAME FaucETH","HCAPTCHA_SECRET":"your_hcaptcha_secret","HCAPTCHA_SITEKEY":"your_hcaptcha_site_key"}` | Env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update stategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update stategy type |

# Examples

## Setting the configuration via Env vars

```yaml
secretEnv:
  HCAPTCHA_SECRET: "your_hcaptcha_secret"
  HCAPTCHA_SITEKEY: "your_hcaptcha_site_key"
  APP_ETHKEY: "key in hex format"
  APP_AMOUNT: "1000000000000000000" # 1 ETH
  APP_CHAINS: "5" # Comma separated chain IDs that you support
  APP_TITLE: "%CHAINNAME FaucETH"
  #APP_IMAGEURL:
```
