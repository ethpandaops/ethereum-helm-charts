{{/*
# Beacon command
*/}}
{{- define "teku.beaconCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec /opt/teku/bin/teku
  --log-destination=CONSOLE
  --data-path=/data
  --p2p-enabled=true
  --p2p-port={{ .Values.p2pPort }}
{{- if .Values.p2pNodePort.enabled }}
  --p2p-advertised-ip=$EXTERNAL_IP
  --p2p-advertised-port=$EXTERNAL_PORT
{{- else }}
  --p2p-advertised-ip=$(POD_IP)
  --p2p-advertised-port={{ .Values.p2pPort }}
{{- end }}
  --rest-api-enabled=true
  --rest-api-interface=0.0.0.0
  --rest-api-host-allowlist=*
  --rest-api-port={{ .Values.httpPort }}
  --ee-jwt-secret-file=/data/jwt.hex
  --metrics-enabled=true
  --metrics-interface=0.0.0.0
  --metrics-host-allowlist=*
  --metrics-port={{ .Values.metricsPort }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}


{{/*
# Validator command
*/}}
{{- define "teku.validatorCommand" -}}
- sh
- -ac
- >
  exec /opt/teku/bin/teku validator-client
  --log-destination=CONSOLE
  --data-path=/data
  --metrics-enabled
  --metrics-interface=0.0.0.0
  --metrics-host-allowlist=*
  --metrics-port={{ .Values.metricsPort }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
