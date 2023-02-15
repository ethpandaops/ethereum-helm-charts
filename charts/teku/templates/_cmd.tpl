{{/*
# Beacon command
*/}}
{{- define "teku.beaconCommand" -}}
{{- tpl .Values.defaultBeaconCommandTemplate . }}
{{- end }}


{{/*
# Validator command
*/}}
{{- define "teku.validatorCommand" -}}
{{- tpl .Values.defaultValidatorCommandTemplate . }}
{{- end }}
