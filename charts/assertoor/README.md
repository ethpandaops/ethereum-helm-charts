
# assertoor

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Testing tool that is capable of doing actions and checking conditions on ethereum pos networks.

**Homepage:** <https://github.com/ethpandaops/assertoor>

## Source Code

* <https://github.com/ethpandaops/assertoor>

# Usage

Usage: assertoor --config config.yaml

Helper:
```shell
Usage of ./assertoor:
--config string
    Path to the assertoor config file
```

Example Configuration:
```yaml
endpoints:
  - name: node1
    executionUrl: "http://execution-node:8545"
    consensusUrl: "http://beacon-node:5052"

globalVariables:
  walletPrivkey: "feedbeef12340000feedbeef12340000feedbeef12340000feedbeef12340000"

assertoorTests:
  - file: "https://raw.githubusercontent.com/ethpandaops/assertoor-test/master/assertoor-tests/block-proposal-check.yaml"
    name: "Custom Block proposal check"
    timeout: 48h
    config:
      validatorPairNames: ["geth", "besu"]
    schedule:
      cron:
        - "0 */2 * * *" # every 2 hours
      startup: true
  - file: "https://raw.githubusercontent.com/ethpandaops/assertoor-test/master/assertoor-tests/stability-check.yaml"
  - file: "https://raw.githubusercontent.com/ethpandaops/assertoor-test/master/assertoor-tests/all-opcodes-test.yaml"
  - file: "https://raw.githubusercontent.com/ethpandaops/assertoor-test/master/assertoor-tests/validator-lifecycle-test-small.yaml"

```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the StatefulSet |
| assertoorApiEnabled | bool | `true` | Enable assertoor API |
| assertoorFrontendEnabled | bool | `true` | Enable assertoor UI |
| assertoorTests | list | `[]` | assertoor test configurations -- file is the only required field. All other fields default to the values provided in the test file, but can be overriden if needed. |
| config | string | See `values.yaml` | Config file |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `["--config=/data/assertoor-config.yaml"]` | Custom args for the assertoor container |
| customCommand | list | `[]` | Command replacement for the assertoor container |
| endpoints | list | `[{"consensusHeaders":{"X-Test":"test","Y-Test":"test2"},"consensusUrl":"http://beacon-node:5052","executionHeaders":{"X-Test":"test","Y-Test":"test2"},"executionUrl":"http://execution-node:8545","name":"default-endpoint"}]` | An array of endpoints to use for assertoor -- executionUrl & consensusUrl are the only required fields |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| globalVariables | object | `{"walletPrivkey":"feedbeef12340000feedbeef12340000feedbeef12340000feedbeef12340000"}` | global assertoor variables -- global variables are passed to all tests. |
| httpPort | int | `8080` | HTTP port for assertoor interface |
| image.pullPolicy | string | `"IfNotPresent"` | assertoor container pull policy |
| image.repository | string | `"ethpandaops/assertoor"` | assertoor container image repository |
| image.tag | string | `"latest"` | assertoor container image tag |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| resources | object | `{}` | Resource requests and limits |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| validatorNamesInventory | string | `""` | This can be a url here for example: -- "https://config.dencun-devnet-8.ethpandaops.io/api/v1/nodes/validator-ranges" -- If you want to use a local range file define it in the values.yaml validatorNamesRanges section |
| validatorNamesRanges | string | `"0-1: test\n"` |  |
