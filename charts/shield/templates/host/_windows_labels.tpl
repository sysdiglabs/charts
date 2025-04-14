{{/*
Common labels
*/}}
{{- define "host.windows.labels" -}}
  {{- $labels := merge (dict) (include "host.windows.self_labels" . | fromYaml) (include "shield.labels" . | fromYaml) }}
  {{- with $labels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end }}

{{- define "host.windows.self_labels" -}}
  {{- include "shield.component_labels" (dict "name" "host" "version" .Values.host_windows.image.tag) }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "host.windows.selector_labels" -}}
  {{- $selectorLabels := merge (dict) (include "host.windows.self_labels" . | fromYaml) (include "shield.selector_labels" . | fromYaml) }}
  {{- $_ := unset $selectorLabels (include "shield.component_version_label" . ) -}}
  {{- with $selectorLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end }}

{{- define "host.windows.workload_labels" -}}
  {{- $workloadLabels := merge (dict) .Values.workload_labels .Values.host_windows.workload_labels (include "host.windows.labels" . | fromYaml) }}
  {{- with $workloadLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.pod_labels" -}}
  {{- $podLabels := merge (dict) .Values.pod_labels .Values.host_windows.pod_labels (include "host.windows.labels" . | fromYaml) }}
  {{- with $podLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.rbac_labels" -}}
  {{- $rbacLabels := merge (dict) .Values.host.rbac.labels (include "host.windows.labels" . | fromYaml) }}
  {{- with $rbacLabels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}
