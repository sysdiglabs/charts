{{/*
Expand the name of the chart.
*/}}
{{- define "cluster-shield.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" | lower }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cluster-shield.fullname" -}}
{{- if contains .Chart.Name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" | lower }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" | lower }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cluster-shield.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cluster-shield.labels" -}}
helm.sh/chart: {{ include "cluster-shield.chart" . }}
{{ include "cluster-shield.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cluster-shield.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cluster-shield.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Adds kubernetes related keys to the configuration.
*/}}
{{- define "cluster-shield.configMap" -}}
{{- $conf := deepCopy .Values.cluster_shield -}}
{{- $_ := set $conf "kubernetes" (include "cluster-shield.configurationKubernetes" . | fromYaml) -}}
{{- if eq "true" (include "cluster-shield.containerVulnerabilityManagementEnabled" .) -}}
{{- if regexMatch "^v?([0-9]+)(\\.[0-9]+)?(\\.[0-9]+)?(-([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?(\\+([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?$" (.Values.onPremCompatibilityVersion | default "") -}}
{{- if semverCompare "< 6.12.0" .Values.onPremCompatibilityVersion -}}
{{- $_ := set $conf.features.container_vulnerability_management "platform_services_enabled" false -}}
{{- end -}}
{{- end -}}
{{- $_ := set $conf "cluster_scanner" (merge (include "cluster-shield.configurationClusterScanner" . | fromYaml) (.Values.cluster_shield.cluster_scanner | default dict)) -}}
{{- end -}}
{{- if and (.Values.cluster_shield.features.admission_control.enabled) (.Values.cluster_shield.features.admission_control.container_vulnerability_management.enabled)}}
{{- $_ := set $conf "admission_controller_secure" (include "cluster-shield.configurationAdmissionControllerSecure" . | fromYaml) -}}
{{- end}}
{{- $_ := unset $conf.sysdig_endpoint "access_key" -}}
{{- $_ := unset $conf.sysdig_endpoint "secure_api_token" -}}
{{/* sysdig-deploy support start */}}
{{- if not .Values.cluster_shield.cluster_config.name -}}
{{- if .Values.global.clusterConfig.name -}}
{{- $_ := set $conf "cluster_config" (dict "name" .Values.global.clusterConfig.name) -}}
{{- else -}}
{{- fail "One of global.clusterConfig.name and cluster_shield.cluster_config.name must be defined." -}}
{{- end -}}
{{- end -}}
{{- if not .Values.cluster_shield.sysdig_endpoint.region -}}
{{- if .Values.global.sysdig.region -}}
{{- $_ := set $conf.sysdig_endpoint "region" .Values.global.sysdig.region -}}
{{- else -}}
{{- fail "One of global.sysdig.region and cluster_shield.sysdig_endpoint.region must be defined." -}}
{{- end -}}
{{- end -}}
{{- if eq $conf.sysdig_endpoint.region "custom" -}}
{{- if and (not .Values.cluster_shield.sysdig_endpoint.api_url) .Values.global.sysdig.apiHost -}}
{{- $_ := set $conf.sysdig_endpoint "api_url" .Values.global.sysdig.apiHost -}}
{{- if not (or (hasPrefix "https://" .Values.global.sysdig.apiHost) (hasPrefix "http://" .Values.global.sysdig.apiHost)) -}}
{{- $_ := set $conf.sysdig_endpoint "api_url" (printf "https://%s" .Values.global.sysdig.apiHost) -}}
{{- end -}}
{{- end -}}
{{- if not $conf.sysdig_endpoint.api_url -}}
{{- fail "Custom region requires one of global.sysdig.apiHost or cluster_shield.sysdig_endpoint.api_url to be defined." -}}
{{- end -}}
{{- if and ($conf.features.kubernetes_metadata.enabled) (not $conf.sysdig_endpoint.collector) -}}
{{- fail "Custom region requires cluster_shield.sysdig_endpoint.collector to be defined." -}}
{{- end -}}
{{- end -}}
{{- if not (hasKey (default .Values.cluster_shield.ssl dict) "verify") -}}
{{- $_ := set $conf "ssl" (dict "verify" .Values.global.sslVerifyCertificate) -}}
{{- end -}}
{{- if not .Values.cluster_shield.cluster_config.name -}}
{{- if .Values.global.clusterConfig.name -}}
{{- $_ := set $conf.cluster_config "name" .Values.global.clusterConfig.name -}}
{{- else -}}
{{- fail "One of global.clusterConfig.name and cluster_shield.cluster_config.name must be defined." -}}
{{- end -}}
{{- end -}}
{{/* sysdig-deploy support end */}}
{{- $conf | toYaml -}}
{{- end -}}

{{/*
Generate Secret
*/}}
{{- define "cluster-shield.secret" -}}
{{- $secret := dict -}}
{{- if not .Values.global.sysdig.accessKeySecret -}}
    {{- $accessKey := coalesce .Values.cluster_shield.sysdig_endpoint.access_key .Values.global.sysdig.accessKey -}}
    {{- if not $accessKey -}}
        {{- fail "One of global.sysdig.accessKey and cluster_shield.sysdig_endpoint.access_key must be defined." -}}
    {{- end -}}
    {{- $_ := set $secret "sysdig-access-key" $accessKey -}}
{{- end -}}
{{- if not .Values.global.sysdig.secureAPITokenSecret -}}
    {{- $secureApiToken := coalesce .Values.cluster_shield.sysdig_endpoint.secure_api_token .Values.global.sysdig.secureAPIToken -}}
    {{- if $secureApiToken -}}
        {{- $_ := set $secret "sysdig-secure-api-token" $secureApiToken -}}
    {{- end -}}
{{- end -}}
{{- if eq "true" (include "cluster-shield.containerVulnerabilityManagementEnabled" .) -}}
    {{- $userDefinedNatsPassword := dig "cluster_scanner" "runtime_status_integrator" "nats_server" "password" nil .Values.cluster_shield -}}
    {{- $_ := set $secret "sysdig-cluster-nats-password" (default (randAlphaNum 32) $userDefinedNatsPassword) -}}
{{- end -}}
{{- range $index, $value := $secret }}
    {{- $_ := set $secret $index (b64enc $value) -}}
{{- end -}}
{{- $secret | toYaml -}}
{{- end }}

{{/*
Cluster Scanner Lock Name
*/}}
{{- define "cluster-shield.clusterScannerLockName" -}}
    {{- include "cluster-shield.fullname" . -}}
{{- end }}

{{/*
Cluster Scanner Service Name
*/}}
{{- define "cluster-shield.clusterScannerServiceName" -}}
    {{- include "cluster-shield.fullname" . -}}-cluster-scanner
{{- end }}

{{/*
Kubernetes Configuration
*/}}
{{- define "cluster-shield.configurationKubernetes" -}}
running_namespace: {{ .Release.Namespace }}
{{- if eq (include "cluster-shield.needCerts" .) "true" }}
tls_cert_file: {{ include "cluster-shield.tlsCertFilePath" . }}
tls_private_key_file: {{ include "cluster-shield.tlsCertPrivateKeyPath" . }}
ca_cert_file: {{ include "cluster-shield.caCertFilePath" . }}
{{- end }}
{{- end }}

{{/*
Cluster Scanner Configuration
*/}}
{{- define "cluster-shield.configurationClusterScanner" -}}
leader_election_lock_name: {{ include "cluster-shield.clusterScannerLockName" . }}
image_sbom_extractor:
    nats_url: nats://{{ include "cluster-shield.clusterScannerServiceName" . }}:4222
{{- end }}

{{/*
Admission Controller Secure Configuration
*/}}
{{- define "cluster-shield.configurationAdmissionControllerSecure" -}}
rsi_grpc_endpoint: {{ include "cluster-shield.clusterScannerServiceName" . }}:9999
{{- end }}


{{/*
Verify if certs needs to be generated and mounted inside the pod
*/}}
{{- define "cluster-shield.needCerts"}}
{{- or .Values.cluster_shield.features.audit.enabled .Values.cluster_shield.features.admission_control.enabled (eq "true" (include "cluster-shield.containerVulnerabilityManagementEnabled" .)) }}
{{- end -}}

{{/*
Verify if ValidatingWebhookConfiguration needs to be generated
*/}}
{{- define "cluster-shield.needWebhooks"}}
{{- or .Values.cluster_shield.features.audit.enabled .Values.cluster_shield.features.admission_control.enabled }}
{{- end -}}

{{/*
Custom CA
*/}}
{{- define "cluster-shield.custom_ca.enabled" -}}
    {{ or (eq (include "cluster-shield.custom_ca.useExistingSecret" .) "true") (eq (include "cluster-shield.custom_ca.useExistingConfigMap" .) "true") (eq (include "cluster-shield.custom_ca.useValues" .) "true") -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.useExistingSecret" -}}
    {{- if or (and .Values.ca.existingCaSecretKeyName .Values.ca.existingCaSecret) (and .Values.global.ssl.ca.existingCaSecretKeyName .Values.global.ssl.ca.existingCaSecret) -}}
        {{- true -}}
    {{- else -}}
        {{- false -}}
    {{- end -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.useExistingConfigMap" -}}
    {{- if or (and .Values.ca.existingCaSecretKeyName .Values.ca.existingCaSecret) (and .Values.global.ssl.ca.existingCaSecretKeyName .Values.global.ssl.ca.existingCaSecret) -}}
        {{- false -}}
    {{- else if or (and .Values.ca.existingCaConfigMapKeyName .Values.ca.existingCaConfigMap) (and .Values.global.ssl.ca.existingCaConfigMapKeyName .Values.global.ssl.ca.existingCaConfigMap) -}}
        {{- true -}}
    {{- else -}}
        {{- false -}}
    {{- end -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.useValues" -}}
    {{- if or (and .Values.ca.existingCaSecretKeyName .Values.ca.existingCaSecret) (and .Values.global.ssl.ca.existingCaSecretKeyName .Values.global.ssl.ca.existingCaSecret) -}}
        {{- false -}}
    {{- else if (and .Values.ca.existingCaConfigMapKeyName .Values.ca.existingCaConfigMap) -}}
        {{- false -}}
    {{- else if or (and .Values.ca.certs .Values.ca.keyName) (and .Values.global.ssl.ca.keyName .Values.global.ssl.ca.certs) -}}
        {{- true -}}
    {{- else -}}
        {{- false -}}
    {{- end -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.keyName" -}}
    {{- if eq (include "cluster-shield.custom_ca.useExistingSecret" .) "true" -}}
        {{- .Values.ca.existingCaSecretKeyName | default .Values.global.ssl.ca.existingCaSecretKeyName -}}
    {{- else if eq (include "cluster-shield.custom_ca.useExistingConfigMap" .) "true" -}}
        {{- .Values.ca.existingCaConfigMapKeyName | default .Values.global.ssl.ca.existingCaConfigMapKeyName -}}
    {{- else if eq (include "cluster-shield.custom_ca.useValues" .) "true" -}}
        {{- .Values.ca.keyName | default .Values.global.ssl.ca.keyName -}}
    {{- end -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.cert" -}}
    {{- join "" (.Values.ca.certs | default .Values.global.ssl.ca.certs) -}}
{{- end -}}

{{/*
Generate certificates for aggregated api server
*/}}
{{- define "cluster-shield.tlsGenCerts" -}}
    {{- $secret := lookup "v1" "Secret" .Release.Namespace (include "cluster-shield.tlsCertsSecretName" .) -}}
    {{- if $secret -}}
        {{- printf "%s$%s$%s" (index $secret.data (include "cluster-shield.tlsCertFileName" .)) (index $secret.data (include "cluster-shield.tlsCertPrivateKeyFileName" .)) (index $secret.data (include "cluster-shield.caCertFileName" .)) -}}
    {{- else -}}
        {{- if .Values.existingTLSSecret.name }}
            {{- fail (printf "The TLS Secret '%s' does not exist" .Values.existingTLSSecret.name) -}}
        {{- end }}
        {{- $svcName := include "cluster-shield.fullname" . -}}
        {{- $clusterScannerSvcName := include "cluster-shield.clusterScannerServiceName" . -}}

        {{- $dnsNames := list -}}
        {{- $dnsNames = append $dnsNames "localhost" -}}

        {{- $dnsNames = append $dnsNames $svcName -}}
        {{- $dnsNames = append $dnsNames (printf "*.%s" $svcName ) -}}
        {{- $dnsNames = append $dnsNames (printf "*.%s.%s.svc" $svcName .Release.Namespace) -}}
        {{- $dnsNames = append $dnsNames (printf "%s.%s.svc" $svcName .Release.Namespace) -}}
        {{- $dnsNames = append $dnsNames (printf "*.%s.%s.svc.cluster.local" $svcName .Release.Namespace) -}}
        {{- $dnsNames = append $dnsNames (printf "%s.%s.svc.cluster.local" $svcName .Release.Namespace) -}}

        {{- $dnsNames = append $dnsNames $clusterScannerSvcName -}}
        {{- $dnsNames = append $dnsNames (printf "*.%s" $clusterScannerSvcName ) -}}
        {{- $dnsNames = append $dnsNames (printf "*.%s.%s.svc" $clusterScannerSvcName .Release.Namespace) -}}
        {{- $dnsNames = append $dnsNames (printf "%s.%s.svc" $clusterScannerSvcName .Release.Namespace) -}}
        {{- $dnsNames = append $dnsNames (printf "*.%s.%s.svc.cluster.local" $clusterScannerSvcName .Release.Namespace) -}}
        {{- $dnsNames = append $dnsNames (printf "%s.%s.svc.cluster.local" $clusterScannerSvcName .Release.Namespace) -}}


        {{- $ca := genCA (include "cluster-shield.fullname" .) 3650 -}}
        {{- $tlsCert := genSignedCert (include "cluster-shield.fullname" .) (list "127.0.0.1") $dnsNames 3650 $ca -}}
        {{- printf "%s$%s$%s" ($tlsCert.Cert | b64enc) ($tlsCert.Key | b64enc) ($ca.Cert | b64enc) -}}
    {{- end -}}
{{- end -}}

{{/*
TLS Secret Name
*/}}
{{- define "cluster-shield.tlsCertsSecretName" -}}
    {{- .Values.existingTLSSecret.name | default (printf "%s-tls-certs" (include "cluster-shield.secretName" .)) -}}
{{- end -}}

{{/*
TLS Sec
*/}}
{{- define "cluster-shield.tlsCertFilePath" -}}
    /cert/{{ include "cluster-shield.tlsCertFileName" . }}
{{- end }}


{{/*
Audit Cert Private Key File
*/}}
{{- define "cluster-shield.tlsCertPrivateKeyPath" -}}
    /cert/{{ include "cluster-shield.tlsCertPrivateKeyFileName" . }}
{{- end }}

{{/*
CA Cert File Path
*/}}
{{- define "cluster-shield.caCertFilePath" -}}
    /cert/{{ include "cluster-shield.caCertFileName" . }}
{{- end }}

{{/*
Audit Cert File
*/}}
{{- define "cluster-shield.tlsCertFileName" -}}
{{- .Values.existingTLSSecret.tlsCertName | default "tls.crt" -}}
{{- end }}


{{/*
Audit Cert Private Key File
*/}}
{{- define "cluster-shield.tlsCertPrivateKeyFileName" -}}
{{- .Values.existingTLSSecret.tlsCertKeyName | default "tls.key" -}}
{{- end }}

{{/*
CA Cert File Name
*/}}
{{- define "cluster-shield.caCertFileName" -}}
{{- .Values.existingTLSSecret.caCertName | default "ca.crt" -}}
{{- end }}

{{/*
ConfigMap Name
*/}}
{{- define "cluster-shield.configmapName" -}}
    {{- printf "sysdig-%s" (include "cluster-shield.name" .) }}
{{- end -}}

{{/*
Secret Name
*/}}
{{- define "cluster-shield.secretName" -}}
    {{- printf "sysdig-%s" (include "cluster-shield.name" .) }}
{{- end -}}

{{/*
TLS Secret Name
*/}}
{{- define "cluster-shield.customCASecretName" -}}
    {{- include "cluster-shield.name" . -}}-ca
{{- end -}}

{{/*
Proxy Secret Name
*/}}
{{- define "cluster-shield.proxySecretName" -}}
    {{- include "cluster-shield.secretName" . -}}-proxy
{{- end -}}

{{/*
Check if Container Vulnerability Management is enabled
*/}}
{{- define "cluster-shield.containerVulnerabilityManagementEnabled" -}}
    {{- or (.Values.cluster_shield.features.container_vulnerability_management.enabled) (and (.Values.cluster_shield.features.admission_control.enabled) (.Values.cluster_shield.features.admission_control.container_vulnerability_management.enabled)) -}}
{{- end -}}

{{/*
Proxy Secret Name
*/}}
{{- define "cluster-shield.proxyEnabled" -}}
{{- if or (or .Values.proxy.httpProxy .Values.global.proxy.httpProxy) (or .Values.proxy.httpsProxy .Values.global.proxy.httpsProxy) }}
{{- true }}
{{- end }}
{{- end -}}

{{/*
Define the proper image repository to use for cluster-shield
*/}}
{{- define "cluster-shield.repository" -}}
    {{- printf "%s/%s" (default .Values.image.registry .Values.global.imageRegistry) .Values.image.repository -}}
{{- end -}}

{{- define "cluster-shield.serviceMonitoringPort" -}}
    {{ .Values.service.monitoring_port | default .Values.cluster_shield.monitoring_port }}
{{- end -}}

{{- define "cluster-shield.serviceAdmissionControlPort" -}}
    {{ .Values.service.admission_control_port | default .Values.cluster_shield.features.admission_control.http_port }}
{{- end -}}

{{- define "cluster-shield.serviceAuditPort" -}}
    {{ .Values.service.audit_port | default .Values.cluster_shield.features.audit.http_port }}
{{- end -}}

{{- define "cluster-shield.priorityClassName" -}}
    {{ .Values.priorityClassName | default (include "cluster-shield.fullname" .) }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "cluster-shield.serviceAccountName" -}}
{{- .Values.serviceAccount.name | default (include "cluster-shield.fullname" .) }}
{{- end }}

{{/*
Verify if the application needs to start in single process mode
*/}}
{{- define "cluster-shield.isSingleProcess"}}
{{- or (ne .Values.run_command "run-all-namespaced") .Values.global.gke.autopilot }}
{{- end -}}

{{- define "cluster-shield.command" -}}
{{- if eq "true" (include "cluster-shield.isSingleProcess" .) -}}
run-all
{{- else -}}
run-all-namespaced
{{- end -}}
{{- end -}}

{{- define "cluster-shield.secret_mounts" -}}
{{- $secrets := list (include "cluster-shield.secretName" .) .Values.global.sysdig.accessKeySecret .Values.global.sysdig.secureAPITokenSecret}}
{{- (uniq (compact $secrets)) | toYaml -}}
{{- end -}}
