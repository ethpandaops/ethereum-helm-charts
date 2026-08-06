# slashoor

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A beacon chain slasher that detects and submits attester and proposer slashings

**Homepage:** <https://github.com/ethpandaops/slashoor>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| config.backfill_slots | int | `320` | Number of recent slots to backfill attestations for on startup. Committee resolution for deep history needs archive states, so keep this within a few epochs; the Dora scan covers older proposer slashings. |
| config.beacon.endpoints | list | `["http://localhost:5052"]` | Beacon node API endpoints; multiple endpoints get automatic failover |
| config.beacon.timeout | string | `"30s"` |  |
| config.detector.enabled | bool | `true` |  |
| config.dora.enabled | bool | `false` | Enable the Dora explorer integration for historical double-proposal scanning |
| config.dora.scan_on_startup | bool | `true` |  |
| config.dora.url | string | `"https://dora.example.com"` |  |
| config.indexer.max_epochs_to_keep | int | `54000` | Attestation retention window in epochs |
| config.proposer.enabled | bool | `true` |  |
| config.submitter.dry_run | bool | `false` | If true, log slashings without submitting them |
| config.submitter.enabled | bool | `true` |  |
| containerSecurityContext | object | `{}` | Container security context |
| customArgs | list | `[]` | Custom args for the custom command |
| customCommand | list | `[]` | Custom command to override the default entrypoint |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | slashoor container pull policy |
| image.repository | string | `"ethpandaops/slashoor"` | slashoor container image repository |
| image.tag | string | `"latest"` | slashoor container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets |
| initContainers | list | `[]` | Init containers |
| logLevel | string | `"info"` | Log level (debug, info, warn, error) |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector |
| podAnnotations | object | `{}` | Pod annotations |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `""` | Priority class name |
| replicas | int | `1` | Number of replicas. Keep at 1: multiple instances race to submit the same slashings, which is harmless (the pool dedupes) but noisy. |
| resources | object | `{}` | Resource requests and limits |
| securityContext | object | `{"runAsNonRoot":false}` | Pod security context |
| serviceAccount.annotations | object | `{}` | Annotations for the service account |
| serviceAccount.create | bool | `true` | If true, a service account will be created |
| serviceAccount.name | string | `""` | Name of the service account, computed from the fullname if empty |
| terminationGracePeriodSeconds | int | `30` | Termination grace period in seconds |
| tolerations | list | `[]` | Tolerations |
| topologySpreadConstraints | list | `[]` | Topology spread constraints |
