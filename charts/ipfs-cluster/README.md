# ipfs-cluster

![Version: 0.1.9](https://img.shields.io/badge/Version-0.1.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
| ipfs.image.repository | string | `"ipfs/go-ipfs"` |  |
| ipfs.image.tag | string | `"latest"` |  |
| ipfs.imagePullSecrets | list | `[]` |  |
| ipfs.initScripts."001-peers.sh" | string | `"#!/bin/sh\nset -xe\nipfs config Peering.Peers \"[ { \\\"ID\\\": \\\"QmcFf2FH3CEgTNHeMRGhN7HNHU1EXAxoEk6EFuSyXCsvRE\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-1.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcFmLd5ySfk2WZuJ1mfSWLDjdmHZq7rSAua4GoeSQfs1z\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-2.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcfFmzSDVbwexQ9Au2pt5YEXHK5xajwgaU6PpkbLWerMa\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-3.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcfJeB3Js1FG7T8YaZATEiaHqNKVdQfybYYkbT1knUswx\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-4.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcfVvzK4tMdFmpJjEKDUoqRgP4W9FnmJoziYX5GXJJ8eZ\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-5.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcfZD3VKrUxyP9BbyUnZDpbqDnT7cQ4WjPP8TRLXaoE7G\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-6.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcfZP2LuW4jxviTeG8fi28qjnZScACb8PEgHAc17ZEri3\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-7.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcfgsJsMtx6qJb74akCw1M24X1zFwgGo11h1cuhwQjtJP\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-8.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"Qmcfr2FC7pFzJbTSDfYaSy1J8Uuy8ccGLeLyqJCKJvTHMi\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-9.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcfR3V5YAtHBzxVACWCzXTt26SyEkxdwhGJ6875A8BuWx\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-10.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"Qmcfuo1TM9uUiJp6dTbm915Rf1aTqm3a3dnmCdDQLHgvL5\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-11.ingress.cloudflare-ipfs.com\\\" ] }, { \\\"ID\\\": \\\"QmcfV2sg9zaq7UUHVCGuSvT2M2rnLBAPsiE79vVyK3Cuev\\\", \\\"Addrs\\\": [ \\\"/dnsaddr/node-12.ingress.cloudflare-ipfs.com\\\" ] } ]\" --json"` |  |
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
| p2pNodePort.initContainer.image.tag | string | `"v1.21.3"` | Container tag |
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
