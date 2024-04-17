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
{{- with .Values.labels }}
{{- toYaml . | nindent 0 }}
{{- end }}
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
rsi_mode: "local"
local_registry_secrets: {{ include "cluster-scanner.runtimeStatusIntegrator.localCluster.localSecrets" . }}
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
rsi_js_priority_producer_subject_prefix: "analysis.priority.requests"
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

ise_js_priority_consumer_streamname: "analysis-requests"
ise_js_priority_consumer_name: "ise-priority"
ise_js_priority_consumer_durable: "ise-priority"
ise_js_priority_consumer_pull: "true"
ise_js_priority_consumer_pull_batch: "1"
ise_js_priority_consumer_subject: "analysis.priority.requests.>"
ise_js_priority_consumer_max_in_flight: "256"
ise_js_priority_consumer_ack_wait: "240s"
ise_js_priority_consumer_max_deliver: "1"
ise_js_priority_consumer_deliver_policy_all: "true"

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
{{ .Values.runtimeStatusIntegrator.localCluster }}
{{ .Values.runtimeStatusIntegrator.natsJS }}
{{ .Values.imageSbomExtractor.cache }}
{{- end }}

{{/*
Determine sysdig secure endpoint based on provided region
*/}}
{{- define "cluster-scanner.apiHost" -}}
    {{- if (or .Values.global.sysdig.apiHost (eq .Values.global.sysdig.region "custom"))  -}}
        {{- required "A valid Sysdig API endpoint (.global.sysdig.apiHost) is required" .Values.global.sysdig.apiHost -}}
    {{- else if hasKey ((include "sysdig.regions" .) | fromYaml) .Values.global.sysdig.region }}
        {{- include "sysdig.secureApiEndpoint" . }}
    {{- else }}
        {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
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
Generates configmap data to enable platform services if onPremCompatibility version is not set, or it is greater than 7.0.0
It also makes sure that the platform services are enabled in regions which support them when onPremCompatibility is not defined.
*/}}
{{- define "cluster-scanner.enablePlatformServicesConfig" -}}
{{- if ( semverCompare ">= 7.0.0" (.Values.onPremCompatibilityVersion | default "7.0.0" )) -}}
    {{- $regionsPlatformEnabled := list "us1" "us2" "us3" "us4" "au1" "eu1" -}}
    {{- if and (not .Values.disablePlatformScanning) (or (has .Values.global.sysdig.region $regionsPlatformEnabled) .Values.onPremCompatibilityVersion) -}}
enable_platform_services: "true"
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper image name for the Runtime Status Integrator
*/}}
{{- define "cluster-scanner.runtimeStatusIntegrator.image" -}}
    {{- $data := dict "Values" .Values "Tag" .Values.runtimeStatusIntegrator.image.tag "Component" "runtimeStatusIntegrator.image.tag" -}}
    {{- include "cluster-scanner.runtimeStatusIntegrator.imageRegistry" . -}} / {{- .Values.runtimeStatusIntegrator.image.repository -}} : {{- .Values.runtimeStatusIntegrator.image.tag -}}
{{- end -}}

{{/*
Return the proper image name for the Image Sbom Extractor
*/}}
{{- define "cluster-scanner.imageSbomExtractor.image" -}}
    {{- $data := dict "Values" .Values "Tag" .Values.imageSbomExtractor.image.tag "Component" "imageSbomExtractor.image.tag" -}}
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

{{- define "cluster-scanner.accessKeySecret" -}}
    {{/*
    Note: the last default function call is to avoid some weirdness when either
    argument is nil. If .Values.global.sysdig.accessKeySecret was undefined, the
    returned empty string does not evaluate to empty on Helm Version:"v3.8.0"
    */}}
    {{- .Values.global.sysdig.accessKeySecret | default "" -}}
{{- end -}}

{{/*
Produce self-signed TLS certificate and key to secure NATS JetStream communication.
*/}}
{{- define "cluster-scanner.nats.tls.selfSignedCert" -}}
 {{- $svcName := include "cluster-scanner.fullname" . -}}
 {{- $dnsNames := list -}}
 {{- $dnsNames = append $dnsNames (printf "%s.%s.svc.cluster.local" $svcName .Release.Namespace) -}}
 {{- $dnsNames = append $dnsNames (printf "*.%s.%s.svc.cluster.local" $svcName .Release.Namespace) -}}
 {{- $dnsNames = append $dnsNames (printf "%s.%s.svc" $svcName .Release.Namespace) -}}
 {{- $dnsNames = append $dnsNames (printf "*.%s.%s.svc" $svcName .Release.Namespace) -}}
 {{- $dnsNames = append $dnsNames (printf "*.%s" $svcName ) -}}
 {{- $dnsNames = append $dnsNames $svcName -}}
 {{- $dnsNames = append $dnsNames "localhost" -}}
 {{- $ca := genCA "ClusterScannerCert-ca" 3650 -}}
 {{- $tlsCert := genSignedCertWithKey "ClusterScannerCert" (list "127.0.0.1") ($dnsNames) 3650 $ca (genPrivateKey "ed25519") }}
  js_tls_key: {{ $tlsCert.Key | b64enc | quote }}
  js_tls_cert: {{ $tlsCert.Cert | b64enc | quote }}
  js_tls_ca: {{ $ca.Cert | b64enc | quote }}
{{- end -}}

{{/*
Returns true if NATS TLS is enabled and no custom certs have been provided
*/}}
{{- define "cluster-scanner.nats.tls.hasSelfSignedCert" -}}
{{- if and ((.Values.runtimeStatusIntegrator.natsJS).tls).enabled (not ((.Values.runtimeStatusIntegrator.natsJS).tls).customCerts) -}}
true
{{- end -}}
{{- end -}}

{{/*
Returns true if NATS TLS is enabled and custom certs have been provided
*/}}
{{- define "cluster-scanner.nats.tls.hasCustomCert" -}}
{{- if and ((.Values.runtimeStatusIntegrator.natsJS).tls).enabled ((.Values.runtimeStatusIntegrator.natsJS).tls).customCerts -}}
{{- include "cluster-scanner.nats.tls.failIfMissingMandatoryCustomCerts" . -}}
true
{{- end -}}
{{- end -}}

{{/*
Fails if not all mandatory customCerts fields are being set.
*/}}
{{- define "cluster-scanner.nats.tls.failIfMissingMandatoryCustomCerts" -}}
{{- if not (and ((.Values.runtimeStatusIntegrator.natsJS.tls).customCerts).existingKeySecret ((.Values.runtimeStatusIntegrator.natsJS.tls).customCerts).existingCertSecret ) -}}
{{- fail "Both existingKeySecret and existingCertSecret must be set when using nats customCerts" -}}
{{- end -}}
{{- end -}}

{{/*
Returns true if NATS TLS is enabled, custom certs have been provided and a CA secret has been provided
*/}}
{{- define "cluster-scanner.nats.tls.hasCustomCASecret" -}}
{{- if (include "cluster-scanner.nats.tls.hasCustomCert" .) -}}
{{- if and (.Values.runtimeStatusIntegrator.natsJS.tls.customCerts).existingCaSecret (.Values.runtimeStatusIntegrator.natsJS.tls.customCerts).existingCaSecretKeyName -}}
true
{{- end -}}
{{- end -}}
{{- end -}}
