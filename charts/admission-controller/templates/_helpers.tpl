{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "admissionController.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "admissionController.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "admissionController.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Returns the namespace for installing components
*/}}
{{- define "admissionController.namespace" -}}
    {{- coalesce .Values.namespace .Values.global.clusterConfig.namespace .Release.Namespace -}}
{{- end -}}

{{/*
Admission Controller labels
*/}}
{{- define "admissionController.labels" -}}
helm.sh/chart: {{ include "admissionController.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.labels }}
{{- $tp := typeOf .Values.labels }}
{{- if eq $tp "string" }}
{{- if not (regexMatch "^[a-z0-9A-Z].*(: )(.*[a-z0-9A-Z]$)?" .Values.labels) }}
    {{- fail "labels does not seem to be of the type key:[space]value" }}
{{- end }}
{{ tpl .Values.labels . }}
{{- else }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admissionController.selectorLabels" -}}
app.kubernetes.io/name: {{ include "admissionController.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Admission Controller Specific Options
*/}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "admissionController.webhook.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.webhook.name| trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.webhook.name | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "admissionController.webhook.defaultPodAnnotations" -}}
{{- toYaml (dict "prometheus.io/path" "/metrics" "prometheus.io/port" (cat .Values.webhook.http.port) "prometheus.io/scheme" "https" "prometheus.io/scrape" "true" "sidecar.istio.io/inject" "false") -}}
{{- end -}}

{{- define "admissionController.webhook.podAnnotations" -}}
{{- if .Values.webhook.podAnnotations }}
{{- .Values.webhook.podAnnotations | toYaml -}}
{{- else -}}
{{- include "admissionController.webhook.defaultPodAnnotations" . -}}
{{- end -}}
{{- end -}}

{{- define "admissionController.webhook.defaultSecurityContext" -}}
 {{- if (lt (int .Values.webhook.http.port) 1024) -}}
        {{- toYaml (dict "runAsUser" 0 "runAsNonRoot" false) -}}
    {{- else -}}
        {{- toYaml (dict "runAsUser" 1000 "runAsNonRoot" true) -}}
    {{- end -}}
{{- end -}}

{{/*
Determine Secure endpoint based on provided region or .Values.sysdig.apiEndpoint
*/}}
{{- define "admissionController.apiEndpoint" -}}
    {{- if (or .Values.sysdig.apiEndpoint (eq .Values.global.sysdig.region "custom"))  -}}
        {{- required "A valid Sysdig API endpoint (.sysdig.apiEndpoint) is required" .Values.sysdig.apiEndpoint -}}
    {{- else if hasKey ((include "sysdig.regions" .) | fromYaml) .Values.global.sysdig.region }}
        {{- include "sysdig.secureApiEndpoint" . }}
    {{- end -}}
{{- end -}}

{{/*
Sysdig NATS service URL
*/}}
{{- define "admissionController.natsUrl" -}}
{{- if .Values.webhook.v2.nats.url -}}
    {{- .Values.webhook.v2.nats.url -}}
{{- else -}}
    wss://{{ include "admissionController.apiEndpoint" . }}:443
{{- end -}}
{{- end -}}


{{/*
Common labels
*/}}
{{- define "admissionController.webhook.labels" -}}
{{ include "admissionController.labels" . }}
{{ include "admissionController.webhook.selectorLabels" . }}
{{- if .Values.webhook.labels }}
{{- $tp := typeOf .Values.webhook.labels }}
{{- if eq $tp "string" }}
{{- if not (regexMatch "^[a-z0-9A-Z].*(: )(.*[a-z0-9A-Z]$)?" .Values.webhook.labels) }}
    {{- fail "labels does not seem to be of the type key:[space]value" }}
{{- end }}
{{ tpl .Values.webhook.labels . }}
{{- else }}
{{ toYaml .Values.webhook.labels }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admissionController.webhook.selectorLabels" -}}
{{ include "admissionController.selectorLabels" . }}
app.kubernetes.io/component: webhook
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "admissionController.webhook.serviceAccountName" -}}
    {{ default (include "admissionController.webhook.fullname" .) .Values.serviceAccounts.webhook.name }}
{{- end -}}

{{/*
Generate certificates for aggregated api server
*/}}

{{- define "admissionController.webhook.gen-certs" -}}
    {{- $secretName := printf "%s-tls" (include "admissionController.webhook.fullname" .) -}}
    {{- $secret := lookup "v1" "Secret" .Release.Namespace $secretName -}}

    {{- if and .Values.webhook.ssl.reuseTLSSecret $secret -}}
        {{- printf "%s$%s$%s" (index $secret.data "tls.crt") (index $secret.data "tls.key") (index $secret.data "ca.crt") -}}
    {{- else -}}
        {{- $ca := genCA (include "admissionController.webhook.fullname" .) 3650 -}}
        {{- $cn := printf "%s.%s.svc" (include "admissionController.webhook.fullname" .) .Release.Namespace -}}
        {{- $san := list $cn -}}
        {{- $cert := genSignedCert $cn nil $san 3650 $ca -}}
        {{- printf "%s$%s$%s" ($cert.Cert | b64enc) ($cert.Key | b64enc) ($ca.Cert | b64enc) -}}
    {{- end -}}
{{- end -}}

{{/*
Allow overriding registry and repository for air-gapped environments
*/}}
{{- define "admissionController.webhook.image" -}}
{{- if .Values.webhook.image.overrideValue -}}
    {{- .Values.webhook.image.overrideValue -}}
{{- else -}}
    {{- $imageRegistry := .Values.webhook.image.registry -}}
    {{- $imageRepository := .Values.webhook.image.repository -}}
    {{- $imageTag := .Values.webhook.image.tag | default .Chart.AppVersion -}}
    {{- $imageDigest := .Values.webhook.image.digest -}}
    {{- $globalRegistry := (default .Values.global dict).imageRegistry -}}
    {{- $globalRegistry | default $imageRegistry | default "docker.io" -}} / {{- $imageRepository -}} {{- if $imageDigest -}} @ {{- $imageDigest -}} {{- else -}} : {{- $imageTag -}} {{- end -}}
{{- end -}}
{{- end -}}

{{- define "admissionController.kspm.image" -}}
{{- if .Values.webhook.v2.image.overrideValue -}}
    {{- .Values.webhook.v2.image.overrideValue -}}
{{- else -}}
    {{- $imageRegistry := .Values.webhook.v2.image.registry -}}
    {{- $imageRepository := .Values.webhook.v2.image.repository -}}
    {{- $imageTag := .Values.webhook.v2.image.tag -}}
    {{- $imageDigest := .Values.webhook.v2.image.digest -}}
    {{- $globalRegistry := (default .Values.global dict).imageRegistry -}}
    {{- $globalRegistry | default $imageRegistry | default "docker.io" -}} / {{- $imageRepository -}} {{- if $imageDigest -}} @ {{- $imageDigest -}} {{- else -}} : {{- $imageTag -}} {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Inline Scanner Service
*/}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "admissionController.scanner.fullname" -}}
{{- if .Values.scanner.fullnameOverride -}}
{{- .Values.scanner.fullnameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.scanner.name| trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.scanner.name | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "admissionController.scanner.labels" -}}
{{ include "admissionController.labels" . }}
{{ include "admissionController.scanner.selectorLabels" . }}
{{- if .Values.scanner.labels }}
{{- $tp := typeOf .Values.scanner.labels }}
{{- if eq $tp "string" }}
{{- if not (regexMatch "^[a-z0-9A-Z].*(: )(.*[a-z0-9A-Z]$)?" .Values.scanner.labels) }}
    {{- fail "labels does not seem to be of the type key:[space]value" }}
{{- end }}
{{ tpl .Values.scanner.labels . }}
{{- else }}
{{ toYaml .Values.scanner.labels }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "admissionController.scanner.selectorLabels" -}}
{{ include "admissionController.selectorLabels" . }}
app.kubernetes.io/component: scanner
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "admissionController.scanner.serviceAccountName" -}}
    {{ default (include "admissionController.scanner.fullname" .) .Values.serviceAccounts.scanner.name }}
{{- end -}}

