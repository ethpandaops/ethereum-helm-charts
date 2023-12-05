{{/*
Expand the name of the chart.
*/}}
{{- define "armiarma.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "armiarma.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "armiarma.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "armiarma.labels" -}}
helm.sh/chart: {{ include "armiarma.chart" . }}
{{ include "armiarma.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "armiarma.selectorLabels" -}}
app.kubernetes.io/name: {{ include "armiarma.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "armiarma.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "armiarma.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "armiarma.metricsPort" -}}
{{ .Values.metricsPort }}
{{- end -}}

{{- define "armiarma.ssePort" -}}
{{ .Values.ssePort }}
{{- end -}}

{{- define "armiarma.secretEnv" -}}
ARMIARMA_PORT: {{ tpl (.Values.p2pNodePort.port | toString) . |  b64enc }}
ARMIARMA_METRICS_PORT: {{ tpl (.Values.metricsPort | toString) . |  b64enc }}
ARMIARMA_SSE_PORT: {{ tpl (.Values.ssePort | toString) .  |  b64enc }}
{{- range $key, $value := .Values.secretEnv }}
{{ $key }}: {{ tpl (toString ($value | toYaml)) $ | b64enc }}
{{- end -}}
{{- end -}}

{{- define "armiarma.p2pPort" -}}
{{- print .Values.p2pNodePort.port }}
{{- end -}}
