{{- define "cluster.tls_certificates.required" -}}
  {{- if or
    (include "cluster.container_vulnerability_management_enabled" .)
    (include "cluster.audit_enabled" .)
    (include "cluster.admission_control_enabled" .)
  -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.secret_name" -}}
  {{- if .Values.cluster.tls_certificates.create -}}
    {{- include "cluster.fullname" . }}-tls-certificates
  {{- else if (include "cluster.tls_certificates.use_cert_manager" .) -}}
    {{- include "cluster.tls_certificates.cm_certificate_name" . -}}
  {{- else if .Values.cluster.tls_certificates.secret_name -}}
    {{- .Values.cluster.tls_certificates.secret_name -}}
  {{- else -}}
    {{- fail "TLS Certificates must be generated or specified with the current configuration" -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.mount_path" -}}
  /etc/sysdig/tls-certificates/
{{- end }}

{{- define "cluster.tls_certificates.cert_file_name" -}}
  tls.crt
{{- end }}

{{- define "cluster.tls_certificates.private_key_file_name" -}}
  tls.key
{{- end }}

{{- define "cluster.tls_certificates.ca_cert_file_name" -}}
  ca.crt
{{- end }}

{{- define "cluster.tls_certificates.dns_names" -}}
  {{- $dnsNames := list -}}
  {{- $dnsNames = append $dnsNames "localhost" -}}
  {{- range $serviceName := (list (include "cluster.service_name" .) (include "cluster.container_vulnerability_management_service_name" .)) }}
    {{- $dnsNames = append $dnsNames $serviceName -}}
    {{- $dnsNames = append $dnsNames (printf "*.%s" $serviceName ) -}}
    {{- $dnsNames = append $dnsNames (printf "*.%s.%s.svc" $serviceName $.Release.Namespace) -}}
    {{- $dnsNames = append $dnsNames (printf "%s.%s.svc" $serviceName $.Release.Namespace) -}}
    {{- $dnsNames = append $dnsNames (printf "*.%s.%s.svc.%s" $serviceName $.Release.Namespace $.Values.cluster_config.cluster_domain) -}}
    {{- $dnsNames = append $dnsNames (printf "%s.%s.svc.%s" $serviceName $.Release.Namespace $.Values.cluster_config.cluster_domain) -}}
  {{- end -}}
  {{- $dnsNames | toYaml  -}}
{{- end }}

{{- define "cluster.tls_certificates.check_conflicts" -}}
  {{- if and .Values.cluster.tls_certificates.create .Values.cluster.tls_certificates.cert_manager.enabled -}}
    {{- fail "Cannot specify both tls_certificates.create and tls_certificates.cert_manager.enabled" -}}
  {{- end -}}
  {{- if and (not (quote .Values.cluster.tls_certificates.secret_name | empty)) .Values.cluster.tls_certificates.cert_manager.enabled -}}
    {{- fail "Cannot specify both tls_certificates.cert_manager.enabled and tls_certificates.secret_name" -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.use_cert_manager" -}}
  {{- if and .Values.cluster.tls_certificates.cert_manager .Values.cluster.tls_certificates.cert_manager.enabled -}}
    {{- if and (not .Values.cluster.tls_certificates.cert_manager.ca.generate) (not .Values.cluster.tls_certificates.cert_manager.ca.secret_name) -}}
      {{- fail "cert_manager.ca.secret_name must be specified when CA generation is disabled" -}}
    {{- end -}}
    {{- if and (not .Values.cluster.tls_certificates.cert_manager.issuer.generate) (not .Values.cluster.tls_certificates.cert_manager.issuer.name) -}}
      {{- fail "cert_manager.issuer.name must be specified when Issuer generation is disabled" -}}
    {{- end -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_certificate_name" -}}
  {{- printf "%s-cm-tls" ((include "cluster.fullname" .) | trimSuffix "-" | trunc 57) -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_ca_secret_name" -}}
  {{- if .Values.cluster.tls_certificates.cert_manager.ca.generate -}}
    {{- printf "%s-cm-ca" ((include "cluster.fullname" .) | trimSuffix "-" | trunc 58) -}}
  {{- else -}}
    {{- .Values.cluster.tls_certificates.cert_manager.ca.secret_name -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_generate_ca" -}}
  {{- if and (include "cluster.tls_certificates.use_cert_manager" .) (.Values.cluster.tls_certificates.cert_manager.ca.generate) -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_generate_issuer" -}}
  {{- if and (include "cluster.tls_certificates.use_cert_manager" .) (.Values.cluster.tls_certificates.cert_manager.issuer.generate) -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_issuer_name" -}}
  {{- if .Values.cluster.tls_certificates.cert_manager.issuer.generate -}}
    {{- printf "%s-cm-self-issuer" ((include "cluster.fullname" .) | trimSuffix "-" | trunc 49) -}}
  {{- else -}}
    {{- .Values.cluster.tls_certificates.cert_manager.issuer.name -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_issuer_namespace" -}}
  {{- if .Values.cluster.tls_certificates.cert_manager.issuer.generate -}}
    {{- if and (not .Values.cluster.tls_certificates.cert_manager.ca.generate) (not (empty .Values.cluster.tls_certificates.cert_manager.ca.secret_namespace)) -}}
      {{- .Values.cluster.tls_certificates.cert_manager.ca.secret_namespace -}}
    {{- else -}}
      {{- .Release.Namespace -}}
    {{- end -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_self_ca_cert_name" -}}
  {{- printf "%s-cm-self-ca" ((include "cluster.fullname" .) | trimSuffix "-" | trunc 53) -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_issuer_kind" -}}
  {{- if .Values.cluster.tls_certificates.cert_manager.issuer.generate -}}
    {{- if and (not .Values.cluster.tls_certificates.cert_manager.ca.generate) (not (empty .Values.cluster.tls_certificates.cert_manager.ca.secret_namespace)) -}}
      {{- "ClusterIssuer" -}}
    {{- else -}}
      {{- "Issuer" -}}
    {{- end -}}
  {{- else -}}
    {{- .Values.cluster.tls_certificates.cert_manager.issuer.kind -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_issuer_group" -}}
  {{- if .Values.cluster.tls_certificates.cert_manager.issuer.generate -}}
    {{- "cert-manager.io" -}}
  {{- else -}}
    {{- .Values.cluster.tls_certificates.cert_manager.issuer.group -}}
  {{- end -}}
{{- end }}

{{/*
If we are generating the Issuer we are going to use the CA secret for the inject-ca annotation,
because the Issuer maybe not ready yet.
*/}}
{{- define "cluster.tls_certificates.cm_use_ca_secret" -}}
  {{- if (include "cluster.tls_certificates.cm_generate_issuer" .) -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cm_ca_secret_template" -}}
  {{- $tmpl := .Values.cluster.tls_certificates.cert_manager.ca.secret_template -}}
  {{- $injectAnnotation := "cert-manager.io/allow-direct-injection" -}}
  {{- if and (include "cluster.tls_certificates.cm_generate_ca" .) (include "cluster.tls_certificates.cm_generate_issuer" .) -}}
    {{- $currentAnnotations := $tmpl.annotations | default (dict) -}}
    {{- $_ := set $tmpl "annotations" (merge $currentAnnotations (dict $injectAnnotation "true")) -}}
  {{- end -}}
  {{- $tmpl | toYaml -}}
{{- end }}
