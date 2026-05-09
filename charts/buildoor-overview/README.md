# buildoor-overview

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Multi-instance overview dashboard for buildoor block builders. Aggregates online status, ePBS / Builder API mode, balance and recent build stats from one or more buildoor instances and serves them through a small web UI.

**Homepage:** <https://github.com/ethpandaops/buildoor>

## Source Code

* <https://github.com/ethpandaops/buildoor>

# Usage

Runs `buildoor overview --port <httpPort> --host <url> ...` and exposes the
small dashboard on the configured port. Each `hosts` entry must point at a
buildoor instance that has its WebUI/API enabled (`--api-port`).

Example values:
```yaml
hosts:
  - http://buildoor-1.example.io
  - http://buildoor-2.example.io
ingress:
  enabled: true
  className: nginx
  hosts:
    - host: buildoor.example.io
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
| extraArgs | list | `[]` | Extra args appended to the buildoor overview command |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables passed to the buildoor container |
| extraPodPorts | list | `[]` | Additional pod-level container ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| hosts | list | `[]` | buildoor instances the overview should aggregate (one URL per builder) |
| httpPort | int | `8080` | HTTP port the overview UI listens on |
| image.pullPolicy | string | `"Always"` | buildoor container pull policy |
| image.repository | string | `"ethpandaops/buildoor"` | buildoor container image repository |
| image.tag | string | `"main"` | buildoor container image tag |
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
| readinessProbe | object | `{"httpGet":{"path":"/","port":"http"},"initialDelaySeconds":2,"periodSeconds":5}` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
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
