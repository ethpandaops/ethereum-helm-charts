{{/*
# Default command
*/}}
{{- define "nethermind.defaultCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec /nethermind/Nethermind.Runner
  --datadir=/data
  --KeyStore.KeyStoreDirectory=/data/nethermind/keystore
  --Network.LocalIp=$(POD_IP)
{{- if .Values.p2pNodePort.enabled }}
  --Network.ExternalIp==$EXTERNAL_IP
  --Network.P2PPort=$EXTERNAL_PORT
  --Network.DiscoveryPort=$EXTERNAL_PORT
{{- else }}
  --Network.ExternalIp=$(POD_IP)
  --Network.P2PPort={{ include "nethermind.p2pPort" . }}
  --Network.DiscoveryPort={{ include "nethermind.p2pPort" . }}
{{- end }}
  --JsonRpc.Enabled=true
  --JsonRpc.Host=0.0.0.0
  --JsonRpc.Port={{ include "nethermind.httpPort" . }}
  --Init.WebSocketsEnabled=true
  --JsonRpc.WebSocketsPort={{ include "nethermind.httpPort" . }}
  --JsonRpc.JwtSecretFile=/data/jwt.hex
  --JsonRpc.EngineHost=0.0.0.0
  --JsonRpc.EnginePort={{ include "nethermind.authPort" . }}
  --JsonRpc.EnabledModules=["net","eth","subscribe","engine","web3","client"]
  --Metrics.Enabled=true
  --Metrics.NodeName=$(POD_NAME)
  --Metrics.ExposePort={{ include "nethermind.metricsPort" . }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
