{{/*
# Default command
*/}}
{{- define "geth.defaultCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec geth
  --datadir=/data
  --config=/config/geth.toml
{{- if .Values.p2pNodePort.enabled }}
  --nat=extip:$EXTERNAL_IP
  --port=$EXTERNAL_PORT
{{- else }}
  --nat=extip:$(POD_IP)
  --port={{ include "geth.p2pPort" . }}
{{- end }}
  --http
  --http.addr=0.0.0.0
  --http.port={{ include "geth.httpPort" . }}
  --http.vhosts=*
  --http.corsdomain=*
  --ws
  --ws.addr=0.0.0.0
  --ws.port={{ include "geth.wsPort" . }}
  --ws.origins=*
  --authrpc.jwtsecret=/data/jwt.hex
  --authrpc.addr=0.0.0.0
  --authrpc.port={{ include "geth.authPort" . }}
  --authrpc.vhosts=*
  --metrics
  --metrics.addr=0.0.0.0
  --metrics.port={{ include "geth.metricsPort" . }}
  --syncmode snap
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
