{{- define "common.semver.is_valid" -}}
  {{- if regexMatch "^v?([0-9]+)(\\.[0-9]+)?(\\.[0-9]+)?(-([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?(\\+([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?$" . -}}
    {{- true -}}
  {{- end -}}
{{- end -}}
