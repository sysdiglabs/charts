{{- define "cluster.annotations" -}}
  {{- $annotations := merge (dict) .Values.cluster.annotations (include "shield.annotations" . | fromYaml) -}}
  {{- with $annotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.workload_annotations" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.annotations" .) "override" (list .Values.cluster.workload_annotations .Values.workload_annotations)) -}}
{{- end -}}

{{- define "cluster.pod_annotations" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.annotations" .) "override" (list .Values.cluster.pod_annotations .Values.pod_annotations)) -}}
{{- end -}}

{{- define "cluster.rbac_annotations" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.annotations" .) "override" .Values.cluster.rbac.annotations) -}}
{{- end -}}

{{- define "cluster.service_annotations" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.annotations" .) "override" .Values.cluster.service.annotations) -}}
{{- end -}}

{{- define "cluster.priorityclass_annotations" -}}
  {{- include "shield.override_metadata" (dict "base" (include "cluster.annotations" .) "override" .Values.cluster.priority_class.annotations) -}}
{{- end -}}
