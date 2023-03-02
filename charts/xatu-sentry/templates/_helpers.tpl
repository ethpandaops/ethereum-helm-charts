{{/*
Expand the name of the chart.
*/}}
{{- define "xatu-sentry.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "xatu-sentry.fullname" -}}
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
{{- define "xatu-sentry.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "xatu-sentry.labels" -}}
helm.sh/chart: {{ include "xatu-sentry.chart" . }}
{{ include "xatu-sentry.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "xatu-sentry.selectorLabels" -}}
app.kubernetes.io/name: {{ include "xatu-sentry.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "xatu-sentry.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "xatu-sentry.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "xatu-sentry.metricsPort" -}}
{{ (split ":" .Values.config.metricsAddr)._1 | default ":9090" }}
{{- end -}}

{{- define "xatu-sentry.pprofPort" -}}
{{- if .Values.config.pprofAddr -}}
{{ (split ":" .Values.config.pprofAddr)._1 | default "6060" }}
{{- end -}}
{{- end -}}
