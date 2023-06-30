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
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | lower }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
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
{{- define "cluster-scanner.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | lower }}
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
{{- default (include "cluster-scanner.fullname" .) .Values.serviceAccount.name | lower }}
{{- else }}
{{- default "default" .Values.serviceAccount.name | lower }}
{{- end }}
{{- end }}

{{- define "cluster-scanner.namespace" -}}
{{ required "speficy a release namespace" .Release.Namespace }}
{{- end }}

{{/*
Generates configmap data for mode-specific values
*/}}
{{- define "cluster-scanner.modeConfig" -}}
rsi_mode: {{ .Values.scannerMode }}
{{- if eq .Values.scannerMode "local" }}
local_registry_secrets: {{ include "cluster-scanner.runtimeStatusIntegrator.localCluster.localSecrets" . }}
{{- end }}
{{- end }}

{{/*
Generates RSI configmap data for JS values.
As of now static, might change to dynamic when making jetstream migrations overridable from chart
*/}}
{{- define "cluster-scanner.rsiJsConfig" -}}
rsi_js_consumer_streamname: "analysis-sboms"
rsi_js_consumer_name: "rsi"
rsi_js_consumer_durable: "rsi"
rsi_js_consumer_pull: "true"
rsi_js_consumer_pull_batch: "1"
rsi_js_consumer_subject: "analysis.sboms"
rsi_js_consumer_subject_prefix: "analysis.sboms"
rsi_js_consumer_max_in_flight: "256"
rsi_js_consumer_ack_wait: "120s"
rsi_js_consumer_max_deliver: "1"
rsi_js_consumer_deliver_policy_all: "true"
rsi_js_producer_subject_prefix: "analysis.requests"
rsi_js_server_metrics_enable: "true"
rsi_js_server_metrics_port: "8222"
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
ise_js_consumer_pull_batch: "1"
ise_js_consumer_subject: "analysis.requests.>"
ise_js_consumer_max_in_flight: "256"
ise_js_consumer_ack_wait: "240s"
ise_js_consumer_max_deliver: "1"
ise_js_consumer_deliver_policy_all: "true"
ise_js_producer_subject: "analysis.sboms"
{{ end }}

{{/*
Generates config for Redis, if available
*/}}
{{- define "cluster-scanner.redisCacheConfig" }}
{{- if and (contains "distributed" .Values.imageSbomExtractor.cache.type) (.Values.imageSbomExtractor.cache.redis) }}
{{- with .Values.imageSbomExtractor.cache.redis }}
cache_redis_address: {{ .address }}
{{- if .user }}
cache_redis_user: {{ .user }}
{{- end }}
{{- if .database }}
cache_redis_database: {{ .database }}
{{- end }}
{{- if .prefix }}
cache_redis_prefix: {{ .prefix }}
{{- end }}
{{- if .tlsEnabled }}
cache_redis_tls_enabled: {{ .tlsEnabled | quote }}
{{- end }}
{{- if .tlsSkip }}
cache_redis_tls_skip: {{ .tlsSkip | quote }}
{{- end }}
{{- if .tlsCa }}
cache_redis_tls_ca: {{ .tlsCa }}
{{- end }}
{{- if .sentinelMaster }}
cache_redis_sentinel_master: {{ .sentinelMaster }}
{{- end }}
{{- if .sentinelAddress }}
cache_redis_sentinel_address: {{ .sentinelAddress }}
{{- end }}
{{- if .ttl }}
cache_redis_ttl: {{ .ttl }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{- define "cluster-scanner.localCacheConfig" }}
{{- if and (contains "local" .Values.imageSbomExtractor.cache.type) (hasKey .Values.imageSbomExtractor.cache "local") }}
{{- with .Values.imageSbomExtractor.cache.local }}
ise_cache_local_max_size: {{ .maxSizeBytes | quote }}
ise_cache_local_max_element_size: {{ .maxElementSizeBytes | quote }}
ise_cache_local_ttl: {{ .ttl }}
{{- end }}
{{- end }}
{{- end }}

{{- define "cluster-scanner.configContent" }}
{{ .Values.global }}
{{ .Values.runtimeStatusIntegrator.multiCluster }}
{{ .Values.runtimeStatusIntegrator.localCluster }}
{{ .Values.runtimeStatusIntegrator.natsJS }}
{{ .Values.imageSbomExtractor.cache }}
{{- end }}

{{/*
Determine sysdig secure endpoint based on provided region
*/}}
{{- define "cluster-scanner.apiHost" -}}
    {{- if .Values.global.sysdig.apiHost -}}
        {{- .Values.global.sysdig.apiHost -}}
    {{- else if (eq .Values.global.sysdig.region "us1") -}}
        {{- "https://secure.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us2") -}}
        {{- "https://us2.app.sysdig.com/secure" -}}
    {{- else if (eq .Values.global.sysdig.region "us3") -}}
        {{- "https://app.us3.sysdig.com/secure" -}}
    {{- else if (eq .Values.global.sysdig.region "us4") -}}
        {{- "https://app.us4.sysdig.com/secure" -}}
    {{- else if (eq .Values.global.sysdig.region "eu1") -}}
        {{- "https://eu1.app.sysdig.com/secure" -}}
    {{- else if (eq .Values.global.sysdig.region "au1") -}}
        {{- "https://app.au1.sysdig.com/secure" -}}
    {{- else -}}
        {{- if (ne .Values.global.sysdig.region "custom") -}}
            {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{/*
Define the proper imageRegistry to use for runtimeStatusIntegrator
*/}}
{{- define "cluster-scanner.runtimeStatusIntegrator.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.runtimeStatusIntegrator.image.registry -}}
{{- end -}}
{{- end -}}

{{/*
Define the proper imageRegistry to use for imageSbomExtractor
*/}}
{{- define "cluster-scanner.imageSbomExtractor.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.imageSbomExtractor.image.registry -}}
{{- end -}}
{{- end -}}

{{/*
Cluster scanner version compatibility check.

If .Values.onPremCompatibilityVersion is set to 6.2, it checks whether
the provided tag is < 1.0.0 .

Otherwise, it checks if the provided tag is >= 1.0.0 .

Version tags must be semver2-compatible otherwise no check will be performed.
*/}}
{{- define "cluster-scanner.checkVersionCompatibility" -}}
{{- if regexMatch "^[0-9]+\\.[0-9]+\\.[0-9]+.*" .Tag -}}
    {{- $version := semver .Tag -}}
    {{- if and (hasKey (default .Values dict) "onPremCompatibilityVersion") (eq .Values.onPremCompatibilityVersion "6.2") -}}
        {{- if ne ($version | (semver "1.0.0").Compare) 1 -}}
            {{- fail (printf "incompatible version for %s, set %s expected < 1.0.0" .Component .Tag) -}}
        {{- end -}}
    {{- else -}}
        {{- if eq ($version | (semver "1.0.0").Compare) 1 -}}
            {{- fail (printf "incompatible version for %s, set %s expected >= 1.0.0" .Component .Tag) -}}
        {{- end -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper image name for the Runtime Status Integrator
*/}}
{{- define "cluster-scanner.runtimeStatusIntegrator.image" -}}
    {{- $data := dict "Values" .Values "Tag" .Values.runtimeStatusIntegrator.image.tag "Component" "runtimeStatusIntegrator.image.tag" -}}
    {{- include "cluster-scanner.checkVersionCompatibility" $data -}}
    {{- include "cluster-scanner.runtimeStatusIntegrator.imageRegistry" . -}} / {{- .Values.runtimeStatusIntegrator.image.repository -}} : {{- .Values.runtimeStatusIntegrator.image.tag -}}
{{- end -}}

{{/*
Return the proper image name for the Image Sbom Extractor
*/}}
{{- define "cluster-scanner.imageSbomExtractor.image" -}}
    {{- $data := dict "Values" .Values "Tag" .Values.imageSbomExtractor.image.tag -}}
    {{- $data := dict "Values" .Values "Tag" .Values.imageSbomExtractor.image.tag "Component" "imageSbomExtractor.image.tag" -}}
    {{- include "cluster-scanner.checkVersionCompatibility" $data -}}
    {{- include "cluster-scanner.imageSbomExtractor.imageRegistry" . -}} / {{- .Values.imageSbomExtractor.image.repository -}} : {{- .Values.imageSbomExtractor.image.tag -}}
{{- end -}}

{{/*
Return local registry secrets in the correct format: <namespace_name>/<secret_name>,<namespace_name>/<secret_name>
*/}}
{{- define "cluster-scanner.runtimeStatusIntegrator.localCluster.localSecrets" -}}
    {{- $list := list -}}
    {{- range $nsName, $secrets := ((.Values.runtimeStatusIntegrator.localCluster).rbac).allowedPullSecrets -}}
        {{- range $secrets -}}
            {{- $list = append $list (printf "%s/%s" $nsName .) -}}
        {{- end -}}
    {{- end -}}
    '{{- join "," $list -}}'
{{- end -}}
