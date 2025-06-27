{{- define "host.windows.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) .Values.workload_annotations .Values.host_windows.workload_annotations -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) .Values.pod_annotations .Values.host_windows.pod_annotations -}}
  {{- with $podAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}
