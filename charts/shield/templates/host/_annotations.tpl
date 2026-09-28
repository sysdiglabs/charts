{{- define "host.annotations" -}}
  {{- $annotations := merge (dict) .Values.host.annotations (include "shield.annotations" . | fromYaml) -}}
  {{- with $annotations -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end -}}

{{- define "host.workload_annotations" -}}
  {{- include "shield.override_metadata" (dict "base" (include "host.annotations" .) "override" (list .Values.host.workload_annotations .Values.workload_annotations)) -}}
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
  {{- include "shield.override_metadata" (dict "base" (include "host.annotations" .) "override" .Values.host.rbac.annotations) -}}
{{- end -}}

{{- define "host.priorityclass_annotations" -}}
  {{- include "shield.override_metadata" (dict "base" (include "host.annotations" .) "override" .Values.host.priority_class.annotations) -}}
{{- end -}}
