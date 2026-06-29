{{- define "cluster.annotations" -}}
  {{- $annotations := merge (dict) .Values.cluster.annotations (include "shield.annotations" . | fromYaml) -}}
  {{- with $annotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) .Values.cluster.workload_annotations .Values.workload_annotations (include "cluster.annotations" . | fromYaml) -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) .Values.cluster.pod_annotations .Values.pod_annotations (include "cluster.annotations" . | fromYaml) -}}
  {{- with $podAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.rbac_annotations" -}}
  {{- $rbacAnnotations := merge (dict) .Values.cluster.rbac.annotations (include "cluster.annotations" . | fromYaml) -}}
  {{- with $rbacAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}
