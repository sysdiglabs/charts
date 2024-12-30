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

{{/* Check if semver. The regex is from the code of the library Helm uses for semver. */}}
{{- define "common.is_semver" -}}
    {{- if regexMatch "^v?([0-9]+)(\\.[0-9]+)?(\\.[0-9]+)?(-([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?(\\+([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?$" . }}
        true
    {{- end -}}
{{- end -}}
