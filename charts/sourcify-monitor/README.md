# sourcify-monitor

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Sourcify is a Solidity source code and metadata verification tool. This runs the chain monitor.

**Homepage:** <https://github.com/ethereum/sourcify/>

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
| controller.type | string | `"statefulset"` |  |
| env.MONITOR_FETCH_TIMEOUT | int | `300000` |  |
| env.MONITOR_PORT | string | `"80"` |  |
| env.REPOSITORY_PATH | string | `"/data/repository"` |  |
| env.SOLC_REPO | string | `"/data/compilers/solc"` |  |
| env.SOLJSON_REPO | string | `"/data/compilers/soljson"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ethereum/source-verify"` |  |
| image.tag | string | `"monitor-latest"` |  |
| ingress.main.enabled | bool | `false` |  |
| persistence.compilers.enabled | bool | `true` |  |
| persistence.compilers.existingClaim | string | `"sourcify-compilers"` |  |
| persistence.compilers.mountPath | string | `"/data/compilers"` |  |
| persistence.compilers.readOnly | bool | `true` |  |
| persistence.compilers.type | string | `"pvc"` |  |
| persistence.data.enabled | bool | `true` |  |
| persistence.data.existingClaim | string | `"sourcify-repository"` |  |
| persistence.data.mountPath | string | `"/data/repository"` |  |
| persistence.data.type | string | `"pvc"` |  |
| probes.liveness.enabled | bool | `false` |  |
| probes.readiness.enabled | bool | `false` |  |
| probes.startup.enabled | bool | `false` |  |
| secrets.secretenv.enabled | bool | `false` |  |
| secrets.secretenv.stringData | object | `{}` |  |
| service.main.enabled | bool | `false` |  |
