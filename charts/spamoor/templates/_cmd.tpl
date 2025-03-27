{{/*
# Beacon command
*/}}
{{- define "spamoor.containerArgs" -}}
{{- tpl .Values.defaultSpamoorArgsTemplate . }}
{{- end }}