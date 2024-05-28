{{/*
Expand the name of the chart.
*/}}
{{- define "cluster-shield.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cluster-shield.fullname" -}}
{{- if contains .Chart.Name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
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
{{- $_ := set $conf "kubernetes" (include "cluster-shield.configurationKubernetes" . | fromYaml) }}
{{- if .Values.cluster_shield.features.container_vulnerability_management.enabled }}
{{- if regexMatch "^v?([0-9]+)(\\.[0-9]+)?(\\.[0-9]+)?(-([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?(\\+([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?$" (.Values.onPremCompatibilityVersion | default "") }}
{{- if semverCompare "< 7.0.0" .Values.onPremCompatibilityVersion -}}
{{- $_ := set $conf.features.container_vulnerability_management "platform_services_enabled" false }}
{{- end -}}
{{- end -}}
{{- $_ := set $conf "cluster_scanner" (include "cluster-shield.configurationClusterScanner" . | fromYaml) }}

{{- end }}
{{- $_ := unset $conf.sysdig_endpoint "access_key" }}
{{- $_ := unset $conf.sysdig_endpoint "secure_api_token" }}
{{- $conf | toYaml -}}
{{- end }}

{{/*
Adds kubernetes related keys to the configuration.
*/}}
{{- define "cluster-shield.secret" -}}
{{- $secret := dict "sysdig_endpoint" (dict) }}
{{- $_ := set $secret.sysdig_endpoint "access_key" .Values.cluster_shield.sysdig_endpoint.access_key }}
{{- $_ := set $secret.sysdig_endpoint "secure_api_token" .Values.cluster_shield.sysdig_endpoint.secure_api_token }}
{{- if .Values.cluster_shield.features.container_vulnerability_management.enabled }}
{{- $_ := set $secret "cluster_scanner" (include "cluster-shield.secretClusterScanner" . | fromYaml) }}
{{- end }}
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
Cluster Scanner Configuration
*/}}
{{- define "cluster-shield.secretClusterScanner" -}}
runtime_status_integrator:
    nats_server:
        password: {{ randAlphaNum 32 }}
{{- end }}

{{/*
Verify if certs needs to be generated and mounted inside the pod
*/}}
{{- define "cluster-shield.needCerts"}}
{{- or .Values.cluster_shield.features.audit.enabled .Values.cluster_shield.features.admission_control.enabled .Values.cluster_shield.features.container_vulnerability_management.enabled }}
{{- end -}}

{{/*
Custom CA
*/}}
{{- define "cluster-shield.custom_ca.enabled" -}}
    {{ or (eq (include "cluster-shield.custom_ca.useExistingSecret" .) "true") (eq (include "cluster-shield.custom_ca.useExistingConfigMap" .) "true") (eq (include "cluster-shield.custom_ca.useValues" .) "true") -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.useExistingSecret" -}}
    {{- if (and .Values.ca.existingCaSecretKeyName .Values.ca.existingCaSecret) -}}
        {{- true -}}
    {{- else -}}
        {{- false -}}
    {{- end -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.useExistingConfigMap" -}}
    {{- if (and .Values.ca.existingCaSecretKeyName .Values.ca.existingCaSecret) -}}
        {{- false -}}
    {{- else if (and .Values.ca.existingCaConfigMapKeyName .Values.ca.existingCaConfigMap) -}}
        {{- true -}}
    {{- else -}}
        {{- false -}}
    {{- end -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.useValues" -}}
    {{- if (and .Values.ca.existingCaSecretKeyName .Values.ca.existingCaSecret) -}}
        {{- false -}}
    {{- else if (and .Values.ca.existingCaConfigMapKeyName .Values.ca.existingCaConfigMap) -}}
        {{- false -}}
    {{- else if (and .Values.ca.certs .Values.ca.keyName) -}}
        {{- true -}}
    {{- else -}}
        {{- false -}}
    {{- end -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.keyName" -}}
    {{- if eq (include "cluster-shield.custom_ca.useExistingSecret" .) "true" -}}
        {{- .Values.ca.existingCaSecretKeyName -}}
    {{- else if eq (include "cluster-shield.custom_ca.useExistingConfigMap" .) "true" -}}
        {{- .Values.ca.existingCaConfigMapKeyName -}}
    {{- else if eq (include "cluster-shield.custom_ca.useValues" .) "true" -}}
        {{- .Values.ca.keyName -}}
    {{- end -}}
{{- end -}}

{{- define "cluster-shield.custom_ca.cert" -}}
    {{- join "" (.Values.ca.certs) -}}
{{- end -}}

{{/*
Generate certificates for aggregated api server
*/}}
{{- define "cluster-shield.tlsGenCerts" -}}
    {{- $secret := lookup "v1" "Secret" .Release.Namespace (include "cluster-shield.tlsCertsSecretName" .) -}}
    {{- if $secret -}}
        {{- printf "%s$%s$%s" (index $secret.data "tls.crt") (index $secret.data "tls.key") (index $secret.data "ca.crt") -}}
    {{- else -}}
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
        {{- $tlsCert := genSignedCertWithKey (include "cluster-shield.fullname" .) (list "127.0.0.1") ($dnsNames) 3650 $ca (genPrivateKey "ed25519") }}
        {{- printf "%s$%s$%s" ($tlsCert.Cert | b64enc) ($tlsCert.Key | b64enc) ($ca.Cert | b64enc) -}}
    {{- end -}}
{{- end -}}

{{/*
TLS Secret Name
*/}}
{{- define "cluster-shield.tlsCertsSecretName" -}}
    {{- include "cluster-shield.secretName" . -}}-tls-certs
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
tls.crt
{{- end }}


{{/*
Audit Cert Private Key File
*/}}
{{- define "cluster-shield.tlsCertPrivateKeyFileName" -}}
tls.key
{{- end }}

{{/*
CA Cert File Name
*/}}
{{- define "cluster-shield.caCertFileName" -}}
ca.crt
{{- end }}

{{/*
Audit Port
*/}}
{{- define "cluster-shield.admissionControllerAuditPort" -}}
6443
{{- end }}

{{/*
Audit Port
*/}}
{{- define "cluster-shield.admissionControlPort" -}}
8443
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
