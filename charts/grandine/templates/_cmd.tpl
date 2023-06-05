{{/*
# Beacon command
*/}}
{{- define "grandine.beaconCommand" -}}
{{- tpl .Values.defaultBeaconCommandTemplate . }}
{{- end }}