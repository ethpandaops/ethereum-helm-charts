{{/*
# Default command
*/}}
{{- define "besu.defaultCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec besu
  --data-path=/data
  --nat-method=NONE
{{- if .Values.p2pNodePort.enabled }}
  --p2p-host=$EXTERNAL_IP
  --p2p-port=$EXTERNAL_PORT
{{- else }}
  --p2p-host=$(POD_IP)
  --p2p-port={{ include "besu.p2pPort" . }}
{{- end }}
  --rpc-http-enabled
  --rpc-http-host=0.0.0.0
  --rpc-http-port={{ .Values.httpPort }}
  --rpc-http-cors-origins=*
  --rpc-ws-enabled
  --rpc-ws-host=0.0.0.0
  --rpc-ws-port={{ .Values.wsPort }}
  --host-allowlist=*
  --engine-jwt-secret=/data/jwt.hex
  --engine-rpc-port={{ .Values.authPort }}
  --engine-host-allowlist=*
  --metrics-enabled
  --metrics-host=0.0.0.0
  --metrics-port={{ .Values.metricsPort }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
