{{/*
Expand the name of the chart.
*/}}
{{- define "splitoor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "splitoor.fullname" -}}
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
{{- define "splitoor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "splitoor.labels" -}}
helm.sh/chart: {{ include "splitoor.chart" . }}
{{ include "splitoor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "splitoor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "splitoor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "splitoor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "splitoor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "splitoor.metricsPort" -}}
{{ (split ":" .Values.config.metricsAddr)._1 | default ":9090" }}
{{- end -}}

{{- define "splitoor.healthCheckPort" -}}
{{ (split ":" .Values.config.healthCheckAddr)._1 | default ":9191" }}
{{- end -}}

{{- define "splitoor.pprofPort" -}}
{{- if .Values.config.pprofAddr -}}
{{ (split ":" .Values.config.pprofAddr)._1 | default "6060" }}
{{- end -}}
{{- end -}}
