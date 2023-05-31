{{/*
# Default command
*/}}
{{- define "erigon.defaultCommand" -}}
{{- tpl .Values.defaultCommandTemplate . }}
{{- end }}


{{/*
# Default command
*/}}
{{- define "erigon.defaultCommandRPCDaemon" -}}
{{- tpl .Values.defaultCommandRPCDaemonTemplate . }}
{{- end }}
