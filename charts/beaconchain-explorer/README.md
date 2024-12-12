
# beaconchain-explorer

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Beacon chain explorer built using golang and using a PostgreSQL database for storing and indexing data.

**Homepage:** <https://beaconcha.in/>

## Source Code

* <https://github.com/gobitfly/eth2-beaconchain-explorer>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| config | object | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the beaconchain-explorer container |
| customCommand | list | `[]` | Command replacement for the beaconchain-explorer container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | beaconchain-explorer container pull policy |
| image.repository | string | `"gobitfly/eth2-beaconchain-explorer"` | beaconchain-explorer container image repository |
| image.tag | string | `"latest"` | beaconchain-explorer container image tag |
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
| postgresql.enabled | bool | `true` | If enabled a postgres chart will be deployed as a dependency |
| postgresql.image.registry | string | `"docker.io"` |  |
| postgresql.image.repository | string | `"bitnami/postgresql"` |  |
| postgresql.image.tag | string | `"11.13.0-debian-10-r58"` |  |
| postgresql.initdbPassword | string | `"postgres"` |  |
| postgresql.initdbScripts | object | See `values.yaml` | How to init the PSQL DB |
| postgresql.initdbUser | string | `"postgres"` |  |
| postgresql.persistence.enabled | bool | `true` |  |
| postgresql.persistence.size | string | `"8Gi"` |  |
| postgresql.postgresqlDatabase | string | `"explorer"` |  |
| postgresql.postgresqlPassword | string | `"postgres"` |  |
| postgresql.postgresqlUsername | string | `"postgres"` |  |
| postgresql.pullPolicy | string | `"IfNotPresent"` |  |
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

## Connecting to an external PostgreSQL database

```yaml
# Disable the postgres deployment
postgresql:
  enabled: false

config:
  database:
    user: "pguser"
    name: "explorer"
    host: "your-postgres-db.somewhere.internal"
    port: "5432"
    password: "pgpassword"
```
