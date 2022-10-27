
# web3signer

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Web3Signer is capable of signing on multiple platforms using private keys stored in an external vault, or encrypted on a disk.

**Homepage:** <https://github.com/Consensys/web3signer/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | slashingprotectiondb(postgresql) | 11.x.x |

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
| individualKeys.enabled | bool | `true` |  |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| metricsPort | int | `9001` |  |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
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
| slashingprotectiondb.primary.initContainers[0].command[1] | string | `"-acex"` |  |
| slashingprotectiondb.primary.initContainers[0].command[2] | string | `"cd /sql-scripts; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00001__initial.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00002__removeUniqueConstraints.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00003__addLowWatermark.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00004__addGenesisValidatorsRoot.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00005__xnor_source_target_low_watermark.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00006__signed_data_indexes.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00007__add_db_version.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00008__signed_data_unique_constraints.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00009__upsert_validators.sql; wget https://raw.githubusercontent.com/ConsenSys/web3signer/22.10.0/slashing-protection/src/main/resources/migrations/postgresql/V00010__validator_enabled_status.sql;\n"` |  |
| slashingprotectiondb.primary.initContainers[0].image | string | `"bash:latest"` |  |
| slashingprotectiondb.primary.initContainers[0].imagePullPolicy | string | `"IfNotPresent"` |  |
| slashingprotectiondb.primary.initContainers[0].name | string | `"init-sql-migration-scripts"` |  |
| slashingprotectiondb.primary.initContainers[0].securityContext.runAsNonRoot | bool | `false` |  |
| slashingprotectiondb.primary.initContainers[0].securityContext.runAsUser | int | `0` |  |
| slashingprotectiondb.primary.initContainers[0].volumeMounts[0].mountPath | string | `"/sql-scripts"` |  |
| slashingprotectiondb.primary.initContainers[0].volumeMounts[0].name | string | `"sql-scripts"` |  |
| slashingprotectiondb.primary.initdb.password | string | `"postgres"` |  |
| slashingprotectiondb.primary.initdb.scripts."init_00.sql" | string | `"CREATE DATABASE web3signer;\n"` |  |
| slashingprotectiondb.primary.initdb.scripts."init_02_db.sh" | string | `"#!/bin/sh\nexport PGPASSWORD=postgres\ncd /sql-scripts\nfor FILE in *.sql; do\n  psql -U postgres -h 127.0.0.1 -d web3signer -f $FILE\ndone\n"` |  |
| slashingprotectiondb.primary.initdb.user | string | `"postgres"` |  |
| slashingprotectiondb.primary.name | string | `"web3signer"` |  |
| slashingprotectiondb.primary.persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| slashingprotectiondb.primary.persistence.size | string | `"8Gi"` |  |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update stategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update stategy type |

# Examples

## Setting up validator keys individually

By default each validator key should have its own independent file e.g `keys/keystore-m_12381_3600_0_0_0-1666611825.json` with its corresponding password `keys/keystore1.pass` and its configuration file `keys/validator1.yaml`.
By default, each configuration file will point to the corresponding `keystore` file and `password` file to be able to make the signatures. In order to have the different password file enabled for different keystores files, you must make sure to have the individualKeys enabledwithin values.

## Setting up validator keys in bulk
It is also possible to have one password for multiple keystore files. In this case set the keystores.pass to your common password and disable individualKeys flag within values.

In both cases the keystore files will be loaded into a secret object within kubernetes. Make sure that you put your keystore files in keys/<keystore-m_12381...timestamp>.json format. All json files from this directory will be loaded into the secret object. Once the chart is running the file structures will be the following:
```
/data
├── files
│   ├── keystore1.yaml
│   ├── keystore2.yaml
│   └── ...
├── keys
│   ├── keystore-m_12381_3600_0_0_0-1666611825.json
│   ├── keystore-m_12381_3600_1_0_0-1666611998.json
│   └── ...
├── passwords
│   ├── keystore1.pass
│   ├── keystore2.pass
│   ├── .../OR
│   └── keystores.pass
└── config.yaml
```

## Configure Slashing DB Protection
Slashing DB protection is out of the scope of this helm chart. It is disabled by default (which is not recommended for mainnet!)
You can find further information about how to configure the slashing DB protection [here](https://docs.web3signer.consensys.net/en/latest/HowTo/Configure-Slashing-Protection/).
