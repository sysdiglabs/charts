{{/*
Expand the name of the chart.
*/}}
{{- define "registry-scanner.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "registry-scanner.fullname" -}}
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
{{- define "registry-scanner.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "registry-scanner.labels" -}}
helm.sh/chart: {{ include "registry-scanner.chart" . }}
{{ include "registry-scanner.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "registry-scanner.selectorLabels" -}}
app.kubernetes.io/name: {{ include "registry-scanner.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Custom labels
*/}}
{{- define "registry-scanner.customLabels" -}}
  {{- if .Values.customLabels }}
    {{- $tp := typeOf .Values.customLabels }}
    {{- if eq $tp "string" }}
      {{- tpl .Values.customLabels . }}
    {{- else }}
      {{- toYaml .Values.customLabels }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
Scan Security Context
*/}}
{{- define "registry-scanner.scan.securityContext" -}}
  {{- if .Values.config.scan.securityContext }}
    {{- $tp := typeOf .Values.config.scan.securityContext }}
    {{- if eq $tp "string" }}
      {{- tpl .Values.config.scan.securityContext . }}
    {{- else }}
      {{- toYaml .Values.config.scan.securityContext }}
    {{- end }}
  {{- end }}
{{- end -}}



{{/*
Create the name of the service account to use
*/}}
{{- define "registry-scanner.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "registry-scanner.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Allow overriding registry and repository for air-gapped environments
*/}}
{{- define "registry-scanner.image" -}}
{{- if .Values.image.overrideValue -}}
    {{- .Values.image.overrideValue -}}
{{- else -}}
    {{- $imageRegistry := .Values.image.registry -}}
    {{- $imageRepository := .Values.image.repository -}}
    {{- $imageTag := .Values.image.tag -}}
    {{- if not .Values.image.tag -}}
    {{- $imageTag = (printf "job-%s" .Chart.AppVersion) -}}
    {{- end -}}
    {{- $globalRegistry := (default .Values.global dict).imageRegistry -}}
    {{- $globalRegistry | default $imageRegistry | default "quay.io" -}} / {{- $imageRepository -}} : {{- $imageTag -}}
{{- end -}}
{{- end -}}

{{- define "registry-scanner.rawPullSecretList" -}}
{{- range .Values.imagePullSecrets }}{{- if . }}{{- .name}},{{- end}}{{- end}}
{{- end -}}
{{- define "registry-scanner.pullSecretList" -}}
{{ trimSuffix "," (include "registry-scanner.rawPullSecretList" .) }}
{{- end -}}

{{/* Returns string 'true' if the cluster's kubeVersion is less than the parameter provided, or nothing otherwise
     Use like: {{ include "registry-scanner.kubeVersionLessThan" (dict "root" . "major" "<kube_major_to_compare>" "minor" "<kube_minor_to_compare>") }}

     Note: The use of `"root" .` in the parameter dict is necessary as the .Capabilities fields are not provided in
           helper functions when "helm template" is used.
*/}}
{{- define "registry-scanner.kubeVersionLessThan" }}
{{- if (and (le (.root.Capabilities.KubeVersion.Major | int) .major)
            (lt (.root.Capabilities.KubeVersion.Minor | trimSuffix "+" | int) .minor)) }}
true
{{- end }}
{{- end }}
