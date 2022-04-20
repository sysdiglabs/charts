{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "nodeAnalyzer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nodeAnalyzer.fullname" -}}
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
{{- define "nodeAnalyzer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the node analyzer specific service account to use
*/}}
{{- define "nodeAnalyzer.serviceAccountName" -}}
{{- if .Values.nodeAnalyzer.serviceAccount.create -}}
    {{ default (include "nodeAnalyzer.fullname" .) .Values.nodeAnalyzer.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.nodeAnalyzer.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Define the proper imageRegistry to use for agent and kmodule image
*/}}
{{- define "nodeAnalyzer.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.image.registry -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig Agent image name
*/}}
{{- define "nodeAnalyzer.repositoryName" -}}
{{- if .Values.slim.enabled -}}
    {{- .Values.slim.image.repository -}}
{{- else -}}
    {{- .Values.image.repository -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper nodeAnalyzer Agent image name for the Runtime Scanner
*/}}
{{- define "nodeAnalyzer.image.runtimeScanner" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.runtimeScanner.image.repository -}} {{- if .Values.nodeAnalyzer.runtimeScanner.image.digest -}} @ {{- .Values.nodeAnalyzer.runtimeScanner.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.runtimeScanner.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig nodeAnalyzer image name for the Eve Connector
*/}}
{{- define "nodeAnalyzer.image.eveConnector" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.runtimeScanner.eveConnector.image.repository -}} {{- if .Values.nodeAnalyzer.runtimeScanner.eveConnector.image.digest -}} @ {{- .Values.nodeAnalyzer.runtimeScanner.eveConnector.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.runtimeScanner.eveConnector.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper image name for the Image Analyzer
*/}}
{{- define "nodeAnalyzer.image.imageAnalyzer" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.imageAnalyzer.image.repository -}} {{- if .Values.nodeAnalyzer.imageAnalyzer.image.digest -}} @ {{- .Values.nodeAnalyzer.imageAnalyzer.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.imageAnalyzer.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper image name for the Host Analyzer
*/}}
{{- define "nodeAnalyzer.image.hostAnalyzer" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.hostAnalyzer.image.repository -}} {{- if .Values.nodeAnalyzer.hostAnalyzer.image.digest -}} @ {{- .Values.nodeAnalyzer.hostAnalyzer.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.hostAnalyzer.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper image name for the Benchmark Runner
*/}}
{{- define "nodeAnalyzer.image.benchmarkRunner" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.benchmarkRunner.image.repository -}} {{- if .Values.nodeAnalyzer.benchmarkRunner.image.digest -}} @ {{- .Values.nodeAnalyzer.benchmarkRunner.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.benchmarkRunner.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Node Analyzer labels
*/}}
{{- define "nodeAnalyzer.labels" -}}
helm.sh/chart: {{ include "nodeAnalyzer.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
  {{- if .Values.nodeAnalyzer.labels }}
    {{- $tp := typeOf .Values.nodeAnalyzer.labels }}
    {{- if eq $tp "string" }}
      {{- tpl .Values.nodeAnalyzer.labels . }}
    {{- else }}
      {{- toYaml .Values.nodeAnalyzer.labels }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
Sysdig Eve Connector service URL
*/}}
{{- define "eveconnector.host" -}}
{{ include "nodeAnalyzer.fullname" .}}-eveconnector.{{ .Release.Namespace }}
{{- end -}}

{{/*
Sysdig Eve Connector Secret generation (if not exists)
*/}}
{{- define "eveconnector.token" -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace "sysdig-eve-secret" -}}
{{- if $secret -}}
{{ $secret.data.token }}
{{- else -}}
{{ randAlphaNum 32 | b64enc | quote }}
{{- end -}}
{{- end -}}

{{/*
The following helper functions are all designed to use global values where
possible, but accept overrides from the chart values.
*/}}
{{- define "nodeAnalyzer.accessKey" -}}
    {{- required "A valid accessKey is required" (.Values.sysdig.accessKey | default .Values.global.sysdig.accessKey) -}}
{{- end -}}

{{- define "nodeAnalyzer.accessKeySecret" -}}
    {{/*
    Note: the last default function call is to avoid some weirdness when either
    argument is nil. If .Values.global.sysdig.accessKeySecret was undefined, the
    returned empty string does not evaluate to empty on Helm Version:"v3.8.0"
    */}}
    {{- .Values.sysdig.existingAccessKeySecret | default .Values.global.sysdig.accessKeySecret | default "" -}}
{{- end -}}

{{- define "nodeAnalyzer.clusterName" -}}
    {{- .Values.clusterName | default .Values.global.clusterConfig.name | default "" -}}
{{- end -}}

{{/*
Determine collector endpoint based on provided region or .Values.nodeAnalyzer.apiEndpoint
*/}}
{{- define "nodeAnalyzer.apiEndpoint" -}}
    {{- if .Values.nodeAnalyzer.apiEndpoint -}}
        {{- .Values.nodeAnalyzer.apiEndpoint -}}
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
