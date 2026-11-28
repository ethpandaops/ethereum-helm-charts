# mempool-lens

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Live transaction-lifecycle viewer for go-ethereum's txtracker and peerstats JSON-RPC namespaces. Connects to an instrumented geth node over WebSocket and renders mempool status transitions, peer stats and flow diagrams in a small web UI.

**Homepage:** <https://github.com/cskiraly/mempool-lens>

## Source Code

* <https://github.com/cskiraly/mempool-lens>

# Usage

Runs `lens --addr 0.0.0.0:<httpPort> --rpc <rpcUrl> --proxy` and serves the
UI on the configured port. `rpcUrl` must point at the WebSocket endpoint of a
geth build that has the `txtracker` namespace enabled
(`geth --ws --ws.api txtracker,peerstats,admin`); without `peerstats`/`admin`
the Peers tab columns stay empty but the rest of the UI works.

In proxy mode (default) the browser talks only to the lens, which proxies the
geth WebSocket via `/ws` — recommended behind an ingress. Auth tokens, method
allow-lists and a GeoLite2 database can be wired up through `extraArgs` (and
`extraVolumes`/`extraVolumeMounts` for the mmdb file).

Example values:
```yaml
rpcUrl: ws://geth-instrumented:8546
ingress:
  enabled: true
  className: nginx
  hosts:
    - host: mempool-lens.example.io
      paths:
        - path: /
          pathType: Prefix
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| containerSecurityContext | object | `{}` | The security context for containers |
| customCommand | list | `[]` | Override the command. Leave empty to use the chart default. |
| extraArgs | list | `[]` | Extra args appended to the mempool-lens command (e.g. auth tokens, --geo-db, --allow-methods) |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables passed to the mempool-lens container |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8670` | HTTP port the mempool-lens UI listens on |
| image.pullPolicy | string | `"Always"` | mempool-lens container pull policy |
| image.repository | string | `"bbusa/mempool-lens"` | mempool-lens container image repository |
| image.tag | string | `"latest"` | mempool-lens container image tag |
| imagePullSecrets | list | `[]` | ImagePullSecrets for the pod |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.className | string | `""` | Ingress class |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP UI |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | `{"httpGet":{"path":"/","port":"http"},"initialDelaySeconds":5,"periodSeconds":10}` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec. If not set then a PodDisruptionBudget will not be created. |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| proxy | bool | `true` | Run in proxy mode: the lens proxies the geth WebSocket for browsers via /ws instead of the browser connecting to geth directly. Recommended when serving the UI through an ingress. Note: in proxy mode the process exits at startup if the RPC endpoint is unreachable (kubernetes will restart it). |
| readinessProbe | object | `{"httpGet":{"path":"/","port":"http"},"initialDelaySeconds":2,"periodSeconds":5}` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
| rpcUrl | string | `"ws://localhost:8546"` | WebSocket endpoint of a geth node with the txtracker (and optionally peerstats/admin) namespaces enabled on the WS API |
| securityContext | object | `{"fsGroup":10001,"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001}` | The security context for pods |
| service.nodePort | string | `""` | NodePort (only used when service.type is NodePort) |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Deployment |
