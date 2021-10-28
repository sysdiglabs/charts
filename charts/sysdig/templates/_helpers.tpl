{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "sysdig.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sysdig.fullname" -}}
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
{{- define "sysdig.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "sysdig.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "sysdig.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Define the proper imageRegistry to use for agent and kmodule image
*/}}
{{- define "sysdig.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.image.registry -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig Agent image name
*/}}
{{- define "sysdig.repositoryName" -}}
{{- if .Values.slim.enabled -}}
    {{- .Values.slim.image.repository -}}
{{- else -}}
    {{- .Values.image.repository -}}
{{- end -}}
{{- end -}}

{{- define "sysdig.image" -}}
{{- if .Values.image.overrideValue }}
    {{- printf .Values.image.overrideValue -}}
{{- else -}}
    {{- include "sysdig.imageRegistry" . -}} / {{- include "sysdig.repositoryName" . -}} : {{- .Values.image.tag -}}
{{- end -}}
{{- end -}}

{{/*
Sysdig Agent resources
*/}}
{{- define "sysdig.resources" -}}
{{/* we have same values for both requests and limits */}}
{{- $smallCpu := "1000m" -}}
{{- $smallMemory := "1024Mi" -}}
{{- $mediumCpu := "3000m" -}}
{{- $mediumMemory := "3072Mi" -}}
{{- $largeCpu := "5000m" -}}
{{- $largeMemory := "6144Mi" -}}
{{- if eq .Values.resourceProfile "small" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $smallCpu $smallMemory $smallCpu $smallMemory -}}
{{- else if eq .Values.resourceProfile "medium" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $mediumCpu $mediumMemory $mediumCpu $mediumMemory -}}
{{- else if eq .Values.resourceProfile "large" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $largeCpu $largeMemory $largeCpu $largeMemory -}}
{{- else -}}{{/* "custom" or anything else falls here */}}
{{- toYaml .Values.resources -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig Agent image name for module building
*/}}
{{- define "sysdig.image.kmodule" -}}
    {{- include "sysdig.imageRegistry" . -}} / {{- .Values.slim.kmoduleImage.repository -}} : {{- .Values.image.tag -}}
{{- end -}}

{{/*
Return the proper Sysdig Agent image name for the Node Image Analyzer
*/}}
{{- define "sysdig.image.nodeImageAnalyzer" -}}
    {{- include "sysdig.imageRegistry" . -}} / {{- .Values.nodeImageAnalyzer.image.repository -}} : {{- .Values.nodeImageAnalyzer.image.tag -}}
{{- end -}}

{{/*
Return the proper image name for the Image Analyzer
*/}}
{{- define "sysdig.image.imageAnalyzer" -}}
    {{- include "sysdig.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.imageAnalyzer.image.repository -}} : {{- .Values.nodeAnalyzer.imageAnalyzer.image.tag -}}
{{- end -}}

{{/*
Return the proper image name for the Host Analyzer
*/}}
{{- define "sysdig.image.hostAnalyzer" -}}
    {{- include "sysdig.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.hostAnalyzer.image.repository -}} : {{- .Values.nodeAnalyzer.hostAnalyzer.image.tag -}}
{{- end -}}

{{/*
Return the proper image name for the Benchmark Runner
*/}}
{{- define "sysdig.image.benchmarkRunner" -}}
    {{- include "sysdig.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.benchmarkRunner.image.repository -}} : {{- .Values.nodeAnalyzer.benchmarkRunner.image.tag -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "sysdig.labels" -}}
helm.sh/chart: {{ include "sysdig.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{/*
Use like: {{ include "get_or_fail_if_in_settings" (dict "root" . "key" "<mypath.key>" "setting" "<agent_setting>") }}
Return the value of key "<mypath.key>" and if "<agent_setting>" is also defined in sysdig.settings.<agent_setting>, and error is thrown
NOTE: I don't like the error message! Too much information.
*/}}
{{- define "get_or_fail_if_in_settings" -}}
{{- $keyValue := tpl (printf "{{- .Values.%s -}}" .key) .root }}
{{- if $keyValue -}}
    {{- if hasKey .root.Values.sysdig.settings .setting }}{{ fail (printf "Value '%s' is also set via .sysdig.settings.%s'." .key .setting) }}{{- end -}}
    {{- $keyValue -}}
{{- end -}}
{{- end -}}

{{- define "deploy-nia" -}}
{{- if or .Values.nodeImageAnalyzer.deploy .Values.nodeImageAnalyzer.settings.collectorEndpoint -}}
true
{{- end -}}
{{- end -}}
