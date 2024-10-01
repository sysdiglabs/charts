{{- define "host.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) .Values.workload_annotations .Values.host.workload_annotations -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) .Values.pod_annotations .Values.host.pod_annotations -}}
  {{- if (include "common.cluster_type.is_gke_autopilot" . ) -}}
    {{- $_ := set $podAnnotations "autopilot.gke.io/no-connect" "true" -}}
  {{- end -}}
  {{- if not .Values.host.privileged -}}
    {{- $_ := set $podAnnotations "container.apparmor.security.beta.kubernetes.io/sysdig" "unconfined" -}}
  {{- end -}}
  {{- $podAnnotations | toYaml -}}
{{- end -}}
