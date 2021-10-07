{{/*
Expand the name of the chart.
*/}}
{{- define "nimbus-eth2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nimbus-eth2.fullname" -}}
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
{{- define "nimbus-eth2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nimbus-eth2.labels" -}}
helm.sh/chart: {{ include "nimbus-eth2.chart" . }}
{{ include "nimbus-eth2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nimbus-eth2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nimbus-eth2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "nimbus-eth2.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nimbus-eth2.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "nimbus-eth2.p2pPort" -}}
{{- printf "9000" -}}
{{- end -}}

{{- define "nimbus-eth2.rpcPort" -}}
{{- printf "9190" -}}
{{- end -}}

{{- define "nimbus-eth2.metricsPort" -}}
{{- printf "8008" -}}
{{- end -}}
