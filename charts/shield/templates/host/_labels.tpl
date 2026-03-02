{{/*
GKE Autopilot labels
*/}}
{{- define "host.gke_autopilot_labels" -}}
  {{- if (include "common.cluster_type.is_gke_autopilot" .) -}}
    {{- dict "autopilot.gke.io/no-connect" "true" "cloud.google.com/matching-allowlist" "sysdig-agent-v1.1.4" | toYaml -}}
  {{- end -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "host.labels" -}}
  {{- $labels := merge (dict) (include "host.gke_autopilot_labels" . | fromYaml) (include "host.self_labels" . | fromYaml) (include "shield.labels" . | fromYaml) }}
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
  {{- $workloadLabels := merge (dict) .Values.workload_labels .Values.host.workload_labels (include "host.labels" . | fromYaml) }}
  {{- with $workloadLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.pod_labels" -}}
  {{- $podLabels := merge (dict) .Values.pod_labels .Values.host.pod_labels (include "host.labels" . | fromYaml) }}
  {{- with $podLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.rbac_labels" -}}
  {{- $rbacLabels := merge (dict) .Values.host.rbac.labels (include "host.labels" . | fromYaml) }}
  {{- with $rbacLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}
