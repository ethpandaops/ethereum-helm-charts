{{/*
Expand the name of the chart.
*/}}
{{- define "xatu-server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "xatu-server.fullname" -}}
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
{{- define "xatu-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "xatu-server.labels" -}}
helm.sh/chart: {{ include "xatu-server.chart" . }}
{{ include "xatu-server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "xatu-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "xatu-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "xatu-server.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "xatu-server.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "xatu-server.httpPort" -}}
{{ (split ":" .Values.config.addr)._1 | default "8080" }}
{{- end }}

{{- define "xatu-server.metricsPort" -}}
{{ (split ":" .Values.config.metricsAddr)._1 | default "9090" }}
{{- end -}}

{{- define "xatu-server.pprofPort" -}}
{{- if .Values.config.pprofAddr -}}
{{ (split ":" .Values.config.pprofAddr)._1 | default "6060" }}
{{- end -}}
{{- end -}}
