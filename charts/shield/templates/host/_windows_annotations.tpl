{{- define "host.windows.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) .Values.workload_annotations .Values.host_windows.workload_annotations -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.windows.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) .Values.pod_annotations .Values.host_windows.pod_annotations -}}
  {{- if (include "common.cluster_type.is_gke_autopilot" . ) -}}
    {{- $_ := set $podAnnotations "autopilot.gke.io/no-connect" "true" -}}
  {{- end -}}
  {{- $podAnnotations | toYaml -}}
{{- end -}}
