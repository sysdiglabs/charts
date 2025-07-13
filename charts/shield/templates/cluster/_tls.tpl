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
  {{- if or .Values.cluster.tls_certificates.create .Values.cluster.tls_certificates.cert_manager.enabled -}}
    {{- include "cluster.fullname" . }}-tls-certificates
  {{- else if .Values.cluster.tls_certificates.secret_name -}}
    {{- .Values.cluster.tls_certificates.secret_name -}}
  {{- else -}}
    {{- fail "TLS Certificates must be generated or specified with the current configuration" -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.check_conflicts" -}}
  {{- if and .Values.cluster.tls_certificates.create .Values.cluster.tls_certificates.cert_manager.enabled -}}
    {{- fail "Cannot specify both tls_certificates.create and tls_certificates.cert_manager.enabled" -}}
  {{- end -}}
  {{- if and (not (quote .Values.cluster.tls_certificates.secret_name | empty)) .Values.cluster.tls_certificates.cert_manager.enabled -}}
    {{- fail "Cannot specify both tls_certificates.cert_manager.enabled and tls_certificates.secret_name" -}}
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cert_manager_enabled" -}}
  {{- if .Values.cluster | dig "tls_certificates" "cert_manager" "enabled" false -}}
    {{- if .Values.cluster | dig "tls_certificates" "create" true -}}
      {{- fail "Cannot specify both tls_certificates.create and tls_certificates.cert_manager.enabled" -}}
    {{- end -}}
    {{- if .Values.cluster | dig ".tls_certificates" "secret_name" "" -}}
      {{- fail "Cannot specify both tls_certificates.secret_name and tls_certificates.cert_manager.enabled" -}}
    {{- end -}}
    true
  {{- else -}}
    false
  {{- end -}}
{{- end }}

{{- define "cluster.tls_certificates.cert_manager_certificate_name" -}}
  shield-cluster-certificate
{{- end }}

{{- define "cluster.tls_certificates.cert_manager_issuer_name" -}}
  {{- if not .Values.cluster.tls_certificates.cert_manager.issuer_name -}}
    {{- fail "cert_manager.issuer_name must be specified when cert_manager.enabled is true" -}}
  {{- end -}}
  {{- .Values.cluster.tls_certificates.cert_manager.issuer_name -}}
{{- end }}

{{- define "cluster.tls_certificates.cert_manager_ca_cert_name" -}}
  {{- if .Values.cluster.tls_certificates.cert_manager.ca_certificate_name -}}
    {{- .Values.cluster.tls_certificates.cert_manager.ca_certificate_name -}}
  {{- else -}}
    {{- include "cluster.tls_certificates.cert_manager_certificate_name" . -}}
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
