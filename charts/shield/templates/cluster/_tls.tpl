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
