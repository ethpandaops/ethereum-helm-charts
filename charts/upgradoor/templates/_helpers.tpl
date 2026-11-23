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
{{- define "upgradoor.pvcName" -}}
{{- default (printf "%s-data" (include "upgradoor.fullname" .)) .Values.persistence.existingClaim }}
{{- end }}

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
One default setting value: whole numbers without exponent, maps and lists as JSON
*/}}
{{- define "upgradoor.settingValue" -}}
{{- if and (kindIs "float64" .) (eq (floor .) .) }}
{{- printf "%d" (int64 .) }}
{{- else if or (kindIs "map" .) (kindIs "slice" .) }}
{{- toJson . }}
{{- else }}
{{- toString . }}
{{- end }}
{{- end }}

{{/*
Required values
*/}}
{{- define "upgradoor.validate" -}}
{{- if not .Values.network }}
{{- fail "upgradoor: network is required" }}
{{- end }}
{{- if not .Values.signerPublicKey }}
{{- fail "upgradoor: signerPublicKey is required" }}
{{- end }}
{{- if not .Values.beaconEndpoints }}
{{- fail "upgradoor: beaconEndpoints is required" }}
{{- end }}
{{- if not (or .Values.authProviderUrl .Values.allowOpenApi) }}
{{- fail "upgradoor: set authProviderUrl, or allowOpenApi for an API without login" }}
{{- end }}
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

{{/*
Arguments of the upgradoor container
*/}}
{{- define "upgradoor.args" -}}
- run
- {{ printf "--listen=:%v" .Values.httpPort | quote }}
- --data-dir=/data
- {{ printf "--network=%s" .Values.network | quote }}
- {{ printf "--signer-public-key=%s" .Values.signerPublicKey | quote }}
- --controller-seed-file=/etc/upgradoor/controller-seed/seed
{{- range .Values.publicUrls }}
- {{ printf "--public-url=%s" . | quote }}
{{- end }}
{{- with .Values.authProviderUrl }}
- {{ printf "--auth-provider-url=%s" . | quote }}
{{- end }}
{{- if .Values.allowOpenApi }}
- --allow-open-api
{{- end }}
{{- range .Values.beaconEndpoints }}
- {{ printf "--beacon-endpoint=%s" . | quote }}
{{- end }}
{{- with .Values.validatorRangesUrl }}
- {{ printf "--validator-ranges-url=%s" . | quote }}
{{- end }}
{{- if .Values.trustForwardedHeaders }}
- --trust-forwarded-headers
{{- end }}
{{- if include "upgradoor.registryAuthSecretName" . }}
- --registry-auth-file=/etc/upgradoor/registry-auth/config.json
{{- end }}
{{- if .Values.registry.caBundle }}
- --registry-ca-file=/etc/upgradoor/registry-ca/ca.crt
{{- end }}
{{- range .Values.registry.plainHttp }}
- {{ printf "--registry-plain-http=%s" . | quote }}
{{- end }}
{{- if .Values.registry.allowPrivate }}
- --registry-allow-private
{{- end }}
{{- range $key, $value := .Values.settings }}
{{- if not (kindIs "invalid" $value) }}
- {{ printf "--default-setting=%s=%s" $key (include "upgradoor.settingValue" $value) | quote }}
{{- end }}
{{- end }}
- {{ printf "--log-level=%s" .Values.logging.level | quote }}
- {{ printf "--log-format=%s" .Values.logging.format | quote }}
{{- with .Values.extraArgs }}
{{ toYaml . }}
{{- end }}
{{- end }}
