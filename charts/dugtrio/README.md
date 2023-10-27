
# dugtrio

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Load balancer proxy for beacon chain rpc nodes

**Homepage:** <https://github.com/ethpandaops/dugtrio>

## Source Code

* <https://github.com/ethpandaops/dugtrio>

# Usage

Usage: dora-explorer -config config.yaml

Helper:
```shell
Usage of ./dora-explorer:
-config string
    Path to the config file, if empty string defaults will be used
```

Example Configuration:
```yaml
endpoints:
  - name: node1
    url: "http://beacon-node1:5052"
  - name: node2
    url: "http://beacon-node2:5052"
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| config | string | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `["-config=dugtrio-config.yaml"]` | Custom args for the dugtrio container |
| customCommand | list | `[]` | Command replacement for the dugtrio container |
| dugtrioFrontendEnabled | bool | `true` | Enable dugtrio UI |
| dugtrioFrontendTitle | string | `"Dugtrio"` | Dugtrio UI title |
| dugtrioPoolFollowDistance | int | `10` | number of blocks to keep in dugtrio cache to sort out forks |
| dugtrioPoolMaxHeadDistance | int | `2` | max head distance for endpoints before not using them anymore |
| dugtrioPoolScheduler | string | `"rr"` | dugtrio pool scheduler mode |
| dugtrioProxyBlockedPaths | list | `[]` | blocked proxy paths (regular expressions, eg. "^/eth/v[0-9]+/debug/.*") |
| dugtrioProxyCallRateBurst | int | `1000` | dugtrio call rate burst (burst number of calls per ip) |
| dugtrioProxyCallRateLimit | int | `100` | dugtrio call rate limit (number of calls per second per ip) |
| dugtrioProxyCallTimeout | string | `"10s"` | timeout for dugtrio proxy calls |
| dugtrioProxyCount | int | `1` | number of HTTP proxies in front of dugtrio |
| dugtrioProxySessionTimeout | string | `"10m"` | timeout for dugtrio sessions (used for rate limiting & endpoint stickiness) |
| dugtrioProxyStickyEndpoint | bool | `true` | reuse the same endpoint for sessions as long as available |
| endpoints | list | `[{"headers":{"X-Test":"test","Y-Test":"test2"},"name":"default-endpoint","url":"http://beacon-node:5052"}]` | An array of endpoints to use for dugtrio -- url is the only required field |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8080` | HTTP port for dugtrio interface |
| image.pullPolicy | string | `"IfNotPresent"` | dugtrio container pull policy |
| image.repository | string | `"ethpandaops/dugtrio"` | dugtrio container image repository |
| image.tag | string | `"latest"` | dugtrio container image tag |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
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
