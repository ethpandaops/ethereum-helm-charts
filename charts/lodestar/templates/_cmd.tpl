{{/*
# Beacon command
*/}}
{{- define "lodestar.beaconCommand" -}}
{{- tpl .Values.defaultBeaconCommandTemplate . }}
{{- end }}


{{/*
# Validator command
*/}}
{{- define "lodestar.validatorCommand" -}}
{{- tpl .Values.defaultValidatorCommandTemplate . }}
{{- end }}
