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
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "registry-scanner.name" . }}
app.kubernetes.io/component: {{ include "registry-scanner.name" . }}-orchestrator
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
    {{- if .Values.image.fips -}}
      {{- if not (hasSuffix "-fips" $imageTag) -}}
        {{- $imageTag = (printf "%s-fips" $imageTag) -}}
      {{- end -}}
    {{- end -}}
    {{- $globalRegistry := (default .Values.global dict).imageRegistry -}}
    {{- $globalRegistry | default $imageRegistry | default "quay.io" -}} / {{- $imageRepository -}} : {{- $imageTag -}}
{{- end -}}
{{- end -}}

{{- define "registry-scanner.inlineScanImage" -}}
{{- if .Values.image.fips -}}
    {{- if hasSuffix "-fips" .Values.config.scan.inlineScanImage -}}
        {{ fail "use `image.fips: true` instead of manually setting fips tag" }}
    {{- end -}}
    {{- if not .Values.config.scan.inlineScanImage -}}
        {{- (include "registry-scanner.image" .) -}}
    {{- else -}}
        {{- .Values.config.scan.inlineScanImage -}}-fips
    {{- end -}}
{{- else -}}
    {{- .Values.config.scan.inlineScanImage -}}
{{- end -}}
{{- end -}}

{{- define "registry-scanner.rawPullSecretList" -}}
{{- range .Values.imagePullSecrets }}{{- if . }}{{- .name}},{{- end}}{{- end}}
{{- end -}}
{{- define "registry-scanner.pullSecretList" -}}
{{ trimSuffix "," (include "registry-scanner.rawPullSecretList" .) }}
{{- end -}}

{{/* Returns string 'true' if the cluster's kubeVersion is less than the parameter provided, or nothing otherwise
     Use like: {{ include "registry-scanner.kubeVersionLessThan" (dict "root" . "major" <kube_major_to_compare> "minor" <kube_minor_to_compare>) }}

     Note: The use of `"root" .` in the parameter dict is necessary as the .Capabilities fields are not provided in
           helper functions when "helm template" is used.
*/}}
{{- define "registry-scanner.kubeVersionLessThan" }}
{{- if (and (le (.root.Capabilities.KubeVersion.Major | int) .major)
            (lt (.root.Capabilities.KubeVersion.Minor | trimSuffix "+" | int) .minor)) }}
true
{{- end }}
{{- end }}

{{/*
Fail if cronjob.timeZone is set for Kubernetes < 1.24
*/}}
{{- define "registry-scanner.validateTimeZone" -}}
  {{- if and .Values.cronjob.timeZone (include "registry-scanner.kubeVersionLessThan" (dict "root" . "major" 1 "minor" 24)) }}
    {{ fail "cronjob.timeZone was specified but kubernetes version is smaller than 1.24." }}
  {{- end }}
{{- end }}
{{/*
Check cronjob value
*/}}
{{- define "registry-scanner.checkCronSchedule" -}}
  {{- $schedule := .Values.cronjob.schedule}}
  {{- $parts := splitList " " $schedule -}}

  {{- if eq (len $parts) 5 -}}
    {{- $minute := index $parts 0 -}}
    {{- $hour := index $parts 1 -}}
    {{- $dayOfMonth := index $parts 2 -}}
    {{- $month := index $parts 3 -}}
    {{- $dayOfWeek := index $parts 4 -}}

    {{- if and (eq $dayOfMonth "*" ) (eq $dayOfWeek "*") (eq $month "*") -}}
      {{- if or ($hour | contains "*") ($hour | contains ",") ($hour | contains "-") ($hour | contains "/") -}}
        # {{- printf "WARNING: You have configured the registry scanner to run on a schedule of '%s'. Running the scanner more often than every 24 hours can increase the load on your registry. The recommended configuration is to perform a scan weekly." $schedule | fail}}
        {{- fail (printf "WARNING: You have configured the registry scanner to run on a schedule of '%s'. Running the scanner more often than every 24 hours can increase the load on your registry. The recommended configuration is to perform a scan weekly." $schedule) }}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{/*
{{/*
EKS with AWS Service Account
*/}}
{{- define "registry-scanner.eksWithSA" -}}
  {{- if hasKey .Values.serviceAccount.annotations "eks.amazonaws.com/role-arn" }}
     true
  {{- end }}
{{- end }}
