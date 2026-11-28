{{/*
Expand the name of the chart.
*/}}
{{- define "upgradoor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "upgradoor.fullname" -}}
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
{{- define "upgradoor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "upgradoor.labels" -}}
helm.sh/chart: {{ include "upgradoor.chart" . }}
{{ include "upgradoor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "upgradoor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "upgradoor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "upgradoor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "upgradoor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Name of the data PersistentVolumeClaim
*/}}
{{/*
Endpoint-less Service that /metrics is routed to on the Ingress. Its labels do
not match the selector labels, so the ServiceMonitor skips it.
*/}}
{{- define "upgradoor.blackholeName" -}}
{{- printf "%s-blackhole" (include "upgradoor.fullname" . | trunc 53 | trimSuffix "-") }}
{{- end }}

{{- define "upgradoor.blackholeSelectorLabels" -}}
app.kubernetes.io/name: {{ include "upgradoor.blackholeName" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Name of the Secret holding the controller seed
*/}}
{{- define "upgradoor.controllerSeedSecretName" -}}
{{- default (printf "%s-controller-seed" (include "upgradoor.fullname" .)) .Values.controllerSeedExistingSecret }}
{{- end }}

{{/*
Name of the Secret holding the registry Docker config.json, empty when none
*/}}
{{- define "upgradoor.registryAuthSecretName" -}}
{{- if .Values.registry.existingSecret }}
{{- .Values.registry.existingSecret }}
{{- else if .Values.registry.auth }}
{{- printf "%s-registry-auth" (include "upgradoor.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Required values
*/}}
{{- define "upgradoor.validate" -}}
{{- if eq (empty .Values.controllerSeed) (empty .Values.controllerSeedExistingSecret) }}
{{- fail "upgradoor: set exactly one of controllerSeed and controllerSeedExistingSecret" }}
{{- end }}
{{- with .Values.controllerSeed }}
{{- if not (or (hasPrefix "<" (toString .)) (ge (len (toString .)) 32)) }}
{{- fail "upgradoor: controllerSeed must be at least 32 characters" }}
{{- end }}
{{- end }}
{{- if and .Values.registry.auth .Values.registry.existingSecret }}
{{- fail "upgradoor: set only one of registry.auth and registry.existingSecret" }}
{{- end }}
{{- end }}
