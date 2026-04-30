
# service-authenticatoor

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Issues short-lived RS256 JWTs for users authenticated by an upstream reverse-proxy SSO. Public keys are published as a JWKS so any resource server can validate the issued tokens locally.

**Homepage:** <https://github.com/ethpandaops/service-authenticatoor>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| allowedReturnHosts | list | `[]` | Hosts that /auth/login may redirect to via `return_to`. Same DNS-label glob syntax as scopePattern. Defaults to ["*.<parent zone of issuer>"]. |
| annotations | object | `{}` | Annotations for the Deployment |
| audience | list | `[]` | The "aud" claim. Verifiers must accept this value. Defaults to the parent zone of the issuer host. |
| cloudflareAccess.audTag | string | `""` | AUD tag of the CF Access application. Optional. When set, assertions whose aud doesn't match are rejected. When empty, the audience claim is not checked — assertions from any application in the same CF Access team are accepted (signature + issuer still tie them to the team). |
| cloudflareAccess.jwtHeader | string | `"Cf-Access-Jwt-Assertion"` | Header carrying the assertion JWT. |
| cloudflareAccess.teamDomain | string | `"ethpandaops.cloudflareaccess.com"` | Cloudflare team domain (e.g. "<team>.cloudflareaccess.com"). Required when verifyJWT is true. |
| cloudflareAccess.verifyJWT | bool | `true` | Verify the Cf-Access-Jwt-Assertion header against Cloudflare's JWKS. Recommended even when the service is unreachable outside the CF tunnel. |
| config | string | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| cors.allowedOrigins | list | `[]` | Browser origins allowed to call /auth/* with credentials. Defaults to allowedReturnHosts. |
| customCommand | list | `[]` | Command replacement for the authenticatoor container |
| externalURL | string | `""` | URL used in the OIDC discovery document and as jwks_uri. Defaults to the issuer URL. |
| extraArgs | list | `[]` | Extra args for the authenticatoor container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Additional ports on the pod (in addition to http and metrics) |
| extraPorts | list | `[]` | Additional ports on the Service (in addition to http) |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `8080` | HTTP port for the main listener (auth endpoints + JWKS + healthz) |
| image.pullPolicy | string | `"Always"` | authenticatoor container pull policy |
| image.repository | string | `"ethpandaops/service-authenticatoor"` | authenticatoor container image repository |
| image.tag | string | `"main"` | authenticatoor container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.className | string | `""` | IngressClass that will be used to implement the Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| issuer | string | `"https://auth.example.com"` | Canonical URL of this service. Used as the JWT "iss" claim. Required. Several other fields are derived from this when not set: audience, scopePattern, allowedReturnHosts, cors.allowedOrigins. |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| logging.format | string | `"json"` | Log format: text | json |
| logging.level | string | `"info"` | Log level: debug | info | warn | error |
| metrics.enabled | bool | `false` | Expose Prometheus metrics on a separate listener |
| metricsPort | int | `9090` | HTTP port for the metrics listener (only used when metrics.enabled) |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access modes for the PersistentVolumeClaim. |
| persistence.annotations | object | `{}` | Annotations for the PersistentVolumeClaim. |
| persistence.enabled | bool | `true` | Provision a PersistentVolumeClaim to hold the auto-generated signing key. This is the deploy-and-go default: the chart creates a small PVC, the service generates a key on first start, and the key persists across pod restarts. Disabled automatically when signing.privateKeyPem or signing.existingSecret is set. |
| persistence.existingClaim | string | `""` | Use an existing PersistentVolumeClaim instead of provisioning one. |
| persistence.size | string | `"32Mi"` | Requested size for the PersistentVolumeClaim. |
| persistence.storageClassName | string | `nil` | Storage class name. Uses the cluster default when null. |
| podAnnotations | object | `{}` | Pod annotations |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
| scopePattern | string | `""` | The "scope" claim — a host wildcard pattern. Defaults to "*.<parent zone of issuer>". |
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
| signing.existingSecret | string | `""` | Use an existing Secret instead of having the chart create one. The Secret must contain `active.pem`. Mutually exclusive with privateKeyPem and persistence. |
| signing.keyId | string | `""` | Optional kid for the active key. Auto-derived from the public key if empty. |
| signing.previousKeys | list | `[]` | Previous keys (public-only) kept in JWKS during rotation. Drop entries after `tokenTTL` has passed since the last token signed with them was issued. |
| signing.privateKeyPem | string | `""` | Active RSA private key in PEM format (PKCS#1 or PKCS#8). When set the chart writes this to a Secret and mounts it read-only. Mutually exclusive with persistence. |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tokenTTL | string | `"30m"` | Token lifetime |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"Recreate"}` | Update strategy for the Deployment. Defaults to Recreate so the new pod can attach the signing-key PVC after the old pod releases it (the typical RWO storage class doesn't allow simultaneous attach). |
| userHeader | string | `"Cf-Access-Authenticated-User-Email"` | HTTP header carrying the authenticated user's email. |

# Example

Minimal deploy-and-go install — only the issuer URL and the CF Access team
domain are required:

```yaml
issuer: "https://auth.example.com"

cloudflareAccess:
  teamDomain: "<team>.cloudflareaccess.com"
```

The chart provisions a small `PersistentVolumeClaim` (default 32Mi) for the
signing key. On first start the service generates an RS256 keypair and
writes it to the volume; subsequent restarts reuse the same key, so the
JWKS is stable across pod reschedules.

To pin the audience claim to a specific CF Access application (extra
defense), set `cloudflareAccess.audTag` to its AUD tag. When empty, any
assertion signed by the team's keys is accepted.

To bring your own key instead of using the auto-generated one, set
`signing.privateKeyPem` (chart writes it to a Secret) or
`signing.existingSecret` (referencing a Secret you manage). Both disable
the PVC-based path.

The `audience`, `scopePattern`, `allowedReturnHosts`, and
`cors.allowedOrigins` fields are auto-derived from the parent zone of the
issuer host when not set, so the example above produces:

- `aud`   = `["example.com"]`
- `scope` = `*.example.com`

Generate a fresh signing key with the bundled helper:

```sh
docker run --rm ethpandaops/service-authenticatoor:main genkey
```

More details: <https://github.com/ethpandaops/service-authenticatoor>.
