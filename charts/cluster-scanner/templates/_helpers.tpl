{{/*
Expand the name of the chart.
*/}}
{{- define "cluster-scanner.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cluster-scanner.fullname" -}}
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
{{- define "cluster-scanner.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cluster-scanner.labels" -}}
helm.sh/chart: {{ include "cluster-scanner.chart" . }}
{{ include "cluster-scanner.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cluster-scanner.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cluster-scanner.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cluster-scanner.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "cluster-scanner.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Generates configmap data for mode-specific values
*/}}
{{- define "cluster-scanner.modeConfig" -}}
{{- if eq .Values.global.scannerMode "local" }}
rsi_mode: "sitting"
{{- else if eq .Values.global.scannerMode "multi" }}
rsi_mode: "mcm"
{{- else }}
{{- fail "invalid scannerMode, accepted options [local, multi]" }}
{{- end }}
{{ end }}

{{/*
Generates RSI configmap data for JS values.
As of now static, might change to dynamic when making jetstream migrations overridable from chart
*/}}
{{- define "cluster-scanner.rsiJsConfig" -}}
rsi_js_consumer_streamname: "analysis-sboms"
rsi_js_consumer_name: "rsi"
rsi_js_consumer_durable: "rsi"
rsi_js_consumer_pull: "true"
rsi_js_consumer_subject: "analysis.sboms"
rsi_js_consumer_subject_prefix: "analysis.sboms"
rsi_js_consumer_max_in_flight: "256"
rsi_js_consumer_ack_wait: "120s"
rsi_js_consumer_max_deliver: "1"
rsi_js_producer_subject_prefix: "analysis.requests"
{{ end }}

{{/*
Generates ISE configmap data for JS values
As of now static, might change to dynamic when making jetstream migrations overridable from chart
*/}}
{{- define "cluster-scanner.iseJsConfig" -}}
ise_js_consumer_streamname: "analysis-requests"
ise_js_consumer_name: "ise"
ise_js_consumer_durable: "ise"
ise_js_consumer_pull: "true"
ise_js_consumer_subject: "analysis.requests.>"
ise_js_consumer_max_in_flight: "256"
ise_js_consumer_ack_wait: "240s"
ise_js_consumer_max_deliver: "1"
ise_js_producer_subject: "analysis.sboms"
{{ end }}

{{/*
Generates config for Redis, if available
*/}}
{{- define "cluster-scanner.redisCacheConfig" }}
{{- if eq .Values.cache.type "redis" }}
{{- with .Values.cache.redis }}
cache_redis_address: {{ .address }}
cache_redis_user: {{ .user }}
cache_redis_password: {{ .password }}
cache_redis_database: {{ .database }}
cache_redis_tls_enabled: {{ .tlsEnabled | quote }}
cache_redis_tls_skip: {{ .tlsSkip | quote }}
cache_redis_tls_ca: {{ .tlsCa }}
cache_redis_sentinel_master: {{ .sentinelMaster }}
cache_redis_sentinel_address: {{ .sentinelAddress }}
{{- end }}
{{- end }}
{{- end }}
