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
  --rpc-http-port={{ include "besu.httpPort" . }}
  --rpc-http-cors-origins=*
  --rpc-ws-enabled
  --rpc-ws-host=0.0.0.0
  --rpc-ws-port={{ include "besu.wsPort" . }}
  --metrics-enabled
  --metrics-host=0.0.0.0
  --metrics-port={{ include "besu.metricsPort" . }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
