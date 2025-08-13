{{/*
Expand the name of the chart.
*/}}
{{- define "shield.name" -}}
    {{- default .Chart.Name .Values.name_override | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "shield.fullname" -}}
    {{- if .Values.fullname_override }}
        {{- .Values.fullname_override | trunc 63 | trimSuffix "-" }}
    {{- else }}
        {{- $name := (include "shield.name" .) }}
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
{{- define "shield.chart" -}}
    {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "shield.labels" -}}
helm.sh/chart: {{ include "shield.chart" . }}
{{ include "shield.selector_labels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "shield.selector_labels" -}}
app.kubernetes.io/name: {{ include "shield.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Component labels
*/}}
{{- define "shield.component_labels" -}}
{{ include "shield.component_name_label" .}}: {{ required "A valid component name must be provided" .name }}

{{ if .version }}
  {{- $version := .version -}}
  {{- if (hasPrefix "sha256:" .version) -}}
    {{- $version = printf "sha256_%s" (trimPrefix "sha256:" .version) -}}
  {{- end -}}
  {{ include "shield.component_version_label" .}}: {{ $version | regexFind "^[^@]+" | trunc 63 }}
{{- end }}
{{- end }}

{{- define "shield.component_name_label" -}}
sysdig/component
{{- end }}

{{- define "shield.component_version_label" -}}
sysdig/component-version
{{- end -}}
