{{- define "host.windows.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) (include "shield.annotations" . | fromYaml) .Values.workload_annotations .Values.host_windows.workload_annotations -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) (include "shield.annotations" . | fromYaml) .Values.pod_annotations .Values.host_windows.pod_annotations -}}
  {{- $podAnnotations | toYaml -}}
{{- end -}}
