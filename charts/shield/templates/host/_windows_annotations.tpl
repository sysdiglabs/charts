{{- define "host_windows.annotations" -}}
  {{- $annotations := merge (dict) .Values.host_windows.annotations (include "shield.annotations" . | fromYaml) -}}
  {{- with $annotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) .Values.host_windows.workload_annotations .Values.workload_annotations (include "host_windows.annotations" . | fromYaml) -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) .Values.host_windows.pod_annotations .Values.pod_annotations (include "host_windows.annotations" . | fromYaml) -}}
  {{- $podAnnotations | toYaml -}}
{{- end -}}
