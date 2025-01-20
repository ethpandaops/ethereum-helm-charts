# ipfs-cluster

![Version: 0.1.14](https://img.shields.io/badge/Version-0.1.14-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Run ipfs cluster along with kubo (go-ipfs)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cluster.affinity | object | `{}` |  |
| cluster.extraEnv | list | `[]` |  |
| cluster.image.pullPolicy | string | `"IfNotPresent"` |  |
| cluster.image.repository | string | `"ipfs/ipfs-cluster"` |  |
| cluster.image.tag | string | `"latest"` |  |
| cluster.imagePullSecrets | list | `[]` |  |
| cluster.nameOverride | string | `""` |  |
| cluster.nodeSelector | object | `{}` |  |
| cluster.podSecurityContext | object | `{}` |  |
| cluster.resources | object | `{}` |  |
| cluster.service.type | string | `""` |  |
| cluster.storage.storageClassName | string | `""` |  |
| cluster.storage.volumeSize | string | `""` |  |
| cluster.tolerations | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| ipfs.affinity | object | `{}` |  |
| ipfs.customCommand | list | `[]` | Command replacement for the container |
| ipfs.extraArgs | list | `[]` | Additional args for the container |
| ipfs.extraEnv | list | `[]` | Additional env variables |
| ipfs.extraVolumeMounts | list | `[]` | Additional volume mounts |
| ipfs.extraVolumes | list | `[]` | Additional volumes |
| ipfs.image.pullPolicy | string | `"IfNotPresent"` |  |
| ipfs.image.repository | string | `"ipfs/kubo"` |  |
| ipfs.image.tag | string | `"latest"` |  |
| ipfs.imagePullSecrets | list | `[]` |  |
| ipfs.initContainers | list | `[]` | Additional init containers |
| ipfs.initScripts."001-peers.sh" | string | See `values.yaml` | Scripts that will run in an init container before the ipfs node starts. This is useful to setup some configuration parameters |
| ipfs.nameOverride | string | `""` |  |
| ipfs.nodeSelector | object | `{}` |  |
| ipfs.podSecurityContext | object | `{}` |  |
| ipfs.resources | object | `{}` |  |
| ipfs.service.type | string | `"ClusterIP"` |  |
| ipfs.storage.storageClassName | string | `""` |  |
| ipfs.storage.volumeSize | string | `""` |  |
| ipfs.tolerations | list | `[]` |  |
| p2pNodePort.enabled | bool | `true` |  |
| p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| p2pNodePort.initContainer.image.repository | string | `"lachlanevenson/k8s-kubectl"` | Container image to fetch nodeport information |
| p2pNodePort.initContainer.image.tag | string | `"v1.25.4"` | Container tag |
| p2pNodePort.nodePort | int | `32000` |  |
| podAnnotations | object | `{}` |  |
| rbac.clusterRules | list | See `values.yaml` | Required ClusterRole rules |
| rbac.create | bool | `true` | Specifies whether RBAC resources are to be created |
| rbac.rules | list | See `values.yaml` | Required ClusterRole rules |
| replicaCount | int | `1` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| sharedSecret | string | `""` |  |

Based on: https://github.com/monaparty/helm-ipfs-cluster
