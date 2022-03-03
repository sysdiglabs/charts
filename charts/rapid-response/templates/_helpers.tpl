{{/*
Expand the name of the chart.
*/}}
{{- define "rapidResponse.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rapidResponse.fullname" -}}
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
{{- define "rapidResponse.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
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
Rapid Response Specific Options
*/}}

{{/*
Allow overriding registry and repository
*/}}
{{- define "rapidResponse.image" -}}
{{- $imageRegistry := .Values.rapidResponse.image.registry -}}
{{- $imageRepository := .Values.rapidResponse.image.repository -}}
{{- $imageTag := .Values.rapidResponse.image.tag | default .Chart.AppVersion -}}
{{- $globalRegistry := (default .Values.global dict).imageRegistry -}}
{{- $globalRegistry | default $imageRegistry | default "docker.io" -}} / {{- $imageRepository -}} : {{- $imageTag -}}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "rapidResponse.serviceAccountName" -}}
{{- if .Values.rapidResponse.serviceAccount.create -}}
    {{ default (include "rapidResponse.fullname" .) .Values.rapidResponse.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
