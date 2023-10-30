
# testnet-faucet

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Ethereum faucet used for testnets

**Homepage:** <https://github.com/parithosh/testnet-faucet>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| config.server | object | See `values.yaml` | Server configuration |
| config.webui | object | See `values.yaml` | Web UI configuration |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the testnet-faucet container |
| customCommand | list | `[]` | Command replacement for the testnet-faucet container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | testnet-faucet container pull policy |
| image.repository | string | `"parithoshj/testnet-faucet"` | testnet-faucet container image repository |
| image.tag | string | `"9859e0d"` | testnet-faucet container image tag |
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
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{}` | Secret env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |

# Examples

## Configuring the faucet

To create the recaptcha keys you can go to http://www.google.com/recaptcha/admin

```yaml
config:
  # -- Web UI configuration
  webui:
    title: "My Testnet faucet"
    buttonText: "Request 5 ETH"
    logoUrl: "https://launchpad.ethereum.org/static/media/eth2-leslie-rhino.243747b9.png"
    footer: "My custom footer"
    recaptchaKey: "<Insert Recaptcha Site Key >"
  # -- Server configuration
  server:
    environment: live
    debug: true
    Captcha:
      secret: "<Insert Recaptcha Secret Key>"
    Ethereum:
      chainId: 56665
      milliEtherToTransfer: 5000
      gasLimit: "30000"
      live:
        rpc: "http://geth-server:8545"
        account: "<Insert faucet address : 0x....>"
        privateKey: "<Insert private key in hex format>"
```
