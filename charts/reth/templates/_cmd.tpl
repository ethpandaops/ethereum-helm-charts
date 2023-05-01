{{/*
# Default command
*/}}
{{- define "reth.defaultCommand" -}}
{{- tpl .Values.defaultCommandTemplate . }}
{{- end }}
