{{/*
# Default command
*/}}
{{- define "nethermind.defaultCommand" -}}
{{- tpl .Values.defaultCommandTemplate . }}
{{- end }}
