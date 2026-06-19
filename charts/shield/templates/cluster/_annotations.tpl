{{- define "cluster.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) (include "shield.annotations" . | fromYaml) .Values.workload_annotations .Values.cluster.workload_annotations -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) (include "shield.annotations" . | fromYaml) .Values.pod_annotations .Values.cluster.pod_annotations -}}
  {{- with $podAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.rbac_annotations" -}}
  {{- $rbacAnnotations := merge (dict) (include "shield.annotations" . | fromYaml) .Values.cluster.rbac.annotations -}}
  {{- with $rbacAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}
