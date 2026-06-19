{{- define "host_windows.annotations" -}}
  {{- $annotations := merge (dict) (include "shield.annotations" . | fromYaml) .Values.host_windows.annotations -}}
  {{- with $annotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) (include "host_windows.annotations" . | fromYaml) .Values.workload_annotations .Values.host_windows.workload_annotations -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) (include "host_windows.annotations" . | fromYaml) .Values.pod_annotations .Values.host_windows.pod_annotations -}}
  {{- $podAnnotations | toYaml -}}
{{- end -}}
