# sourcify-server

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Sourcify is a Solidity source code and metadata verification tool. This runs the Sourcify Web UI.

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
| env.AUTH0_AUDIENCE | string | `"https://sourcify.dev"` |  |
| env.AUTH0_CLIENTID | string | `"epipuQWJL67dVggPvxNmAy40ggzNum9F"` |  |
| env.AUTH0_ISSUERBASEURL | string | `"https://dev-htkreq1l71u1hn5l.us.auth0.com"` |  |
| env.AUTH0_TOKENSIGNINGALG | string | `"RS256"` |  |
| env.IPFS_GATEWAY | string | `"https://ipfs.io/ipfs/"` |  |
| env.REPOSITORY_PATH | string | `"/data/repository"` |  |
| env.REPOSITORY_SERVER_URL | string | `"https://repo.sourcify.dev"` |  |
| env.SERVER_PORT | string | `"80"` |  |
| env.SOLC_REPO | string | `"/data/compilers/solc"` |  |
| env.SOLJSON_REPO | string | `"/data/compilers/soljson"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ethereum/source-verify"` |  |
| image.tag | string | `"server-latest"` |  |
| ingress.main.enabled | bool | `false` |  |
| persistence.compilers.enabled | bool | `true` |  |
| persistence.compilers.existingClaim | string | `"sourcify-compilers"` |  |
| persistence.compilers.mountPath | string | `"/data/compilers"` |  |
| persistence.compilers.type | string | `"pvc"` |  |
| persistence.data.enabled | bool | `true` |  |
| persistence.data.existingClaim | string | `"sourcify-repository"` |  |
| persistence.data.mountPath | string | `"/data/repository"` |  |
| persistence.data.type | string | `"pvc"` |  |
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
| secrets.secretenv.enabled | bool | `true` |  |
| secrets.secretenv.stringData.SESSION_SECRET | string | `"yoursessionsecret"` |  |
| service.main.enabled | bool | `true` |  |
| service.main.ports.http.port | int | `80` |  |
| service.main.primary | bool | `true` |  |
| service.main.type | string | `"ClusterIP"` |  |
