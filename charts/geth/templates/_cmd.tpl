{{/*
# Default command
*/}}
{{- define "geth.defaultCommand" -}}
{{- tpl .Values.defaultCommandTemplate . }}
{{- end }}
