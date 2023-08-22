# sourcify-docs

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Sourcify is a Solidity source code and metadata verification tool. This runs the documentation web server.

**Homepage:** <https://github.com/sourcifyeth/docs>

## Requirements

Kubernetes: `>=1.22.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 1.5.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.replicas | int | `1` |  |
| controller.strategy | string | `"RollingUpdate"` |  |
| controller.type | string | `"deployment"` |  |
| env | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"skylenet/sourcify-docs"` |  |
| image.tag | string | `"main-d2f67ed"` |  |
| ingress.main.enabled | bool | `false` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.failureThreshold | int | `3` |  |
| probes.liveness.spec.initialDelaySeconds | int | `0` |  |
| probes.liveness.spec.periodSeconds | int | `10` |  |
| probes.liveness.spec.timeoutSeconds | int | `1` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.failureThreshold | int | `3` |  |
| probes.readiness.spec.initialDelaySeconds | int | `0` |  |
| probes.readiness.spec.periodSeconds | int | `10` |  |
| probes.readiness.spec.timeoutSeconds | int | `1` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.spec.failureThreshold | int | `30` |  |
| probes.startup.spec.initialDelaySeconds | int | `0` |  |
| probes.startup.spec.periodSeconds | int | `5` |  |
| probes.startup.spec.timeoutSeconds | int | `1` |  |
| secrets.secretenv.enabled | bool | `false` |  |
| secrets.secretenv.stringData | object | `{}` |  |
| service.main.enabled | bool | `true` |  |
| service.main.ports.http.port | int | `80` |  |
| service.main.primary | bool | `true` |  |
| service.main.type | string | `"ClusterIP"` |  |
