
# lodestar

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Lodestar is a open-source TypeScript implementation of the Ethereum consensus engine.

**Homepage:** <https://lodestar.chainsafe.io/>

## Source Code

* <https://github.com/ChainSafe/lodestar>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| customCommand | list | `[]` | Command replacement for the lodestar container |
| extraArgs | list | `[]` | Extra args for the lodestar container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | lodestar container pull policy |
| image.repository | string | `"chainsafe/lodestar"` | lodestar container image repository |
| image.tag | string | `"latest"` | lodestar container image tag |
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
| livenessProbe | object | See `values.yaml` | Liveness probe |
| mode | string | `"beacon"` | Mode can be 'beacon' or 'validator' |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| p2pNodePort.enabled | bool | `false` | Expose P2P port via NodePort |
| p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` | Container pull policy |
| p2pNodePort.initContainer.image.repository | string | `"lachlanevenson/k8s-kubectl"` | Container image to fetch nodeport information |
| p2pNodePort.initContainer.image.tag | string | `"v1.21.3"` | Container tag |
| p2pNodePort.portsOverwrite | object | See `values.yaml` for example | Overwrite a port for specific replicas |
| p2pNodePort.startAt | int | `31000` | Port used to start |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"20Gi"` | Requested size for volume claim template |
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
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Update stategy for the Statefulset |
| updateStrategy.type | string | `"RollingUpdate"` | Update stategy type |

# Examples

## Beacon node on the Prater testnet connected to Goerli via Infura

```yaml
mode: "beacon"

extraArgs:
  - --network=prater
  - --eth1.providerUrls=https://goerli.infura.io/v3/<YOUR_API_SECRET>
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

This example runs a validator on the prater network that targets a pre-existing `lodestar-beacon`
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
        echo "====";
        key="NODE_${INDEX}_KEY_${i}";
        PUBKEY=$(echo ${!key} | jq '.pubkey' -j);
        mkdir "/data/validator/keys/0x${PUBKEY}";
        echo ${!key} > "/data/validator/keys/0x${PUBKEY}/voting-keystore.json";
        secret="NODE_${INDEX}_SECRET_${i}";
        echo ${!secret} > "/data/validator/secrets/0x${PUBKEY}";
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
            name: lodestar-env
            key: NODE_0_SECRET_0
      - name: NODE_0_KEY_0
        valueFrom:
          secretKeyRef:
            # See comment on the previous secretKeyRef
            name: lodestar-env
            key: NODE_0_KEY_0

extraArgs:
  - --network=prater
  - --keystoresDir=/data/validator/keys
  - --secretsDir=/data/validator/secrets
  - --server=http://lodestar-beacon:9596

livenessProbe: null

readinessProbe: null

secretEnv:
  # Note: Never publish any of your production secrets online. These are just used for testing purposes.
  NODE_0_SECRET_0: Mrc085nWbjTc1mhAPt_Ukj4m_vui2iUQWr6TwNRq_4k=
  NODE_0_KEY_0: {"crypto":{"checksum":{"function":"sha256","message":"7bbdd8cda652d792dceae7477b911106296620c44a6c1d0356c6ff52daca2b5b","params":{}},"cipher":{"function":"aes-128-ctr","message":"689f5c97fad87665e2fe8acbc0aad91bdc85de7756ebdc496f1373bae01c02c8","params":{"iv":"7b8e1ed4480dee19cbb1528394ad2095"}},"kdf":{"function":"pbkdf2","message":"","params":{"c":262144,"dklen":32,"prf":"hmac-sha256","salt":"bb560dfbb56016e0630e4415b74d86ede9090c0545854ed7c0ad921047a39cef"}}},"path":"","pubkey":"8e48cbd28d25847a6b122a62179b6ac11ee7877a4c489799918308e6252b7f6601f969179ac7465e256c01815b71b6d1","uuid":"f13ece4f-d57e-4789-accc-ad50f0fef882","version":4}

```
