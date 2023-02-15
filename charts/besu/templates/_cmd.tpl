{{/*
# Default command
*/}}
{{- define "besu.defaultCommand" -}}
{{- tpl .Values.defaultCommandTemplate . }}
{{- end }}
