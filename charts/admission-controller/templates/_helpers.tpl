{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "admissionController.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "admissionController.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "admissionController.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Returns the namespace for installing components
*/}}
{{- define "admissionController.namespace" -}}
    {{- coalesce .Values.namespace .Values.global.clusterConfig.namespace .Release.Namespace -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "admissionController.labels" -}}
helm.sh/chart: {{ include "admissionController.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admissionController.selectorLabels" -}}
app.kubernetes.io/name: {{ include "admissionController.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Admission Controller Specific Options
*/}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "admissionController.webhook.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.webhook.name| trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.webhook.name | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "admissionController.webhook.defaultPodAnnotations" -}}
{{- toYaml (dict "prometheus.io/path" "/metrics" "prometheus.io/port" (quote .Values.webhook.http.port) "prometheus.io/scheme" "https" "prometheus.io/scrape" "true" "sidecar.istio.io/inject" "false") -}}
{{- end -}}

{{- define "admissionController.webhook.podAnnotations" -}}
{{- if .Values.webhook.podAnnotations }}
{{- .Values.webhook.podAnnotations | toYaml -}}
{{- else -}}
{{- include "admissionController.webhook.defaultPodAnnotations" . -}}
{{- end -}}
{{- end -}}

{{- define "admissionController.webhook.defaultSecurityContext" -}}
 {{- if (lt (int .Values.webhook.http.port) 1024) -}}
        {{- toYaml (dict "runAsUser" 0 "runAsNonRoot" false) -}}
    {{- else -}}
        {{- toYaml (dict "runAsUser" 1000 "runAsNonRoot" true) -}}
    {{- end -}}
{{- end -}}


{{/*
Common labels
*/}}
{{- define "admissionController.webhook.labels" -}}
{{ include "admissionController.labels" . }}
{{ include "admissionController.webhook.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admissionController.webhook.selectorLabels" -}}
{{ include "admissionController.selectorLabels" . }}
app.kubernetes.io/component: webhook
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "admissionController.webhook.serviceAccountName" -}}
    {{ default (include "admissionController.webhook.fullname" .) .Values.serviceAccounts.webhook.name }}
{{- end -}}

{{/*
Generate certificates for aggregated api server
*/}}

{{- $cert := genCA ( printf "%s.%s.svc" (include "admissionController.webhook.fullname" .) .Release.Namespace ) 3650 -}}

{{- define "admissionController.webhook.gen-certs" -}}
    {{- $ca := genCA (include "admissionController.webhook.fullname" .) 3650 -}}
    {{- if (and .Values.webhook.ssl.ca.cert .Values.webhook.ssl.ca.key) -}}
        {{- $ca = buildCustomCert (.Values.webhook.ssl.ca.cert | b64enc) (.Values.webhook.ssl.ca.key | b64enc) -}}
    {{- end -}}

    {{- $cn := printf "%s.%s.svc" (include "admissionController.webhook.fullname" .) .Release.Namespace -}}
    {{- $san := list $cn -}}
    {{- $cert := genSignedCert $cn nil $san 3650 $ca -}}

    {{- if (and .Values.webhook.ssl.cert .Values.webhook.ssl.key) -}}
        {{- printf "%s$%s$%s" (.Values.webhook.ssl.cert | b64enc) (.Values.webhook.ssl.key | b64enc) ($ca.Cert | b64enc) -}}
    {{- else -}}
        {{- printf "%s$%s$%s" ($cert.Cert | b64enc) ($cert.Key | b64enc) ($ca.Cert | b64enc) -}}
    {{- end -}}
{{- end -}}

