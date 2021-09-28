# Lighthouse Helm Chart

This helm chart allows you to run [lighthouse](https://github.com/sigp/lighthouse) as a beacon or validator node as ethereum's consensus layer within a kubernetes cluster.

# Examples

## Beacon node on the Prater testnet connected to Goerli via Infura

```yaml
mode: "beacon"
extraArgs:
  - --network=prater
  - --eth1-endpoints=https://goerli.infura.io/v3/<YOUR_API_SECRET>
```
