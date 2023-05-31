{{/*
# Beacon command
*/}}
{{- define "nimbus.defaultCommand" -}}
{{- tpl .Values.defaultCommandTemplate . }}
{{- end }}
