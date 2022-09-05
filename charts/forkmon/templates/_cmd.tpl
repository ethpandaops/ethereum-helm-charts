{{/*
# Default command
*/}}
{{- define "forkmon.defaultCommand" -}}
- sh
- -ac
- >
  cp -r /www /data/. && cd /data/ && /usr/local/bin/nodemonitor /data/config.toml
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}