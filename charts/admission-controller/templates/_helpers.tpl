{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "admission-controller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "admission-controller.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "admission-controller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "admission-controller.labels" -}}
helm.sh/chart: {{ include "admission-controller.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admission-controller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "admission-controller.name" . }}
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
{{- define "admission-controller.webhook.fullname" -}}
{{- if .Values.webhook.fullnameOverride -}}
{{- .Values.webhook.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.webhook.name| trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.webhook.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "admission-controller.webhook.labels" -}}
{{ include "admission-controller.labels" . }}
{{ include "admission-controller.webhook.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admission-controller.webhook.selectorLabels" -}}
{{ include "admission-controller.selectorLabels" . }}
app.kubernetes.io/component: webhook
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "admission-controller.webhook.serviceAccountName" -}}
    {{ default (include "admission-controller.webhook.fullname" .) .Values.serviceAccounts.webhook.name }}
{{- end -}}

{{/*
Generate certificates for aggregated api server
*/}}

{{- $cert := genCA ( printf "%s.%s.svc" (include "admission-controller.webhook.fullname" .) .Release.Namespace ) 3650 -}}

{{- define "admission-controller.webhook.gen-certs" -}}
    {{- $ca := genCA (include "admission-controller.webhook.fullname" .) 3650 -}}
    {{- if (and .Values.webhook.ssl.ca.cert .Values.webhook.ssl.ca.key) -}}
        {{- $ca = buildCustomCert (.Values.webhook.ssl.ca.cert | b64enc) (.Values.webhook.ssl.ca.key | b64enc) -}}
    {{- end -}}

    {{- $cn := printf "%s.%s.svc" (include "admission-controller.webhook.fullname" .) .Release.Namespace -}}
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
{{- define "admission-controller.webhook.image" -}}
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
{{- define "admission-controller.scanner.fullname" -}}
{{- if .Values.scanner.fullnameOverride -}}
{{- .Values.scanner.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.scanner.name| trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.scanner.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "admission-controller.scanner.labels" -}}
{{ include "admission-controller.labels" . }}
{{ include "admission-controller.scanner.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admission-controller.scanner.selectorLabels" -}}
{{ include "admission-controller.selectorLabels" . }}
app.kubernetes.io/component: scanner
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "admission-controller.scanner.serviceAccountName" -}}
    {{ default (include "admission-controller.scanner.fullname" .) .Values.serviceAccounts.scanner.name }}
{{- end -}}

{{/*
Generate certificates for aggregated api server
*/}}

{{- $cert := genCA ( printf "%s.%s.svc" (include "admission-controller.scanner.fullname" .) .Release.Namespace ) 3650 -}}

{{- define "admission-controller.scanner.gen-certs" -}}
{{- $ca := genCA (include "admission-controller.scanner.fullname" .) 3650 -}}
{{- $cn := printf "%s.%s.svc" (include "admission-controller.scanner.fullname" .) .Release.Namespace -}}
{{- $san := list $cn -}}
{{- $cert := genSignedCert $cn nil $san 3650 $ca -}}
{{- printf "%s$%s$%s" ($cert.Cert | b64enc) ($cert.Key | b64enc) ($ca.Cert | b64enc) -}}
{{- end -}}

{{/*
Allow overriding registry and repository for air-gapped environments
*/}}
{{- define "admission-controller.scanner.image" -}}
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
