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
  {{- if not (contains "--nat=" (.Values.extraArgs | join ",")) }}
  --nat=extip:$EXTERNAL_IP
  {{- end }}
  {{- if not (contains "--port=" (.Values.extraArgs | join ",")) }}
  --port=$EXTERNAL_PORT
  {{- end }}
{{- else }}
  {{- if not (contains "--nat=" (.Values.extraArgs | join ",")) }}
  --nat=extip:$(POD_IP)
  {{- end }}
  {{- if not (contains "--port=" (.Values.extraArgs | join ",")) }}
  --port={{ include "geth.p2pPort" . }}
  {{- end }}
{{- end }}
  --http
  --http.addr=0.0.0.0
  --http.port={{ .Values.httpPort }}
  --http.vhosts=*
  --http.corsdomain=*
  --ws
  --ws.addr=0.0.0.0
  --ws.port={{ .Values.wsPort }}
  --ws.origins=*
  --authrpc.jwtsecret=/data/jwt.hex
  --authrpc.addr=0.0.0.0
  --authrpc.port={{ .Values.authPort }}
  --authrpc.vhosts=*
  --metrics
  --metrics.addr=0.0.0.0
  --metrics.port={{ .Values.metricsPort }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
