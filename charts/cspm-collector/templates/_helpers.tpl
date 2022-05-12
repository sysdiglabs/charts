{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cspmCollector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cspmCollector.fullname" -}}
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
{{- define "cspmCollector.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the cspm collector specific service account to use
*/}}
{{- define "cspmCollector.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "cspmCollector.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Define the proper imageRegistry to use for agent and kmodule image
*/}}
{{- define "cspmCollector.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.image.registry -}}
{{- end -}}
{{- end -}}


{{/*
Return the proper image name for the CSPM Collector
*/}}
{{- define "cspmCollector.image.cspmCollector" -}}
    {{- include "cspmCollector.imageRegistry" . -}} / {{- .Values.image.repository -}} {{- if .Values.image.digest -}} @ {{- .Values.image.digest -}} {{- else -}} : {{- .Values.image.tag -}} {{- end -}}
{{- end -}}

{{/*
CSPM Collector labels
*/}}
{{- define "cspmCollector.labels" -}}
helm.sh/chart: {{ include "cspmCollector.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
  {{- if .Values.labels }}
    {{- $tp := typeOf .Values.labels }}
    {{- if eq $tp "string" }}
      {{- tpl .Values.labels . }}
    {{- else }}
      {{- toYaml .Values.labels }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
The following helper functions are all designed to use global values where
possible, but accept overrides from the chart values.
*/}}
{{- define "cspmCollector.accessKey" -}}
    {{- required "A valid accessKey is required" (.Values.sysdig.accessKey | default .Values.global.sysdig.accessKey) -}}
{{- end -}}

{{- define "cspmCollector.accessKeySecret" -}}
    {{/*
    Note: the last default function call is to avoid some weirdness when either
    argument is nil. If .Values.global.sysdig.accessKeySecret was undefined, the
    returned empty string does not evaluate to empty on Helm Version:"v3.8.0"
    */}}
    {{- .Values.sysdig.existingAccessKeySecret | default .Values.global.sysdig.accessKeySecret | default "" -}}
{{- end -}}

{{- define "cspmCollector.clusterName" -}}
    {{- .Values.clusterName | default .Values.global.clusterConfig.name | default "" -}}
{{- end -}}

{{/*
Determine collector endpoint based on provided region or .Values.apiEndpoint
*/}}
{{- define "cspmCollector.apiEndpoint" -}}
    {{- if .Values.apiEndpoint -}}
        {{- .Values.apiEndpoint -}}
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
    {{- end -}}
{{- end -}}

{{/*
Sysdig NATS service URL
*/}}
{{- define "cspmCollector.natsUrl" -}}
{{- if .Values.natsUrl -}}
    {{- .Values.natsUrl -}}
{{- else -}}
    wss://{{ .Values.apiEndpoint }}:443
{{- end -}}
{{- end -}}
