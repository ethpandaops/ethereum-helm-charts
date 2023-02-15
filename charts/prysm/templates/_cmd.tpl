{{/*
# Beacon command
*/}}
{{- define "prysm.beaconCommand" -}}
{{- tpl .Values.defaultBeaconCommandTemplate . }}
{{- end }}


{{/*
# Validator command
*/}}
{{- define "prysm.validatorCommand" -}}
{{- tpl .Values.defaultValidatorCommandTemplate . }}
{{- end }}
