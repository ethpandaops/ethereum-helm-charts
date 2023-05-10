
# prysm

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

An open-source Ethereum 2.0 client, written in Go

**Homepage:** <https://docs.prylabs.network/docs/getting-started/>

## Source Code

* <https://github.com/prysmaticlabs/prysm>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Legacy way of overwriting the default command. You may prefer to change defaultCommandTemplates instead. |
| defaultBeaconCommandTemplate | string | See `values.yaml` | Template used for the default beacon command |
| defaultValidatorCommandTemplate | string | See `values.yaml` | Template used for the default validator command |
| extraArgs | list | `[]` | Extra args for the prysm container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `3500` | HTTP Port |
| image.pullPolicy | string | `"IfNotPresent"` | Prysm container pull policy |
| image.repository | string | `"ethpandaops/prysm"` | Prysm container image repository |
| image.tag | string | `"master"` |  |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initChownData.enabled | bool | `true` | Init container to set the correct permissions to access data directories |
| initChownData.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| initChownData.image.repository | string | `"busybox"` | Container repository |
| initChownData.image.tag | string | `"1.34.0"` | Container tag |
| initChownData.resources | object | `{}` | Resource requests and limits |
| initContainers | list | `[]` | Additional init containers |
| jwt | string | `"ecb22bc24e7d4061f7ed690ccd5846d7d73f5d2b9733267e12f56790398d908a"` | JWT secret used by client as a secret. Change this value. |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| metricsPort | int | `8080` | Metrics Port |
| mode | string | `"beacon"` | Mode can be 'beacon' or 'validator' |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| p2pNodePort.enabled | bool | `false` | Expose P2P port via NodePort |
| p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| p2pNodePort.initContainer.image.repository | string | `"lachlanevenson/k8s-kubectl"` | Container image to fetch nodeport information |
| p2pNodePort.initContainer.image.tag | string | `"v1.21.3"` | Container tag |
| p2pNodePort.portsOverwrite | object | See `values.yaml` for example | Overwrite a port for specific replicas |
| p2pNodePort.startAt | int | `31000` | Port used to start |
| p2pPort | int | `13000` | P2P Port |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"20Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| podManagementPolicy | string | `"OrderedReady"` | Pod management policy |
| priorityClassName | string | `nil` | Pod priority class |
| rbac.clusterRules | list | See `values.yaml` | Required ClusterRole rules |
| rbac.create | bool | `true` | Specifies whether RBAC resources are to be created |
| rbac.rules | list | See `values.yaml` | Required ClusterRole rules |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
| rpcPort | int | `4000` | RPC Port |
| secretEnv | object | `{}` | Additional env variables injected via a created secret |
| securityContext | object | See `values.yaml` | The security context for pods |
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
| terminationGracePeriodSeconds | int | `300` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update stategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update stategy type |

# Examples

## Beacon node on the Goerli testnet connected to Goerli via Infura

```yaml
mode: "beacon"

extraArgs:
  - --goerli
  - --execution-endpoint=<EXECUTION-ENDPOINT>
```

## Beacon nodes exposing the P2P service via NodePort

This will make your nodes accessible via the Internet using services of type [NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport). It will allocate a service definition and a pre-defined node port for each replica. The allocation starts at `p2pNodePort.startAt`. When using `p2pNodePort.enabled` the exposed IP address on your ENR record will be the "External IP" of the node where the pod is running.

```yaml
replicas: 5

mode: "beacon"

p2pNodePort:
  enabled: true
  startAt: 30000
  portsOverwrite:
    "3": 32000
```

This would create 5 beacon nodes, exposed via Node Port services with the following configuration:
- Node 0: `30000`
- Node 1: `30001`
- Node 2: `30002`
- Node 3: `32000`
- Node 4: `30004`

## Validator node targeting a beacon node service

This example runs a validator on the goerli network that targets a pre-existing `prysm-beacon`
service by injecting the all-accounts.keystore.json` file via a secret ENV var. You could use a similar
approach to fetch your secrets from some external secret management system (Hashicorp Vault, Azure key vault, etc.):

```yaml
replicas: 1

mode: validator

image:
  repository: gcr.io/prysmaticlabs/prysm/validator

