
# web3signer

![Version: 1.0.5](https://img.shields.io/badge/Version-1.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Web3Signer is capable of signing on multiple platforms using private keys stored in an external vault, or encrypted on a disk.

**Homepage:** <https://github.com/Consensys/web3signer/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | slashingprotectiondb(postgresql) | 12.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| config | string | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Command replacement for the web3signer container |
| extraArgs | list | `[]` | Extra args for the web3signer container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `9000` |  |
| image.pullPolicy | string | `"IfNotPresent"` | web3signer container pull policy |
| image.repository | string | `"consensys/web3signer"` | web3signer container image repository |
| image.tag | string | `"latest"` | web3signer container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initChownData.enabled | bool | `true` | Init container to set the correct permissions to access data directories |
| initChownData.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| initChownData.image.repository | string | `"busybox"` | Container repository |
| initChownData.image.tag | string | `"1.34.1"` | Container tag |
| initChownData.resources | object | `{}` | Resource requests and limits |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| metricsPort | int | `9001` |  |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `true` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"1Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Number of replicas |
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
| slashingprotectiondb.auth.enablePostgresUser | bool | `true` |  |
| slashingprotectiondb.auth.postgresPassword | string | `"postgres"` |  |
| slashingprotectiondb.enabled | bool | `true` | If enabled a postgres chart will be deployed as a dependency to be used as a slashing protection database |
| slashingprotectiondb.primary.extraVolumeMounts[0].mountPath | string | `"/sql-scripts"` |  |
| slashingprotectiondb.primary.extraVolumeMounts[0].name | string | `"sql-scripts"` |  |
| slashingprotectiondb.primary.extraVolumes[0].emptyDir | object | `{}` |  |
| slashingprotectiondb.primary.extraVolumes[0].name | string | `"sql-scripts"` |  |
| slashingprotectiondb.primary.initContainers[0].command[0] | string | `"bash"` |  |
| slashingprotectiondb.primary.initContainers[0].command[1] | string | `"-cex"` |  |
| slashingprotectiondb.primary.initContainers[0].command[2] | string | `"cd /sql-scripts\nBASE_URL=\"https://raw.githubusercontent.com/ConsenSys/web3signer/master/slashing-protection/src/main/resources/migrations/postgresql\"\nMIGRATIONS=(\n    \"V00001__initial.sql\"\n    \"V00002__removeUniqueConstraints.sql\"\n    \"V00003__addLowWatermark.sql\"\n    \"V00004__addGenesisValidatorsRoot.sql\"\n    \"V00005__xnor_source_target_low_watermark.sql\"\n    \"V00006__signed_data_indexes.sql\"\n    \"V00007__add_db_version.sql\"\n    \"V00008__signed_data_unique_constraints.sql\"\n    \"V00009__upsert_validators.sql\"\n    \"V00010__validator_enabled_status.sql\"\n    \"V00011__bigint_indexes.sql\"\n    \"V00012__add_highwatermark_metadata.sql\"\n)\nfor MIGRATION in \"${MIGRATIONS[@]}\"; do\n    if [ ! -f \"/sql-scripts/$MIGRATION\" ]; then\n        wget \"$BASE_URL/$MIGRATION\"\n    fi\ndone\n"` |  |
| slashingprotectiondb.primary.initContainers[0].image | string | `"bash:latest"` |  |
| slashingprotectiondb.primary.initContainers[0].imagePullPolicy | string | `"IfNotPresent"` |  |
| slashingprotectiondb.primary.initContainers[0].name | string | `"init-sql-migration-scripts"` |  |
| slashingprotectiondb.primary.initContainers[0].securityContext.runAsNonRoot | bool | `false` |  |
| slashingprotectiondb.primary.initContainers[0].securityContext.runAsUser | int | `0` |  |
| slashingprotectiondb.primary.initContainers[0].volumeMounts[0].mountPath | string | `"/sql-scripts"` |  |
| slashingprotectiondb.primary.initContainers[0].volumeMounts[0].name | string | `"sql-scripts"` |  |
| slashingprotectiondb.primary.initdb.password | string | `"postgres"` |  |
| slashingprotectiondb.primary.initdb.scripts."init_01_db.sh" | string | `"#!/bin/sh\nexport PGPASSWORD=postgres\n\nDB_EXISTS=$(psql -U postgres -h 127.0.0.1 -t -c \"SELECT 1 FROM pg_database WHERE datname='web3signer'\")\nif [ -z \"$DB_EXISTS\" ]; then\n    psql -U postgres -h 127.0.0.1 -c \"CREATE DATABASE web3signer;\"\nfi\n"` |  |
| slashingprotectiondb.primary.initdb.scripts."init_02_db.sh" | string | `"#!/bin/sh\nexport PGPASSWORD=postgres\ncd /sql-scripts\nfor FILE in *.sql; do\n  COMPLETED_FILE=\"${FILE}.completed\"\n  if [ ! -f \"$COMPLETED_FILE\" ]; then\n    psql -U postgres -h 127.0.0.1 -d web3signer -f $FILE && touch \"$COMPLETED_FILE\"\n  fi\ndone\n"` |  |
| slashingprotectiondb.primary.initdb.user | string | `"postgres"` |  |
| slashingprotectiondb.primary.name | string | `"web3signer"` |  |
| slashingprotectiondb.primary.persistence.enabled | bool | `true` | Uses an EmptyDir when not enabled |
| slashingprotectiondb.primary.persistence.size | string | `"1Gi"` |  |
| terminationGracePeriodSeconds | int | `300` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type |

# Examples

## Configure Slashing Protection Database

The chart supports a PostgreSQL Database that will be used for slashing protection by default.

```yaml
slashingprotectiondb:
  enabled: true
```

If you would like to disable this feature, you could disable it by setting `slashingprotectiondb.enable=false`. Only do this if you know what you're doing.
