{{/*
# Default command
*/}}
{{- define "erigon.defaultCommand" -}}
- sh
- -ac
- >
{{- if .Values.p2pNodePort.enabled }}
  . /env/init-nodeport;
{{- end }}
  exec erigon
  --datadir=/data
{{- if .Values.p2pNodePort.enabled }}
  --nat=extip:$EXTERNAL_IP
  --port=$EXTERNAL_PORT
{{- else }}
  --nat=extip:$(POD_IP)
  --port={{ include "erigon.p2pPort" . }}
{{- end }}
  --http=false
  --private.api.addr=127.0.0.1:9090
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


{{/*
# Default command
*/}}
{{- define "erigon.defaultCommandRPCDaemon" -}}
- sh
- -ac
- >
  while ! nc -z 127.0.0.1 9090; do sleep 1; done;
  exec rpcdaemon
  --datadir=/data
  --private.api.addr=127.0.0.1:9090
  --txpool.api.addr=127.0.0.1:9090
  --http.addr=0.0.0.0
  --http.port={{ .Values.httpPort }}
  --http.vhosts=*
  --metrics
  --metrics.addr=0.0.0.0
  --metrics.port={{ .Values.metricsPortRPCDaemon }}
{{- range .Values.extraArgsRPCDaemon }}
  {{ . }}
{{- end }}
{{- end }}
