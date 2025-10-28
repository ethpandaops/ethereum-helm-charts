{{/*
# Default command
*/}}
{{- define "erigon.defaultCommand" -}}
{{- tpl .Values.defaultCommandTemplate . }}
{{- end }}
