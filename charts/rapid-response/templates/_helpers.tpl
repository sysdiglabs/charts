{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "rapidResponse.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | lower }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rapidResponse.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | lower }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride | lower }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" | lower }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" | lower }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rapidResponse.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | lower }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rapidResponse.labels" -}}
helm.sh/chart: {{ include "rapidResponse.chart" . }}
{{ include "rapidResponse.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rapidResponse.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rapidResponse.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Daemonset labels
*/}}
{{- define "rapidResponse.daemonSetLabels" -}}
  {{- if .Values.rapidResponse.daemonSetLabels }}
    {{- $tp := typeOf .Values.rapidResponse.daemonSetLabels }}
    {{- if eq $tp "string" }}
        {{- if not (regexMatch "^[a-z0-9A-Z].*(: )(.*[a-z0-9A-Z]$)?" .Values.rapidResponse.daemonSetLabels) }}
            {{- fail "daemonSetLabels does not seem to be of the type key:[space]value" }}
        {{- end }}
        {{- tpl .Values.rapidResponse.daemonSetLabels . }}
    {{- else }}
        {{- toYaml .Values.rapidResponse.daemonSetLabels }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
Define the proper imageRegistry to use for Rapid Response image
*/}}
{{- define "rapidResponse.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- required "A valid global registry name is required" .Values.global.imageRegistry -}}
{{- else -}}
    {{- required "A valid registry name is required" .Values.rapidResponse.image.registry  -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Rapid Response image name
*/}}
{{- define "rapidResponse.repositoryName" -}}
    {{- required "A valid repository name is required" .Values.rapidResponse.image.repository -}}
{{- end -}}

{{- define "rapidResponse.image" -}}
{{- if .Values.rapidResponse.overrideValue }}
    {{- printf .Values.rapidResponse.overrideValue -}}
{{- else -}}
    {{- include "rapidResponse.imageRegistry" . -}} / {{- include "rapidResponse.repositoryName" . -}} {{- if .Values.rapidResponse.image.digest -}} @ {{- .Values.rapidResponse.image.digest -}} {{- else -}} : {{- include "rapidResponse.imageTag" . -}} {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return Rapid Response image tag from AppVersion defined on Chart.yaml
This would avoid to manually update everytime both Chart.yaml and values.yaml with the new image tag
*/}}
{{- define "rapidResponse.imageTag" -}}
{{- if .Values.rapidResponse.image.tag -}}
    {{- $tp := typeOf .Values.rapidResponse.image.tag }}
    {{- if ne $tp "string" }}
      {{- fail "Rapid Response image tag does not seems to be a string" }}
    {{- else }}
        {{- printf "%s" .Values.rapidResponse.image.tag -}}
    {{- end }}
{{- else -}}
{{- printf "%s" .Chart.AppVersion -}}
{{- end -}}
{{- end -}}

{{/*
The following helper functions are all designed to use global values where
possible, but accept overrides from the chart values.
*/}}

{{- define "rapidResponse.accessKey" -}}
    {{- required "A valid accessKey is required" (.Values.sysdig.accessKey | default .Values.global.sysdig.accessKey) -}}
{{- end -}}

{{- define "rapidResponse.accessKeySecret" -}}
    {{/*
    Note: the last default function call is to avoid some weirdness when either
    argument is nil. If .Values.global.sysdig.accessKeySecret was undefined, the
    returned empty string does not evaluate to empty on Helm Version:"v3.8.0"
    */}}
    {{- .Values.sysdig.existingAccessKeySecret | default .Values.global.sysdig.accessKeySecret | default "" -}}
{{- end -}}

{{- define "rapidResponse.passphrase" -}}
    {{- required "A valid passphrase is required" .Values.rapidResponse.passphrase  -}}
{{- end -}}

{{- define "rapidResponse.passphraseSecret" -}}
    {{- .Values.rapidResponse.existingPassphraseSecret | default "" -}}
{{- end -}}

{{/*
HTTP/HTTPS proxy support
*/}}
{{- define "rapidResponse.httpProxy" -}}
    {{- if (.Values.rapidResponse.proxy.httpProxy | default .Values.global.proxy.httpProxy) -}}
        {{ .Values.rapidResponse.proxy.httpProxy | default .Values.global.proxy.httpProxy }}
    {{- end -}}
{{- end -}}

{{- define "rapidResponse.httpsProxy" -}}
    {{- if (.Values.rapidResponse.proxy.httpsProxy | default .Values.global.proxy.httpsProxy) -}}
        {{ .Values.rapidResponse.proxy.httpsProxy | default .Values.global.proxy.httpsProxy }}
    {{- end -}}
{{- end -}}

{{- define "rapidResponse.noProxy" -}}
    {{- if (.Values.rapidResponse.proxy.noProxy | default .Values.global.proxy.noProxy) -}}
        {{ .Values.rapidResponse.proxy.noProxy | default .Values.global.proxy.noProxy }}
    {{- end -}}
{{- end -}}

{{/*
Determine collector endpoint based on provided region or .Values.rapidResponse.apiEndpoint
*/}}
{{- define "rapidResponse.apiEndpoint" -}}
    {{- if .Values.rapidResponse.apiEndpoint -}}
        {{- .Values.rapidResponse.apiEndpoint -}}
    {{- else if (eq .Values.global.sysdig.region "us1") -}}
        {{- "secure.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us2") -}}
        {{- "us2.app.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us3") -}}
        {{- "app.us3.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us4") -}}
        {{- "app.us4.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "eu1") -}}
        {{- "eu1.app.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "au1") -}}
        {{- "app.au1.sysdig.com" -}}
    {{- else -}}
        {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
    {{- end -}}
{{- end -}}

{{/*
Rapid Response have the environment variable skip_tls_check: true for skip the certficate verification
while we do the other way round for our other components (sslVerifyCertificate: false for disabling the check).
The aim of rapidResponse.certificateValidation is to align the settings with the other Sysdig charts,
without introducing changes on Rapid Response container image.
*/}}
{{- define "rapidResponse.certificateValidation" -}}
    {{- if or ( eq (.Values.rapidResponse.skipTlsVerifyCertificate | toString) "true") (eq (.Values.rapidResponse.sslVerifyCertificate | toString) "false") -}}
        {{- "true" -}}
    {{- else -}}
        {{- "false" -}}
    {{- end -}}
{{- end -}}

{{/*
Create the name of the Rapid Response collector specific service account to use
*/}}
{{- define "rapidResponse.serviceAccountName" -}}
{{- if .Values.rapidResponse.serviceAccount.create -}}
    {{ default (include "rapidResponse.fullname" .) .Values.rapidResponse.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.rapidResponse.serviceAccount.name }}
{{- end -}}
{{- end -}}