{{/*
Allow overriding registry and repository for air-gapped environments
*/}}
{{- define "admissionController.scanner.image" -}}
{{- if .Values.scanner.image.overrideValue -}}
    {{- .Values.scanner.image.overrideValue -}}
{{- else -}}
    {{- $imageRegistry := .Values.scanner.image.registry -}}
    {{- $imageRepository := .Values.scanner.image.repository -}}
    {{- $imageTag := .Values.scanner.image.tag | default .Chart.AppVersion -}}
    {{- $imageDigest := .Values.scanner.image.digest -}}
    {{- $globalRegistry := (default .Values.global dict).imageRegistry -}}
    {{- $globalRegistry | default $imageRegistry | default "docker.io" -}} / {{- $imageRepository -}} {{- if $imageDigest -}} @ {{- $imageDigest -}} {{- else -}} : {{- $imageTag -}} {{- end -}}
{{- end -}}
{{- end -}}

{{/*
the following helper function designed to take the accessKey if specified locally and if it doesn't exist use the global one
*/}}

{{- define "sysdig.accessKey" -}}
    {{- .Values.sysdig.accessKey | default .Values.global.sysdig.accessKey | default "" -}}
{{- end -}}

{{- define "sysdig.existingAccessKeySecret" -}}
    {{- .Values.sysdig.existingAccessKeySecret | default .Values.global.sysdig.accessKeySecret | default .Values.global.sysdig.existingAccessKeySecret | default "" -}}
{{- end -}}

