{{/*
# Beacon command
*/}}
{{- define "nimbus-eth2.defaultCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec /usr/local/bin/nimbus_beacon_node
  --data-path=/data
  --validators-dir=/data/validator/keys
  --secrets-dir=/data/validator/secrets
  --enr-auto-update=false
{{- if .Values.p2pNodePort.enabled }}
  --nat=extip:$EXTERNAL_IP
  --udp-port=$EXTERNAL_PORT
  --tcp-port=$EXTERNAL_PORT
{{- else }}
  --nat=extip:$(POD_IP)
  --udp-port={{ include "nimbus-eth2.p2pPort" . }}
  --tcp-port={{ include "nimbus-eth2.p2pPort" . }}
{{- end }}
  --rpc=true
  --rpc-address=0.0.0.0
  --rpc-port={{ include "nimbus-eth2.rpcPort" . }}
  --metrics=true
  --metrics-address=0.0.0.0
  --metrics-port={{ include "nimbus-eth2.metricsPort" . }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
