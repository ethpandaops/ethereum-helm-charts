{{/*
Expand the name of the chart.
*/}}
{{- define "erigon.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "erigon.fullname" -}}
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
{{- define "erigon.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "erigon.labels" -}}
helm.sh/chart: {{ include "erigon.chart" . }}
{{ include "erigon.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "erigon.selectorLabels" -}}
app.kubernetes.io/name: {{ include "erigon.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "erigon.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "erigon.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "erigon.p2pPort" -}}
{{- if .Values.p2pNodePort.enabled }}
{{- print .Values.p2pNodePort.port }}
{{- else }}
{{- printf "30303" -}}
{{- end }}
{{- end -}}

{{- define "erigon.httpPort" -}}
{{- if .Values.httpPort }}
{{- print .Values.httpPort }}
{{- else }}
{{- printf "8545" -}}
{{- end -}}
{{- end -}}

{{- define "erigon.authPort" -}}
{{- if .Values.authPort }}
{{- print .Values.authPort }}
{{- else }}
{{- printf "8551" -}}
{{- end -}}
{{- end -}}

{{- define "erigon.metricsPort" -}}
{{- if .Values.metricsPort }}
{{- print .Values.metricsPort }}
{{- else }}
{{- printf "6060" -}}
{{- end -}}
{{- end -}}

{{- define "erigon.metricsPortRPCDaemon" -}}
{{- if .Values.metricsPortRPCDaemon }}
{{- print .Values.metricsPortRPCDaemon }}
{{- else }}
{{- printf "6061" -}}
{{- end -}}
{{- end -}}

{{- define "erigon.replicas" -}}
{{- if .Values.p2pNodePort.enabled }}
{{- print 1 }}
{{ else }}
{{- print .Values.replicas }}
{{- end}}
{{- end -}}
