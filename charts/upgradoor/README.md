
# upgradoor

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Per-devnet controller that staggers docker image rolls, package upgrades and reboots across the hosts of an Ethereum devnet, gated on network health.

**Homepage:** <https://github.com/ethpandaops/upgradoor>

## Source Code

* <https://github.com/ethpandaops/upgradoor>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| allowOpenApi | bool | `false` | Serve the user API without login (everything allowed). Only for tests. |
| annotations | object | `{}` | Annotations for the StatefulSet |
| authProviderUrl | string | `""` | Authenticatoor URL. Required unless allowOpenApi is set. |
| beaconEndpoints | list | `[]` | Beacon API endpoints for the network health gate. Required. |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| controllerSeed | string | `""` | Controller seed of the devnet group (at least 32 characters, or a vault-plugin reference). Written to a Secret. Required unless controllerSeedExistingSecret is set. |
| controllerSeedExistingSecret | string | `""` | Existing Secret holding the controller seed under the key `seed` |
| customCommand | list | `[]` | Command replacement for the upgradoor container |
| extraArgs | list | `[]` | Extra args for the upgradoor container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Additional ports on the pod (in addition to http) |
| extraPorts | list | `[]` | Additional ports on the Service (in addition to http) |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8080` | HTTP port for the agent API, user API, web UI, /healthz and /metrics |
| image.pullPolicy | string | `"Always"` | upgradoor container pull policy |
| image.repository | string | `"ghcr.io/ethpandaops/upgradoor"` | upgradoor container image repository |
| image.tag | string | `"latest"` | upgradoor container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.className | string | `""` | IngressClass that will be used to implement the Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API and web UI |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| logging.format | string | `"json"` | Log format: text | json |
| logging.level | string | `"info"` | Log level: debug | info | warn | error |
| metrics.blockOnIngress | bool | `true` | Route /metrics on the Ingress to a Service without endpoints, so it is not public |
| nameOverride | string | `""` | Overrides the chart's name |
| network | string | `""` | Name of the devnet this controller manages. Required. |
| nodeSelector | object | `{}` | Node selector for pods |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access modes for the PersistentVolumeClaim |
| persistence.annotations | object | `{}` | Annotations for the PersistentVolumeClaim |
| persistence.enabled | bool | `true` | Keep the SQLite database on a volume claim of the StatefulSet. Uses an emptyDir when disabled. |
| persistence.existingClaim | string | `""` | Use an existing PersistentVolumeClaim instead of provisioning one |
| persistence.size | string | `"1Gi"` | Requested size for the PersistentVolumeClaim |
| persistence.storageClassName | string | `nil` | Storage class name. Uses the cluster default when null. |
| persistentVolumeClaimRetentionPolicy | object | `{}` | PersistentVolumeClaim retention policy for the StatefulSet's volumeClaimTemplates (`whenDeleted`, `whenScaled`: `Retain` or `Delete`). Not rendered when empty, so Kubernetes keeps its default of retaining the PVCs. Ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#persistentvolumeclaim-retention |
| podAnnotations | object | `{}` | Pod annotations |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy of the StatefulSet |
| priorityClassName | string | `nil` | Pod priority class |
| prometheusRule.enabled | bool | `false` | If true, a PrometheusRule CRD is created for a prometheus operator |
| prometheusRule.labels | object | `{}` | Additional PrometheusRule labels |
| prometheusRule.namespace | string | `nil` | Alternative namespace for PrometheusRule |
| prometheusRule.rules | list | See `values.yaml` | Alert rules. `expr` is rendered as a template. |
| publicUrls | list | `[]` | Public base URLs agents reach the controller under |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| registry.allowPrivate | bool | `false` | Allow lookups at registries on private, loopback and link-local addresses |
| registry.auth | string | `""` | Docker config.json (`{"auths": {...}}`) for the registry lookups, written to a Secret |
| registry.caBundle | string | `""` | Extra CA bundle (PEM) for private registries |
| registry.existingSecret | string | `""` | Existing Secret holding the Docker config.json under the key `.dockerconfigjson` |
| registry.plainHttp | list | `[]` | Registry hosts looked up without TLS |
| resources | object | `{}` | Resource requests and limits |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
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
| settings | object | `{}` | Default scheduler settings, passed as `--default-setting=<key>=<value>`. Settings changed in the UI win. |
| signerPublicKey | string | `""` | Signer public key of the devnet (`upgradoor-controller keygen signer-pubkey`). Required. |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| trustForwardedHeaders | bool | `true` | Take the client address from X-Forwarded-For (behind an ingress) |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the StatefulSet. With one replica the old pod is gone before the new one starts. |
| validatorRangesUrl | string | `""` | Validator ranges inventory the hosts' validators come from; empty gives no host validators |

# Example

`network`, `signerPublicKey`, `beaconEndpoints` and a controller seed are required:

```yaml
network: my-devnet-0
signerPublicKey: "<output of upgradoor-controller keygen signer-pubkey>"
controllerSeed: "<path:/secrets/services/services.enc.yaml#ethereum | jsonPath {.testnets.my-devnets.upgradoor_controller_seed}>"
publicUrls:
  - https://upgradoor.my-devnet-0.example.com
beaconEndpoints:
  - http://beacon-node:5052
authProviderUrl: https://auth.my-devnet-0.example.com

settings:
  maxUnavailablePercent: 10
  policyReboot: manual

ingress:
  enabled: true
  className: ingress-nginx-public
  annotations:
    nginx.ingress.kubernetes.io/proxy-body-size: "8m"
  hosts:
    - host: upgradoor.my-devnet-0.example.com
      paths:
        - path: /
          pathType: Prefix
```

The controller seed is mounted from a Secret at `/etc/upgradoor/controller-seed/seed`.
To change it, change the value and redeploy.

`registry.auth` (or `registry.existingSecret`, e.g. a `kubernetes.io/dockerconfigjson` pull secret)
gives the controller credentials for looking up private images.

`/metrics` shares the port with the API. With `metrics.blockOnIngress` the Ingress routes `/metrics`
to a Service without endpoints, which ingress-nginx answers with 503. Check other ingress controllers
with `curl -si https://<host>/metrics`.

Agents upload their package inventory in one request; on ingress-nginx raise
`nginx.ingress.kubernetes.io/proxy-body-size` (e.g. `8m`).

More details: <https://github.com/ethpandaops/upgradoor>.
