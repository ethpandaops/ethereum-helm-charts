{{/*
# Default command
*/}}
{{- define "beacon-metrics-gazer.defaultCommand" -}}
- >
  - /beacon-metrics-gazer
  - {{ .Values.endpoint }}
  - --ranges-file 
  - /data/ranges.yaml
  - --port 
  - "{{ .Values.httpPort }}"
  - --address
  - "0.0.0.0"
{{- range .Values.extraArgs }}
  {{ . }}
{{- end }}
{{- end }}