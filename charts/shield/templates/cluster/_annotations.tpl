{{- define "cluster.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) .Values.workload_annotations .Values.cluster.workload_annotations -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "cluster.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) .Values.pod_annotations .Values.cluster.pod_annotations -}}
  {{- with $podAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}
