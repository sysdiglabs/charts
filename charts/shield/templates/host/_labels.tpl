{{/*
GKE Autopilot labels
*/}}
{{- define "host.gke_autopilot_labels" -}}
{{- $gkeAllowlistVersion := coalesce .Values.gke_autopilot_allowlist .Values.gke_autopilot.allowlist_version -}}
{{- if (include "common.cluster_type.is_gke_autopilot" .) -}}
"autopilot.gke.io/no-connect": "true"
"cloud.google.com/matching-allowlist": "{{ $gkeAllowlistVersion }}"
{{- end -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "host.labels" -}}
  {{- $labels := merge (dict) .Values.host.labels (include "host.gke_autopilot_labels" . | fromYaml) (include "host.self_labels" . | fromYaml) (include "shield.labels" . | fromYaml) }}
  {{- with $labels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end }}

{{- define "host.self_labels" -}}
  {{- include "shield.component_labels" (dict "name" "host" "version" .Values.host.image.tag) }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "host.selector_labels" -}}
  {{- $selectorLabels := merge (dict) (include "host.self_labels" . | fromYaml) (include "shield.selector_labels" . | fromYaml) }}
  {{- $_ := unset $selectorLabels (include "shield.component_version_label" . ) -}}
  {{- with $selectorLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end }}

{{- define "host.workload_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "host.labels" .) "override" (list .Values.host.workload_labels .Values.workload_labels)) -}}
{{- end -}}

{{- define "host.pod_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "host.labels" .) "override" (list .Values.host.pod_labels .Values.pod_labels)) -}}
{{- end -}}

{{- define "host.rbac_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "host.labels" .) "override" .Values.host.rbac.labels) -}}
{{- end -}}

{{- define "host.priorityclass_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "host.labels" .) "override" .Values.host.priority_class.labels) -}}
{{- end -}}
