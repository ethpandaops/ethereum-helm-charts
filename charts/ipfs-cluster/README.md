# ipfs-cluster

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Run ipfs cluster along with kubo (go-ipfs)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cluster.affinity | object | `{}` |  |
| cluster.image.pullPolicy | string | `"IfNotPresent"` |  |
| cluster.image.repository | string | `"ipfs/ipfs-cluster"` |  |
| cluster.image.tag | string | `""` |  |
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
| ipfs.image.pullPolicy | string | `"IfNotPresent"` |  |
| ipfs.image.repository | string | `"ipfs/go-ipfs"` |  |
| ipfs.image.tag | string | `""` |  |
| ipfs.imagePullSecrets | list | `[]` |  |
| ipfs.nameOverride | string | `""` |  |
| ipfs.nodeSelector | object | `{}` |  |
| ipfs.podSecurityContext | object | `{}` |  |
| ipfs.resources | object | `{}` |  |
| ipfs.service.type | string | `"ClusterIP"` |  |
| ipfs.storage.storageClassName | string | `""` |  |
| ipfs.storage.volumeSize | string | `""` |  |
| ipfs.tolerations | list | `[]` |  |
| podAnnotations | object | `{}` |  |
| replicaCount | int | `1` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| sharedSecret | string | `""` |  |

Based on: https://github.com/monaparty/helm-ipfs-cluster
