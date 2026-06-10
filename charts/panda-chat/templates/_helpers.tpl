{{/*
Expand the name of the chart.
*/}}
{{- define "panda-chat.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "panda-chat.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
The Hermes agent resources (deployment/service/secret/configmap/pvc) all
hang off this name so the front end can target a deterministic service.
*/}}
{{- define "panda-chat.hermesFullname" -}}
{{- printf "%s-hermes" (include "panda-chat.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "panda-chat.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "panda-chat.labels" -}}
helm.sh/chart: {{ include "panda-chat.chart" . }}
{{ include "panda-chat.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: agent
{{- end }}

{{- define "panda-chat.selectorLabels" -}}
app.kubernetes.io/name: {{ include "panda-chat.hermesFullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "panda-chat.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "panda-chat.hermesFullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Agent image reference. Tag defaults to the chart appVersion.
*/}}
{{- define "panda-chat.image" -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{ .Values.image.repository }}:{{ $tag }}
{{- end }}

{{/*
Secret holding the Hermes bearer (API_SERVER_KEY) and the LLM model key.
Mounted ONLY into the unprivileged hermes container.
*/}}
{{- define "panda-chat.secretName" -}}
{{- printf "%s-secret" (include "panda-chat.hermesFullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Secret holding the panda bot credentials (PANDA_BOT_USERNAME/TOKEN).
Mounted ONLY into the panda-server sidecar — never into hermes, which
executes LLM-driven shell commands and must not be able to read it.
*/}}
{{- define "panda-chat.pandaSecretName" -}}
{{- printf "%s-panda-secret" (include "panda-chat.hermesFullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "panda-chat.configMapName" -}}
{{- printf "%s-config" (include "panda-chat.hermesFullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "panda-chat.pvcName" -}}
{{- if .Values.persistence.existingClaim -}}
{{ .Values.persistence.existingClaim }}
{{- else -}}
{{ include "panda-chat.hermesFullname" . }}-data
{{- end }}
{{- end }}
