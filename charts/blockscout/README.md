
# blockscout

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

BlockScout provides a comprehensive, easy-to-use interface for users to view, confirm, and inspect transactions on EVM (Ethereum Virtual Machine) blockchains

**Homepage:** <https://docs.blockscout.com/>

## Source Code

* <https://github.com/blockscout/blockscout/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.x.x |
| https://charts.bitnami.com/bitnami | redis | 17.x.x |
| https://ethpandaops.github.io/ethereum-helm-charts | smart-contract-verifier-http | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| config | object | See `values.yaml` | Config file https://docs.blockscout.com/for-developers/information-and-settings/env-variables |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the blockscout container |
| customCommand | list | `[]` | Command replacement for the blockscout container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | blockscout container pull policy |
| image.repository | string | `"blockscout/blockscout"` | blockscout container image repository |
| image.tag | string | `"5.0.0"` | blockscout container image tag |
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
| redis.enabled | bool | `false` |  |
| redis.replica.replicaCount | int | `1` |  |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{}` | Additional env variables injected via a created secret |
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
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update stategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update stategy type |
| verifier.config | string | `"[server]\naddr = \"0.0.0.0:8043\"\n\n[compilers]\n# if omitted, number of CPU cores would be used\n# max_threads = 8\n\n[solidity]\nenabled = true\ncompilers_dir = \"/data/solidity-compilers\"\nrefresh_versions_schedule = \"0 0 * * * * *\"\n\n[solidity.fetcher.list]\nlist_url = \"https://solc-bin.ethereum.org/linux-amd64/list.json\"\n\n#[solidity.fetcher.s3]\n#access_key = \"access_key\"\n#secret_key = \"secret_key\"\n#region = \"region\"\n#endpoint = \"endpoint\"\n## The only required field for the s3 fetcher\n#bucket = \"bucket\"\n\n[vyper]\nenabled = false\ncompilers_dir = \"/data/vyper-compilers\"\nrefresh_versions_schedule = \"0 0 * * * * *\"\n[vyper.fetcher.list]\nlist_url = \"https://raw.githubusercontent.com/blockscout/solc-bin/main/vyper.list.json\"\n\n[sourcify]\nenabled = false\napi_url = \"https://sourcify.dev/server/\"\nverification_attempts = 3\nrequest_timeout = 10\n\n[metrics]\nenabled = false\naddr = \"0.0.0.0:6060\"\nroute = \"/metrics\"\n\n[jaeger]\nenabled = false\nagent_endpoint = \"localhost:6831\"\n"` |  |
| verifier.enabled | bool | `false` |  |

# Examples

## Connecting to an existing PostgreSQL database

```yaml
# Disable the postgres deployment
postgresql:
  enabled: false

config:
  # Some existing internal postgresdb
  DATABASE_URL: postgresql://postgres:postgres@postgresql:5432/explorer?ssl=false
```

## Connecting to an existing Redis database

```yaml
# Disable the redis deployment
redis:
  enabled: false

config:
  ACCOUNT_ENABLED: "true"
  ACCOUNT_REDIS_URL: redis://blockscout-redis:6379/0
```

## Enabling the Smart-contract Verifier
Smart-contract verification service is a stateless http server for verifying smart contracts.
You can read more about it from [blockscout/blockscout-rs](https://github.com/blockscout/blockscout-rs/blob/9e06ddb8ad3c944b0937b99e192d41f33725d129/smart-contract-verifier-http/README.md)

```yaml
verifier:
  enabled: true

config:
  ENABLE_RUST_VERIFICATION_SERVICE: "true" # If set to true, you should also deploy smart-contract-verifier-http
  RUST_VERIFICATION_SERVICE_URL: http://blockscout-smart-contract-verifier-http:8043
```
