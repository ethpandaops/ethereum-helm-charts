{{/*
Expand the name of the chart.
*/}}
{{- define "nimbus.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nimbus.fullname" -}}
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
{{- define "nimbus.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nimbus.labels" -}}
helm.sh/chart: {{ include "nimbus.chart" . }}
{{ include "nimbus.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nimbus.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nimbus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "nimbus.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nimbus.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "nimbus.p2pPort" -}}
{{- if .Values.p2pNodePort.enabled }}
{{- print .Values.p2pNodePort.port }}
{{- else }}
{{- printf "9000" -}}
{{- end }}
{{- end -}}

{{- define "nimbus.restPort" -}}
{{- if .Values.restPort }}
{{- print .Values.restPort }}
{{- else }}
{{- printf "5052" -}}
{{- end -}}
{{- end -}}

{{- define "nimbus.metricsPort" -}}
{{- if .Values.metricsPort }}
{{- print .Values.metricsPort }}
{{- else }}
{{- printf "8008" -}}
{{- end -}}
{{- end -}}

{{- define "nimbus.replicas" -}}
{{- if .Values.p2pNodePort.enabled }}
{{- print 1 }}
{{ else }}
{{- print .Values.replicas }}
{{- end}}
{{- end -}}
