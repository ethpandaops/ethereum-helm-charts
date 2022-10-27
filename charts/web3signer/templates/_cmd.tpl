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
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}
