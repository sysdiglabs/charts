{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "common.fullname" -}}
  {{- printf "%s-common" (include "shield.fullname" . | trunc 48 | trimSuffix "-")}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "common.labels" -}}
  {{- $labels := merge (dict) (include "common.self_labels" . | fromYaml) (include "shield.labels" . | fromYaml) }}
  {{- with $labels -}}
    {{- . | toYaml -}}
  {{- end -}}
{{- end }}

{{- define "common.self_labels" -}}
  {{ include "shield.component_labels" (dict "name" "common") }}
{{- end }}

{{/*
Emits "true" when the cluster is OpenShift, or when the user has declared
the OpenShift API group in .Values.extra_capabilities_api_versions (useful
for off-cluster rendering, e.g. ArgoCD server-side apply).

Probes security.openshift.io/v1 — the same marker already used by the
OpenShift SCC templates and documented as the canonical example in
values.yaml. Emits empty string otherwise, so callers can use either
`{{- if (include "common.is_openshift" .) }}` or
`{{- if eq (include "common.is_openshift" .) "true" }}`.
*/}}
{{- define "common.is_openshift" -}}
{{- if or (.Capabilities.APIVersions.Has "security.openshift.io/v1") (has "security.openshift.io/v1" .Values.extra_capabilities_api_versions) -}}
true
{{- end -}}
{{- end -}}
