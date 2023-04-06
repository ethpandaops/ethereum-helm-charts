
# ethereum-node

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

This chart acts as an umbrella chart and allows to run a ethereum execution and consensus layer client. It's also able to deploy optional monitoring applications.

**Homepage:** <https://ethereum.org>

## Source Code

* <https://github.com/ethpandaops/ethereum-helm-charts>

## Subcharts
| Repository | Name | Version |
|------------|------|---------|
| file://../besu | besu | 1.0.2 |
| file://../erigon | erigon | 1.0.2 |
| file://../ethereum-metrics-exporter | ethereum-metrics-exporter | 0.1.3 |
| file://../geth | geth | 1.0.2 |
| file://../lighthouse | lighthouse | 1.0.2 |
| file://../lodestar | lodestar | 1.0.2 |
| file://../nethermind | nethermind | 1.0.2 |
| file://../nimbus | nimbus | 1.0.2 |
| file://../prysm | prysm | 1.0.2 |
| file://../teku | teku | 1.0.2 |
| file://../xatu-sentry | xatu-sentry | 0.0.6 |

# Examples

Run mainnet nimbus/geth combo with monitoring:

```yaml
##
## $ helm install goerli-nimbus-geth-0 ethereum-helm-charts/ethereum-node -f values.yaml
##

## Example values.yaml for geth-lighthouse on mainnet
global:
  main:
    network: "goerli"
  checkpointSync:
    enabled: true

# Client pairs
geth:
  enabled: true
nimbus:
  enabled: true

# Monitoring
ethereum-metrics-exporter:
  enabled: true
```
