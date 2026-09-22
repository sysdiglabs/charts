{{- define "host.annotations" -}}
  {{- $annotations := merge (dict) .Values.host.annotations (include "shield.annotations" . | fromYaml) -}}
  {{- with $annotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.workload_annotations" -}}
  {{- $workloadAnnotations := merge (dict) .Values.host.workload_annotations .Values.workload_annotations (include "host.annotations" . | fromYaml) -}}
  {{- with $workloadAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.pod_annotations" -}}
  {{- $podAnnotations := merge (dict) .Values.host.pod_annotations .Values.pod_annotations (include "host.annotations" . | fromYaml) -}}
  {{- if (include "common.cluster_type.is_gke_autopilot" . ) -}}
    {{- $_ := set $podAnnotations "autopilot.gke.io/no-connect" "true" -}}
  {{- end -}}
  {{- if not .Values.host.privileged -}}
    {{- $_ := set $podAnnotations "container.apparmor.security.beta.kubernetes.io/sysdig-host-shield" "unconfined" -}}
  {{- end -}}
  {{- $podAnnotations | toYaml -}}
{{- end -}}

{{- define "host.rbac_annotations" -}}
  {{- $rbacAnnotations := merge (dict) .Values.host.rbac.annotations (include "host.annotations" . | fromYaml) -}}
  {{- with $rbacAnnotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}