{{/*
The following helper functions are all designed to use global values where
possible, but accept overrides from the chart values.
*/}}
{{- define "sysdig.secureAPIToken" -}}
    {{- .Values.sysdig.secureAPIToken | default .Values.global.sysdig.secureAPIToken -}}
{{- end -}}

{{- define "sysdig.secureAPITokenSecret" -}}
    {{- .Values.sysdig.existingSecureAPITokenSecret | default .Values.global.sysdig.secureAPITokenSecret | default "" -}}
{{- end -}}

{{- define "clusterName" -}}
    {{- required "A valid cluster name is required" (.Values.clusterName | default .Values.global.clusterConfig.name) -}}
{{- end -}}

{{- define "scanner.httpProxy" -}}
    {{- .Values.scanner.httpProxy | default .Values.global.proxy.httpProxy | default "" -}}
{{- end -}}

{{- define "scanner.httpsProxy" -}}
    {{- .Values.scanner.httpsProxy | default .Values.global.proxy.httpsProxy | default "" -}}
{{- end -}}

{{- define "scanner.noProxy" -}}
    {{- .Values.scanner.noProxy | default .Values.global.proxy.noProxy | default "" -}}
{{- end -}}

{{- define "webhook.httpProxy" -}}
    {{- .Values.webhook.httpProxy | default .Values.global.proxy.httpProxy | default "" -}}
{{- end -}}

{{- define "webhook.httpsProxy" -}}
    {{- .Values.webhook.httpsProxy | default .Values.global.proxy.httpsProxy | default "" -}}
{{- end -}}

{{- define "webhook.noProxy" -}}
    {{- .Values.webhook.noProxy | default .Values.global.proxy.noProxy | default "" -}}
{{- end -}}

{{/*
Validate Secure API Token Config
The follwoing named template is not used in the chart itself, it is used to
check whether at least one of the required parameters was specified and return
an error if not.
*/}}
{{- define "admissionController.validTokenConfig" -}}
{{- $errorMsg := "The Sysdig Secure API Token was not provided with either the sysdig.secureAPIToken or sysdig.secureAPITokenSecret values." -}}
    {{- required $errorMsg (or (include "sysdig.secureAPIToken" .) (include "sysdig.secureAPITokenSecret" .)) -}}
{{- end -}}


{{/*
Validate Secure Access Key Config
The follwoing named template is not used in the chart itself, it is used to
check whether at least one of the required parameters was specified and return
an error if not.
*/}}
{{- define "admissionController.validAccessKeyConfig" -}}
{{- $errorMsg := "The Sysdig Secure Access Key was not provided with either the sysdig.accessKey or sysdig.existingAccessKeySecret values." -}}
    {{- required $errorMsg (or (include "sysdig.accessKey" .) (include "sysdig.existingAccessKeySecret" .)) -}}
{{- end -}}

{{/* Returns string 'true' if the cluster's kubeVersion is less than the parameter provided, or nothing otherwise
     Use like: {{ include "admissionController.kubeVersionLessThan" (dict "root" . "major" <kube_major_to_compare> "minor" <kube_minor_to_compare>) }}

     Note: The use of `"root" .` in the parameter dict is necessary as the .Capabilities fields are not provided in
           helper functions when "helm template" is used.
*/}}
{{- define "admissionController.kubeVersionLessThan" }}
{{- if (and (le (.root.Capabilities.KubeVersion.Major | int) .major)
            (lt (.root.Capabilities.KubeVersion.Minor | trimSuffix "+" | int) .minor)) }}
