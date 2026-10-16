{{- define "host_windows.annotations" -}}
  {{- $annotations := merge (dict) .Values.host_windows.annotations (include "shield.annotations" . | fromYaml) -}}
  {{- with $annotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.workload_annotations" -}}
  {{- include "shield.override_metadata" (dict "base" (include "host_windows.annotations" .) "override" (list .Values.host_windows.workload_annotations .Values.workload_annotations)) -}}
{{- end -}}

{{- define "host.windows.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) .Values.host_windows.pod_annotations .Values.pod_annotations (include "host_windows.annotations" . | fromYaml) -}}
  {{- $podAnnotations | toYaml -}}
{{- end -}}
