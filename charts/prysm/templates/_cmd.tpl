{{/*
# Beacon command
*/}}
{{- define "prysm.beaconCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec /app/cmd/beacon-chain/beacon-chain
  --accept-terms-of-use=true
  --datadir=/data
{{- if .Values.p2pNodePort.enabled }}
  --p2p-host-ip=$EXTERNAL_IP
  --p2p-tcp-port=$EXTERNAL_PORT
  --p2p-udp-port=$EXTERNAL_PORT
{{- else }}
  --p2p-host-ip=$(POD_IP)
  --p2p-tcp-port={{ include "prysm.p2pPort" . }}
  --p2p-udp-port={{ include "prysm.p2pPort" . }}
{{- end }}
  --rpc-host=0.0.0.0
  --rpc-port={{ include "prysm.rpcPort" . }}
  --grpc-gateway-host=0.0.0.0
  --grpc-gateway-port={{ include "prysm.httpPort" . }}
  --monitoring-host=0.0.0.0
  --monitoring-port={{ include "prysm.metricsPort" . }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}


{{/*
# Validator command
*/}}
{{- define "prysm.validatorCommand" -}}
- /app/cmd/validator/validator
- --accept-terms-of-use=true
- --datadir=/data
- --monitoring-host=0.0.0.0
- --monitoring-port={{ include "prysm.metricsPort" . }}
{{- range .Values.extraArgs }}
-  {{ . }}
{{- end }}
{{- end }}
