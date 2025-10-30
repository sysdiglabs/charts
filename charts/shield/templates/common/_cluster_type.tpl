{{/*
Proxy Secret Name
*/}}
{{- define "common.cluster_type.is_gke_autopilot" -}}
  {{- if eq "gke-autopilot" .Values.cluster_config.cluster_type -}}
    {{- true -}}
  {{- end -}}
{{- end -}}
