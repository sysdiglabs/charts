{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cluster.fullname" -}}
  {{- printf "%s-cluster" (include "shield.fullname" . | trunc 48 | trimSuffix "-")}}
{{- end }}

{{- define "cluster.service_account_name" -}}
  {{- default (include "cluster.fullname" .) .Values.cluster.rbac.service_account_name -}}
{{- end }}

{{- define "cluster.service_name" -}}
  {{- include "cluster.fullname" . }}
{{- end }}

{{- define "cluster.container_vulnerability_management_service_name" -}}
  {{- include "cluster.fullname" . }}-container-vulnerability-management
{{- end }}

{{- define "cluster.container_vulnerability_management_lease_name" -}}
  {{- default (printf "%s-container-vulnerability-management" (include "cluster.fullname" .)) (dig "cluster_scanner" "leader_election_lock_name" nil .Values.cluster.additional_settings) -}}
{{- end }}

{{- define "cluster.admission_control_service_port" -}}
  {{ .Values.features.admission_control.http_port }}
{{- end }}

{{- define "cluster.audit_service_port" -}}
  {{ .Values.features.detections.kubernetes_audit.http_port }}
{{- end }}

{{- define "cluster.admission_control_webhook_name" -}}
  {{- printf "%s-admission-control" (include "cluster.fullname" .) -}}
{{- end }}

{{- define "cluster.audit_webhook_name" -}}
  {{- printf "%s-audit" (include "cluster.fullname" .) -}}
{{- end }}

{{- define "cluster.is_single_process_mode" -}}
  {{- if or (eq .Values.cluster.run_mode "single-process") (include "common.cluster_type.is_gke_autopilot" .) -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{- define "cluster.run_command" -}}
  {{- if (include "cluster.is_single_process_mode" .) -}}
    run-all
  {{- else -}}
    run-all-namespaced
  {{- end -}}
{{- end }}

{{- define "cluster.has_priority_class" -}}
  {{- if or .Values.cluster.priority_class.create .Values.cluster.priority_class.name }}
    {{- true -}}
  {{- end -}}
{{- end }}

{{- define "cluster.priority_class_name" -}}
  {{- default (include "cluster.fullname" .) .Values.cluster.priority_class.name }}
{{- end -}}

{{- define "cluster.node_selector" -}}
{{- $nodeSelector := merge (dict) .Values.node_selector .Values.cluster.node_selector -}}
{{- with $nodeSelector -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "cluster.tolerations" -}}
{{- $tollerations := concat .Values.tolerations .Values.cluster.tolerations -}}
{{- with $tollerations -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "cluster.affinity" -}}
{{- $affinity := merge .Values.affinity .Values.cluster.affinity -}}
{{- with $affinity -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "cluster.secrets_mount" -}}
  {{- $secrets := list
    (include "common.credentials.access_key_secret_name" .)
    (include "common.credentials.secure_api_token_secret_name" .)
    (include "cluster.fullname" .)
    (dig "cluster_scanner" "runtime_status_integrator" "nats_server" "password_existing_secret" nil .Values.cluster.additional_settings)
  -}}
  {{- (uniq (compact $secrets)) | toYaml -}}
{{- end -}}

{{- define "cluster.replica_count" -}}
  {{- if (include "cluster.has_features_enabled" .) -}}
    {{- .Values.cluster.replica_count -}}
  {{- else -}}
    0
  {{- end -}}
{{- end -}}
