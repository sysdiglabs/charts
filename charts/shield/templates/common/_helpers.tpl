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
RBAC sub-toggle resolver. Returns "true" when the per-resource toggle should
be on. Inherits .rbac.create unless the sub-toggle is explicitly set to a
boolean (true/false).

Usage:
  {{- if (include "common.rbac.sub_toggle_enabled" (dict "rbac" .Values.cluster.rbac "key" "service_account")) }}
*/}}
{{- define "common.rbac.sub_toggle_enabled" -}}
{{- $val := dig .key "create" nil .rbac -}}
{{- if kindIs "bool" $val -}}
  {{- if $val -}}true{{- end -}}
{{- else if .rbac.create -}}
true
{{- end -}}
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
