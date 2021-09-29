{{/*
# Beacon command
*/}}
{{- define "lighthouse.beaconCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec lighthouse
  beacon_node
  --datadir=/data
  --disable-upnp
  --disable-enr-auto-update
{{- if .Values.p2pNodePort.enabled }}
  --enr-address=$EXTERNAL_IP
  --enr-tcp-port=$EXTERNAL_PORT
  --enr-udp-port=$EXTERNAL_PORT
{{- else }}
  --enr-address=$(POD_IP)
  --enr-tcp-port={{ include "lighthouse.p2pPort" . }}
  --enr-udp-port={{ include "lighthouse.p2pPort" . }}
{{- end }}
  --listen-address=0.0.0.0
  --port={{ include "lighthouse.p2pPort" . }}
  --discovery-port={{ include "lighthouse.p2pPort" . }}
  --http
  --http-address=0.0.0.0
  --http-port={{ include "lighthouse.httpPort" . }}
  --metrics
  --metrics-address=0.0.0.0
  --metrics-port={{ include "lighthouse.metricsPort" . }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}


{{/*
# Validator command
*/}}
{{- define "lighthouse.validatorCommand" -}}
- sh
- -ac
- >
  exec lighthouse
  validator
  --datadir=/data
  --http
  --http-address=0.0.0.0
  --http-port={{ include "lighthouse.httpPort" . }}
  --unencrypted-http-transport
  --metrics
  --metrics-address=0.0.0.0
  --metrics-port={{ include "lighthouse.metricsPort" . }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}


{{/*
# Bootnode command
*/}}
{{- define "lighthouse.bootnodeCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec lighthouse
  boot_node
  --datadir=/data
  --listen-address=0.0.0.0
  --port={{ include "lighthouse.p2pPort" . }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- if .Values.p2pNodePort.enabled }}
  --enr-port=$EXTERNAL_PORT
  $EXTERNAL_IP
{{- else }}
  --enr-port={{ include "lighthouse.p2pPort" . }}
  $(POD_IP)
{{- end }}
{{- end }}
