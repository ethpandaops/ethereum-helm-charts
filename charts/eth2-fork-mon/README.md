
# eth2-fork-mon

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Simple client/server to track the (real-time) status of a (configurable) set of eth2 beacon nodes.

**Homepage:** <https://github.com/ralexstokes/eth2-fork-mon>

## Source Code

* <https://github.com/ralexstokes/eth2-fork-mon>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| config | object | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the eth2-fork-mon container |
| customCommand | list | `[]` | Command replacement for the eth2-fork-mon container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | eth2-fork-mon container pull policy |
| image.repository | string | `"ralexstokes/eth2-fork-mon"` | eth2-fork-mon container image repository |
| image.tag | string | `"latest"` | eth2-fork-mon container image tag |
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
| secretEnv | object | `{}` | Additional env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type |

# Examples

## Setting the configuration file

```yaml
config:
  endpoints:
    - addr: http://beacon-node:4000
      eth1: ""
  http_timeout_milliseconds: 0
  eth2:
    network: mainnet
    seconds_per_slot: 12
    genesis_time: 1606824023
    slots_per_epoch: 32
```
