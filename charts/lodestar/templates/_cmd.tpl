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
  --rootDir=/data/lodestar
  --network.discv5.bindAddr=/ip4/0.0.0.0/udp/{{ include "lodestar.p2pPort" . }}
  --network.localMultiaddrs=/ip4/0.0.0.0/tcp/{{ include "lodestar.p2pPort" . }}
{{- if .Values.p2pNodePort.enabled }}
  --enr.ip=$EXTERNAL_IP
  --enr.tcp=$EXTERNAL_PORT
  --enr.udp=$EXTERNAL_PORT
{{- else }}
  --enr.ip=$(POD_IP)
  --enr.tcp={{ include "lodestar.p2pPort" . }}
  --enr.udp={{ include "lodestar.p2pPort" . }}
{{- end }}
  --api.rest.enabled=true
  --api.rest.host=0.0.0.0
  --api.rest.port={{ include "lodestar.httpPort" . }}
  --metrics.enabled=true
  --metrics.listenAddr=0.0.0.0
  --metrics.serverPort={{ include "lodestar.metricsPort" . }}
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
  --rootDir=/data/lodestar
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
