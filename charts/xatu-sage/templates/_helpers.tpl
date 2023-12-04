{{/*
Expand the name of the chart.
*/}}
{{- define "xatu-sage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "xatu-sage.fullname" -}}
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
{{- define "xatu-sage.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "xatu-sage.labels" -}}
helm.sh/chart: {{ include "xatu-sage.chart" . }}
{{ include "xatu-sage.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "xatu-sage.selectorLabels" -}}
app.kubernetes.io/name: {{ include "xatu-sage.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "xatu-sage.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "xatu-sage.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "xatu-sage.metricsPort" -}}
{{ (split ":" .Values.config.metricsAddr)._1 | default ":9090" }}
{{- end -}}

{{- define "xatu-sage.pprofPort" -}}
{{- if .Values.config.pprofAddr -}}
{{ (split ":" .Values.config.pprofAddr)._1 | default "6060" }}
{{- end -}}
{{- end -}}
