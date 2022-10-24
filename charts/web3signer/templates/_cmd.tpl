{{/*
# Default command
*/}}
{{- define "web3signer.defaultCommand" -}}
- sh
- -ac
- >
  /opt/web3signer/bin/web3signer 
  --config-file=/data/config.yaml 
  eth2
  --network={{ .Values.network }}
{{- if not .Values.individualKeys.enabled }}
  --keystores-path=/data/keys
  --keystores-password-file=/data/passwords/keystores.pass
{{- end }}
{{- if .Values.slashingProtectionDB.enabled }}
  --slashing-protection-db-url="jdbc:postgresql://localhost/web3signer"
  --slashing-protection-db-username=postgres
  --slashing-protection-db-password=password
{{- else }}
  --slashing-protection-enabled=false
{{- end }}
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
