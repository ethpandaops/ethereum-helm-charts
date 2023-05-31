{{/*
# Default command
*/}}
{{- define "ethereumjs.defaultCommand" -}}
{{- tpl .Values.defaultCommandTemplate . }}
{{- end }}
