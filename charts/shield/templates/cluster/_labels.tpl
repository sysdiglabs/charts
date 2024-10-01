{{/*
Common labels
*/}}
{{- define "cluster.labels" -}}
  {{- $labels := merge (dict) (include "cluster.self_labels" . | fromYaml) (include "shield.labels" . | fromYaml) }}
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
  {{- $workloadLabels := merge (dict) (dict) .Values.workload_labels .Values.cluster.workload_labels (include "cluster.labels" . | fromYaml) }}
  {{- with $workloadLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.pod_labels" -}}
  {{- $podLabels := merge (dict) .Values.pod_labels .Values.cluster.pod_labels (include "cluster.labels" . | fromYaml) }}
  {{- with $podLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.rbac_labels" -}}
  {{- $rbacLabels := merge (dict) .Values.cluster.rbac.labels (include "cluster.labels" . | fromYaml) }}
  {{- with $rbacLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}
