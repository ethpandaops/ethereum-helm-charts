{{/*
Expand the name of the chart.
*/}}
{{- define "nethermind.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nethermind.fullname" -}}
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
{{- define "nethermind.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nethermind.labels" -}}
helm.sh/chart: {{ include "nethermind.chart" . }}
{{ include "nethermind.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nethermind.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nethermind.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "nethermind.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nethermind.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the cluster role.
It needs to be namespace prefixed to avoid naming conflicts when using the same deployment name across namespaces.
*/}}
{{- define "nethermind.clusterRoleName" -}}
{{ .Release.Namespace }}-{{ include "nethermind.fullname" . }}
{{- end }}

{{- define "nethermind.p2pPort" -}}
{{- if .Values.p2pNodePort.enabled }}
{{- print .Values.p2pNodePort.port }}
{{- else }}
{{- print .Values.p2pPort }}
{{- end }}
{{- end -}}

{{- define "nethermind.replicas" -}}
{{- if and (.Values.p2pNodePort.enabled) (gt (int .Values.replicas)  1) }}
{{- print 1 }}
{{ else }}
{{- print .Values.replicas }}
{{- end }}
{{- end -}}