{{/*
Allow overriding registry and repository for air-gapped environments
*/}}
{{- define "admissionController.webhook.image" -}}
{{- if .Values.webhook.image.overrideValue -}}
    {{- .Values.webhook.image.overrideValue -}}
{{- else -}}
    {{- $imageRegistry := .Values.webhook.image.registry -}}
    {{- $imageRepository := .Values.webhook.image.repository -}}
    {{- $imageTag := .Values.webhook.image.tag | default .Chart.AppVersion -}}
    {{- $imageDigest := .Values.webhook.image.digest -}}
    {{- $globalRegistry := (default .Values.global dict).imageRegistry -}}
    {{- $globalRegistry | default $imageRegistry | default "docker.io" -}} / {{- $imageRepository -}} {{- if $imageDigest -}} @ {{- $imageDigest -}} {{- else -}} : {{- $imageTag -}} {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Inline Scanner Service
*/}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "admissionController.scanner.fullname" -}}
{{- if .Values.scanner.fullnameOverride -}}
{{- .Values.scanner.fullnameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.scanner.name| trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.scanner.name | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "admissionController.scanner.labels" -}}
{{ include "admissionController.labels" . }}
{{ include "admissionController.scanner.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admissionController.scanner.selectorLabels" -}}
{{ include "admissionController.selectorLabels" . }}
app.kubernetes.io/component: scanner
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "admissionController.scanner.serviceAccountName" -}}
    {{ default (include "admissionController.scanner.fullname" .) .Values.serviceAccounts.scanner.name }}
{{- end -}}

{{/*
Generate certificates for aggregated api server
*/}}

{{- $cert := genCA ( printf "%s.%s.svc" (include "admissionController.scanner.fullname" .) .Release.Namespace ) 3650 -}}

{{- define "admissionController.scanner.gen-certs" -}}
{{- $ca := genCA (include "admissionController.scanner.fullname" .) 3650 -}}
{{- $cn := printf "%s.%s.svc" (include "admissionController.scanner.fullname" .) .Release.Namespace -}}
{{- $san := list $cn -}}
{{- $cert := genSignedCert $cn nil $san 3650 $ca -}}
{{- printf "%s$%s$%s" ($cert.Cert | b64enc) ($cert.Key | b64enc) ($ca.Cert | b64enc) -}}
{{- end -}}

{{/*
Allow overriding registry and repository for air-gapped environments
*/}}
{{- define "admissionController.scanner.image" -}}
{{- if .Values.scanner.image.overrideValue -}}
    {{- .Values.scanner.image.overrideValue -}}
{{- else -}}
    {{- $imageRegistry := .Values.scanner.image.registry -}}
    {{- $imageRepository := .Values.scanner.image.repository -}}
    {{- $imageTag := .Values.scanner.image.tag | default .Chart.AppVersion -}}
    {{- $imageDigest := .Values.scanner.image.digest -}}
    {{- $globalRegistry := (default .Values.global dict).imageRegistry -}}
    {{- $globalRegistry | default $imageRegistry | default "docker.io" -}} / {{- $imageRepository -}} {{- if $imageDigest -}} @ {{- $imageDigest -}} {{- else -}} : {{- $imageTag -}} {{- end -}}
{{- end -}}
{{- end -}}

{{/*
The following helper functions are all designed to use global values where
possible, but accept overrides from the chart values.
*/}}
{{- define "sysdig.secureAPIToken" -}}
    {{- required "A valid secureAPIToken is required" (.Values.sysdig.secureAPIToken | default .Values.global.sysdig.secureAPIToken) -}}
{{- end -}}

{{- define "sysdig.secureAPITokenSecret" -}}
    {{- .Values.sysdig.existingSecureAPITokenSecret | default .Values.global.sysdig.secureAPITokenSecret | default "" -}}
{{- end -}}

{{- define "clusterName" -}}
    {{- required "A valid cluster name is required" (.Values.clusterName | default .Values.global.clusterConfig.name) -}}
{{- end -}}

{{- define "scanner.httpProxy" -}}
    {{- .Values.scanner.httpProxy | default .Values.global.proxy.httpProxy | default "" -}}
{{- end -}}

{{- define "scanner.httpsProxy" -}}
    {{- .Values.scanner.httpsProxy | default .Values.global.proxy.httpsProxy | default "" -}}
{{- end -}}

{{- define "scanner.noProxy" -}}
    {{- .Values.scanner.noProxy | default .Values.global.proxy.noProxy | default "" -}}
{{- end -}}

{{- define "webhook.httpProxy" -}}
    {{- .Values.webhook.httpProxy | default .Values.global.proxy.httpProxy | default "" -}}
{{- end -}}

{{- define "webhook.httpsProxy" -}}
    {{- .Values.webhook.httpsProxy | default .Values.global.proxy.httpsProxy | default "" -}}
{{- end -}}

{{- define "webhook.noProxy" -}}
    {{- .Values.webhook.noProxy | default .Values.global.proxy.noProxy | default "" -}}
{{- end -}}
