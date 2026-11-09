{{/*
Common labels
*/}}
{{- define "cluster.labels" -}}
  {{- $labels := merge (dict) (include "cluster.self_labels" . | fromYaml) .Values.cluster.labels (include "shield.labels" . | fromYaml) }}
  {{- with $labels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end }}

{{- define "cluster.self_labels" -}}
  {{- include "shield.component_labels" (dict "name" "cluster" "version" .Values.cluster.image.tag) }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cluster.selector_labels" -}}
  {{- $selectorLabels := merge (dict) (include "cluster.self_labels" . | fromYaml) (include "shield.selector_labels" . | fromYaml) }}
  {{- $_ := unset $selectorLabels (include "shield.component_version_label" . ) -}}
  {{- with $selectorLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end }}

{{- define "cluster.workload_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.labels" .) "override" (list .Values.cluster.workload_labels .Values.workload_labels)) -}}
{{- end -}}

{{- define "cluster.pod_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.labels" .) "override" (list .Values.cluster.pod_labels .Values.pod_labels)) -}}
{{- end -}}

{{- define "cluster.rbac_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.labels" .) "override" .Values.cluster.rbac.labels) -}}
{{- end -}}

{{- define "cluster.priorityclass_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.labels" .) "override" .Values.cluster.priority_class.labels) -}}
{{- end -}}

{{- define "cluster.service_labels" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.labels" .) "override" .Values.cluster.service.labels) -}}
{{- end -}}
