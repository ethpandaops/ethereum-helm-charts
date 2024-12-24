
# teku

![Version: 1.1.4](https://img.shields.io/badge/Version-1.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

An open-source Ethereum 2.0 client, written in Java

**Homepage:** <https://consensys.net/knowledge-base/ethereum-2/teku/>

## Source Code

* <https://github.com/Consensys/teku/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| checkpointSync | object | `{"enabled":false,"url":""}` | Checkpoint Sync |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Legacy way of overwriting the default command. You may prefer to change defaultCommandTemplates instead. |
| defaultBeaconCommandTemplate | string | See `values.yaml` | Template used for the default beacon command |
| defaultValidatorCommandTemplate | string | See `values.yaml` | Template used for the default validator command |
| extraArgs | list | `[]` | Extra args for the teku container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `5051` | HTTP Port |
| image.pullPolicy | string | `"IfNotPresent"` | teku container pull policy |
| image.repository | string | `"consensys/teku"` | teku container image repository |
| image.tag | string | `"latest"` | teku container image tag |
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
| metricsPort | int | `8008` | Metrics Port |
| mode | string | `"beacon"` | Mode can be 'beacon' or 'validator' |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| p2pNodePort.enabled | bool | `false` | Expose P2P port via NodePort |
| p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| p2pNodePort.initContainer.image.repository | string | `"lachlanevenson/k8s-kubectl"` | Container image to fetch nodeport information |
| p2pNodePort.initContainer.image.tag | string | `"v1.25.4"` | Container tag |
| p2pNodePort.port | int | `31000` | NodePort to be used |
| p2pPort | int | `9000` | P2P Port |
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
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update strategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type |

# Examples

## Beacon node on the Holesky testnet connected to Holesky via Infura

```yaml
mode: "beacon"

extraArgs:
  - --network=holesky
  - --ee-endpoint=<EXECUTION-ENDPOINT>
```

## Exposing the P2P service via NodePort

This will make your node accessible via the Internet using a service of type [NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport).
When using `p2pNodePort.enabled` the exposed IP address on your ENR record will be the "External IP" of the node where the pod is running.

**Limitations:** You can only run a single replica per chart deployment when using `p2pNodePort.enabled=true`.If you need N nodes, simply deploy the chart N times.

```yaml
replicas: 1

p2pNodePort:
  enabled: true
  port: 31000
```

This would create 5 beacon nodes, exposed via Node Port services with the following configuration:
- Node 0: `30000`
- Node 1: `30001`
- Node 2: `30002`
- Node 3: `32000`
- Node 4: `30004`

## Validator node targeting a beacon node service

This example runs a validator on the holesky network that targets a pre-existing `teku-beacon`
service by injecting the all-accounts.keystore.json` file via a secret ENV var. You could use a similar
approach to fetch your secrets from some external secret management system (Hashicorp Vault, Azure key vault, etc.):

```yaml
replicas: 1

mode: validator

initContainers:
  - name: init-keystore
    image: bash:latest
    imagePullPolicy: IfNotPresent
    securityContext:
      runAsNonRoot: false
      runAsUser: 0
    command:
    - bash
    - -c
    - >
      apk add jq;
      export INDEX=$(echo $(hostname)| rev | cut -d'-' -f 1 | rev);
      mkdir -p /data/validator/keys;
      mkdir -p /data/validator/secrets;
      KEY_COUNT="NODE_${INDEX}_KEY_COUNT";
      for ((i = 0 ; i < "${!KEY_COUNT}" ; i++ ));
      do
        key="NODE_${INDEX}_KEY_${i}";
        PUBKEY=$(echo ${!key} | jq '.pubkey' -j);
        echo ${!key} > "/data/validator/keys/0x${PUBKEY}.json";
        secret="NODE_${INDEX}_SECRET_${i}";
        echo ${!secret} > "/data/validator/secrets/0x${PUBKEY}.txt";
        echo "Added 0x${PUBKEY}";
      done
    volumeMounts:
      - name: storage
        mountPath: "/data"
        readOnly:
    env:
      - name: NODE_0_KEY_COUNT
        value: "1"
      - name: NODE_0_SECRET_0
        valueFrom:
          secretKeyRef:
            # Name of the secret that will be generated for you. This is normally `${RELEASE-name}-env`
            # You might need to change this
            name: teku-env
            key: NODE_0_SECRET_0
      - name: NODE_0_KEY_0
        valueFrom:
          secretKeyRef:
            # See comment on the previous secretKeyRef
            name: teku-env
            key: NODE_0_KEY_0

extraArgs:
  - --validator-keys=/data/validator/keys:/data/validator/secrets
  - --beacon-node-api-endpoint=http://teku-beacon:5051
  - --network=auto

livenessProbe:
  tcpSocket: null
  httpGet:
    path: /metrics
    port: 8008

readinessProbe:
  tcpSocket: null
  httpGet:
    path: /metrics
    port: 8008

secretEnv:
  # Note: Never publish any of your production secrets online. These are just used for testing purposes.
  NODE_0_SECRET_0: Mrc085nWbjTc1mhAPt_Ukj4m_vui2iUQWr6TwNRq_4k=
  NODE_0_KEY_0: {"crypto":{"checksum":{"function":"sha256","message":"7bbdd8cda652d792dceae7477b911106296620c44a6c1d0356c6ff52daca2b5b","params":{}},"cipher":{"function":"aes-128-ctr","message":"689f5c97fad87665e2fe8acbc0aad91bdc85de7756ebdc496f1373bae01c02c8","params":{"iv":"7b8e1ed4480dee19cbb1528394ad2095"}},"kdf":{"function":"pbkdf2","message":"","params":{"c":262144,"dklen":32,"prf":"hmac-sha256","salt":"bb560dfbb56016e0630e4415b74d86ede9090c0545854ed7c0ad921047a39cef"}}},"path":"","pubkey":"8e48cbd28d25847a6b122a62179b6ac11ee7877a4c489799918308e6252b7f6601f969179ac7465e256c01815b71b6d1","uuid":"f13ece4f-d57e-4789-accc-ad50f0fef882","version":4}

```
