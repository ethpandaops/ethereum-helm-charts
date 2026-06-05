{{/*
Expand the name of the chart.
*/}}
{{- define "authenticatoor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "authenticatoor.fullname" -}}
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
{{- define "authenticatoor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "authenticatoor.labels" -}}
helm.sh/chart: {{ include "authenticatoor.chart" . }}
{{ include "authenticatoor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "authenticatoor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "authenticatoor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "authenticatoor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "authenticatoor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Name of the Secret holding the active signing key.
If signing.existingSecret is set, that name is used instead.
*/}}
{{- define "authenticatoor.signingSecretName" -}}
{{- if .Values.signing.existingSecret -}}
{{ .Values.signing.existingSecret }}
{{- else -}}
{{ include "authenticatoor.fullname" . }}-signing
{{- end -}}
{{- end -}}

{{/*
Name of the chart-managed Secret holding previous public keys (for JWKS
rotation). Always managed by the chart; existingSecret is only for the
active key.
*/}}
{{- define "authenticatoor.previousKeysSecretName" -}}
{{ include "authenticatoor.fullname" . }}-previous-keys
{{- end -}}

{{/*
Name of the PersistentVolumeClaim holding the signing key.
*/}}
{{- define "authenticatoor.pvcName" -}}
{{- if .Values.persistence.existingClaim -}}
{{ .Values.persistence.existingClaim }}
{{- else -}}
{{ include "authenticatoor.fullname" . }}-keys
{{- end -}}
{{- end -}}

{{/*
Selects the source for the active key volume:
  "secret"   — chart-managed Secret (privateKeyPem) or existingSecret
  "pvc"      — PersistentVolumeClaim (deploy-and-go default)
  "emptydir" — fallback when nothing else is configured
*/}}
{{- define "authenticatoor.keySource" -}}
{{- if or .Values.signing.existingSecret .Values.signing.privateKeyPem -}}
secret
{{- else if .Values.persistence.enabled -}}
pvc
{{- else -}}
emptydir
{{- end -}}
{{- end -}}
