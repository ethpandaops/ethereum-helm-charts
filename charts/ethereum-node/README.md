
# ethereum-node

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

This chart will run an execution and consensus layer ethereum node.

**Homepage:** <https://ethereum.org>

## Source Code

* <https://github.com/ethpandaops/ethereum-helm-charts>

## Requirements

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

Run mainnet geth-lighthouse combo with monitoring:

```yaml
##
## $ helm install mainnet-lighthouse-geth-0 ethereum-helm-charts/ethereum-node -f values.yaml
##

## Example values.yaml for geth-lighthouse on mainnet
geth:
  enabled: true
lighthouse:
  enabled: true
ethereum-metrics-exporter:
  enabled: true
```