true
{{- end }}
{{- end }}

{{- define "admissionController.webhookTemplate" }}
webhooks:
{{- if .Values.features.kspmAdmissionController}}
- name: vac.secure.sysdig.com
  namespaceSelector:
    matchExpressions:
    - key: kubernetes.io/metadata.name
      operator: NotIn
      values:
        - {{ include "admissionController.namespace" . }}
  rules:
  - apiGroups:
    - ""
    - apps
    - batch
    apiVersions: ["v1"]
    operations: ["CREATE", "UPDATE"]
    resources:
{{- if (.Values.webhook.vm).enabled }}
    - "pods"
{{- end }}
    - "deployments"
    - "replicasets"
    - "statefulsets"
    - "daemonsets"
    - "jobs"
    - "cronjobs"
    scope: "Namespaced"
  clientConfig:
    service:
      namespace: {{ include "admissionController.namespace" . }}
      name: {{ include "admissionController.webhook.fullname" . }}
      path: /validate
      port:  {{ .Values.webhook.v2.service.port }}
    caBundle: {{ .Cert }}

  admissionReviewVersions: ["v1", "v1beta1"]
  sideEffects: None
  timeoutSeconds: {{ .Values.webhook.timeoutSeconds }}
  {{- if .Values.webhook.denyOnError }}
  failurePolicy: Fail
  {{- else }}
  failurePolicy: Ignore
  {{- end }}
{{- end }}
{{- if or .Values.scanner.enabled .Values.webhook.acConfig }}
- name: scanning.secure.sysdig.com
  namespaceSelector:
    matchExpressions:
    - key: kubernetes.io/metadata.name
      operator: NotIn
      values:
        - {{ include "admissionController.namespace" . }}
  matchPolicy: Equivalent
  rules:
  - apiGroups:
    - ""
    - apps
    - batch
    apiVersions: ["v1"]
    operations: ["CREATE", "UPDATE"]
    resources:
    - "pods"
    - "deployments"
    - "replicasets"
    - "statefulsets"
    - "daemonsets"
    - "jobs"
    - "cronjobs"
    scope: "*"
  clientConfig:
    service:
      namespace: {{ include "admissionController.namespace" . }}
      name: {{ include "admissionController.webhook.fullname" . }}
      path: /allow-pod
      port:  {{ .Values.webhook.service.port }}
    caBundle: {{ .Cert }}
  admissionReviewVersions: ["v1", "v1beta1"]
  sideEffects: None
  timeoutSeconds: {{ .Values.webhook.timeoutSeconds }}
  {{- if .Values.webhook.denyOnError }}
  failurePolicy: Fail
  {{- else }}
  failurePolicy: Ignore
  {{- end }}
{{- end }}
{{- if .Values.features.k8sAuditDetections }}
- name: audit.secure.sysdig.com
  matchPolicy: Equivalent
  rules:
  {{- with .Values.features.k8sAuditDetectionsRules }}
    {{- toYaml . | nindent 2 }}
  {{- end }}
  clientConfig:
    service:
      namespace: {{ include "admissionController.namespace" . }}
      name: {{ include "admissionController.webhook.fullname" . }}
      path: /k8s-audit
      port:  {{ .Values.webhook.service.port }}
    caBundle: {{ .Cert }}
  admissionReviewVersions: ["v1", "v1beta1"]
  sideEffects: None
  timeoutSeconds: {{ .Values.webhook.timeoutSeconds }}
  failurePolicy: Ignore
{{- end }}
{{- end }}

{{- define "admissionController.webhook.vmClusterScannerEndpoint" -}}
{{- if not (and (.Values.webhook.vm).enabled (.Values.webhook.vm).clusterScannerEndpoint) -}}
{{- required "A valid Sysdig API endpoint (.webhook.vm.clusterScannerEndpoint) is required" (.Values.webhook.vm).clusterScannerEndpoint -}}
{{- else }}
{{- (.Values.webhook.vm).clusterScannerEndpoint -}}
{{- end -}}
{{- end -}}
