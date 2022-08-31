{{/*
# Beacon command
*/}}
{{- define "lodestar.beaconCommand" -}}
- sh
- -ac
- >-
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  node /usr/app/node_modules/.bin/lodestar
  beacon
  --dataDir=/data
  --discv5
  --listenAddress=0.0.0.0
  --port={{ include "lodestar.p2pPort" . }}
{{- if .Values.p2pNodePort.enabled }}
  --enr.ip=$EXTERNAL_IP
  --enr.tcp=$EXTERNAL_PORT
  --enr.udp=$EXTERNAL_PORT
{{- else }}
  --enr.ip=$(POD_IP)
  --enr.tcp={{ include "lodestar.p2pPort" . }}
  --enr.udp={{ include "lodestar.p2pPort" . }}
{{- end }}
  --rest
  --rest.address=0.0.0.0
  --rest.port={{ .Values.httpPort }}
  --jwt-secret=/data/jwt.hex
  --metrics
  --metrics.address=0.0.0.0
  --metrics.port={{ .Values.metricsPort }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}


{{/*
# Validator command
*/}}
{{- define "lodestar.validatorCommand" -}}
- sh
- -ac
- >-
  node /usr/app/node_modules/.bin/lodestar
  validator
  --dataDir=/data
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
