{{/*
Expand the name of the chart.
*/}}
{{- define "dshackle.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "dshackle.fullname" -}}
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
{{- define "dshackle.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "dshackle.labels" -}}
helm.sh/chart: {{ include "dshackle.chart" . }}
{{ include "dshackle.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "dshackle.selectorLabels" -}}
app.kubernetes.io/name: {{ include "dshackle.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "dshackle.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "dshackle.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "dshackle.gRPCPort" -}}
{{- printf "2449" -}}
{{- end -}}

{{- define "dshackle.httpPort" -}}
{{- printf "8545" -}}
{{- end -}}

{{- define "dshackle.metricsPort" -}}
{{- printf "8081" -}}
{{- end -}}

{{- define "dshackle.healthPort" -}}
{{- printf "8082" -}}
{{- end -}}
