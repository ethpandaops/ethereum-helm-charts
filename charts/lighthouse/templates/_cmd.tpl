{{/*
# Beacon command
*/}}
{{- define "lighthouse.beaconCommand" -}}
{{- tpl .Values.defaultBeaconCommandTemplate . }}
{{- end }}


{{/*
# Validator command
*/}}
{{- define "lighthouse.validatorCommand" -}}
{{- tpl .Values.defaultValidatorCommandTemplate . }}
{{- end }}


{{/*
# Bootnode command
*/}}
{{- define "lighthouse.bootnodeCommand" -}}
{{- tpl .Values.defaultBootnodeCommandTemplate . }}
{{- end }}
