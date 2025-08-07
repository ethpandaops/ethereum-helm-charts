{{/*
Expand the name of the chart.
*/}}
{{- define "besu.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "besu.fullname" -}}
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
{{- define "besu.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "besu.labels" -}}
helm.sh/chart: {{ include "besu.chart" . }}
{{ include "besu.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "besu.selectorLabels" -}}
app.kubernetes.io/name: {{ include "besu.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "besu.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "besu.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the cluster role.
It needs to be namespace prefixed to avoid naming conflicts when using the same deployment name across namespaces.
*/}}
{{- define "besu.clusterRoleName" -}}
{{ .Release.Namespace }}-{{ include "besu.fullname" . }}
{{- end }}

{{- define "besu.p2pPort" -}}
{{- if .Values.p2pNodePort.enabled }}
{{- print .Values.p2pNodePort.port }}
{{- else }}
{{- print .Values.p2pPort }}
{{- end }}
{{- end -}}

{{- define "besu.replicas" -}}
{{- if and (.Values.p2pNodePort.enabled) (gt (int .Values.replicas)  1) }}
{{- print 1 }}
{{ else }}
{{- print .Values.replicas }}
{{- end }}
{{- end -}}

{{/*
Check if devnet is enabled based on network name or explicit setting
*/}}
{{- define "besu.devnetEnabled" -}}
{{- if or .Values.devnet.enabled (contains "devnet" .Values.network) }}
{{- print "true" }}
{{- else }}
{{- print "false" }}
{{- end }}
{{- end -}}

{{/*
Extract base name from network (e.g., "fusaka" from "fusaka-devnet-3")
*/}}
{{- define "besu.devnetBaseName" -}}
{{- if .Values.network }}
  {{- $parts := splitList "-" .Values.network }}
  {{- if gt (len $parts) 0 }}
    {{- index $parts 0 }}
  {{- end }}
{{- end }}
{{- end -}}

{{/*
Extract devnet name from network (e.g., "devnet-3" from "fusaka-devnet-3")
*/}}
{{- define "besu.devnetName" -}}
{{- if .Values.network }}
  {{- if contains "devnet" .Values.network }}
    {{- $parts := splitList "-" .Values.network }}
    {{- if gt (len $parts) 2 }}
      {{- printf "%s-%s" (index $parts 1) (index $parts 2) }}
    {{- else if gt (len $parts) 1 }}
      {{- index $parts 1 }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end -}}

{{/*
Get the devnet base URL
*/}}
{{- define "besu.devnetBaseUrl" -}}
{{- if .Values.devnet.baseUrl }}
  {{- .Values.devnet.baseUrl }}
{{- else if and .Values.network (contains "devnet" .Values.network) }}
  {{- $baseName := include "besu.devnetBaseName" . }}
  {{- if $baseName }}
    {{- printf "https://raw.githubusercontent.com/ethpandaops/%s-devnets/master/network-configs" $baseName }}
  {{- else }}
    {{- print "https://raw.githubusercontent.com/ethpandaops/fusaka-devnets/master/network-configs" }}
  {{- end }}
{{- else }}
  {{- print "https://raw.githubusercontent.com/ethpandaops/fusaka-devnets/master/network-configs" }}
{{- end }}
{{- end -}}

{{/*
Get the actual devnet name to use
*/}}
{{- define "besu.devnetNameResolved" -}}
{{- if .Values.devnet.name }}
  {{- .Values.devnet.name }}
{{- else }}
  {{- include "besu.devnetName" . }}
{{- end }}
{{- end -}}