initContainers:
  - name: init-keystore
    image: bash:latest
    imagePullPolicy: IfNotPresent
    command:
    - bash
    - -c
    - >
      export INDEX=$(echo $(hostname)| rev | cut -d'-' -f 1 | rev);
      mkdir -p /data/wallet/direct/accounts/;
      keystore="KEYSTORE_$INDEX";
      echo ${!keystore} > /data/wallet/direct/accounts/all-accounts.keystore.json;
      password="PASSWORD_$INDEX";
      echo ${!password} > /data/wallet-password.txt;
    volumeMounts:
      - name: storage
        mountPath: "/data"
        readOnly:
    env:
      - name: PASSWORD_0
        valueFrom:
          secretKeyRef:
            # Name of the secret that will be generated for you. This is normally `${RELEASE-name}-env`
            # You might need to change this
            name: prysm-env
            key: PASSWORD_0
      - name: KEYSTORE_0
        valueFrom:
          secretKeyRef:
            # See comment on the previous secretKeyRef
            name: prysm-env
            key: KEYSTORE_0

extraArgs:
  - --wallet-dir=/data/wallet
  - --wallet-password-file=/data/wallet-password.txt
  - --beacon-rpc-provider=prysm-beacon:4000

livenessProbe:
  tcpSocket: null
  exec:
    command:
      - /app/cmd/validator/validator
      - accounts
      - list
      - --accept-terms-of-use=true
      - --wallet-dir=/data/wallet
      - --wallet-password-file=/data/wallet-password.txt
  initialDelaySeconds: 60
  periodSeconds: 120

readinessProbe:
  tcpSocket: null
  exec:
    command:
      - /app/cmd/validator/validator
      - accounts
      - list
      - --accept-terms-of-use=true
      - --wallet-dir=/data/wallet
      - --wallet-password-file=/data/wallet-password.txt
  initialDelaySeconds: 10
  periodSeconds: 10

secretEnv:
  # Note: Never publish any of your production secrets online. These are just used for testing purposes.
  PASSWORD_0: NotSoSuperSecret1234!
  KEYSTORE_0: >
    {
            "crypto": {
                    "checksum": {
                            "function": "sha256",
                            "message": "303fd570c747d33a4ceb8b1484fd792ca023c6f0563c492215808e4b1ea138fe",
                            "params": {}
                    },
                    "cipher": {
                            "function": "aes-128-ctr",
                            "message": "1f6589828cc7d325429753ea84bfe23ad72d64d12622c07c5121595d3f599c820ed63834b7a659650819e9aaa5a485d6736195b6aeb698861b91a3cb9d63a4864f844308e990d675fee8dc1d16f41a759372b642954e2d20de535961444f509964362ccda21f5e47a07e73c889f6288a93fe6ff315207e8aaba5f12de5e1e89351a0fa7e1c8d08252de8eef8304be5eb2eb649600f235c9e4e7cb4635d7217a7caf6af8cdedc7da4ff2c6fdf95cefeb119a1ae6376f1cf603b68028677df5e3114640b584f20f9173b348491fad52c3b7af92cd0f96fcf032f80d45b3855d0cfb90ecb3e85a3515cf5e4a9fcf849a982909ae69c249fbad1c28c0b91797ff2e555f3a3e4cc0f8e14a7c18ef8ac90bf9c6ed4b094b61bf07b7cfb7bb2a9531f24a2beeb930fd7383eb515f1f99512c1bd7fccfacce1f9b447234a36df9c89d2536281915408b18b04b1dae85565bc0a794ef4a40279afb072fa1bc012c4b668489bec8d5d4c2b29372a1bb97f299992b8eaab80648061f1094e6f790a1a007abda7c675737ac888bf360506e8378b252578bbb811c7d8dc76d76b9f845d38a3d00ee62da62113766406b78a29f9797bb24b36d5bda13063d2407b7ef3b0eb71f9a942484254611af1c2ac43622046a9aaeb04ba7d0b6a2ef2932eb7a316afb1f459d153c16dc6a7328cc362ea7312c646f1a8b86150d90da9adaf0a0eb9bdb7bb05a7ef033af81af9c015d7932603e2c57f015914454d4f1e18cc7c1185690384f8a958fe4727e01314d82588fcca268fdeefcdcc6a2c21c2fdad9db56601e02ce87a1059e980e7f266539810705a07ad4a84df8366ea04f8b5763d28cfc9c4b8ce5a9c101c75e359ef5736e843bbe0ba344c161fa9da48701a8d96b5c45edf15da99da72ab",
                            "params": {
                                    "iv": "964bc953dbdda657f2876c3e89cc2c90"
                            }
                    },
                    "kdf": {
                            "function": "pbkdf2",
                            "message": "",
                            "params": {
                                    "c": 262144,
                                    "dklen": 32,
                                    "prf": "hmac-sha256",
                                    "salt": "4c8970475c27f4aff9eb4d9c7145b39d0110c964c1979fc334def2f322fda7fd"
                            }
                    }
            },
            "uuid": "727cf6d4-41e7-46ea-98a4-da6a3b2d6a91",
            "version": 4,
            "name": "keystore"
    }

```
