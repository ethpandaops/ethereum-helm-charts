{{/*
# Beacon command
*/}}
{{- define "nimbus.defaultCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec {{ .Values.defaultBinaryPath }}
  --data-dir=/data
  --enr-auto-update=false
{{- if .Values.p2pNodePort.enabled }}
  --nat=extip:$EXTERNAL_IP
  --udp-port=$EXTERNAL_PORT
  --tcp-port=$EXTERNAL_PORT
{{- else }}
  --nat=extip:$(POD_IP)
  --udp-port={{ include "nimbus.p2pPort" . }}
  --tcp-port={{ include "nimbus.p2pPort" . }}
{{- end }}
  --rest=true
  --rest-address=0.0.0.0
  --rest-port={{ .Values.httpPort }}
  --jwt-secret=/data/jwt.hex
  --metrics=true
  --metrics-address=0.0.0.0
  --metrics-port={{ .Values.metricsPort }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
