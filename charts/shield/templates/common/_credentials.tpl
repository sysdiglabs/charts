
{{/*
Access Key Secret Name
*/}}
{{- define "common.credentials.access_key_secret_name" -}}
  {{- if .Values.sysdig_endpoint.access_key_existing_secret }}
    {{- .Values.sysdig_endpoint.access_key_existing_secret }}
  {{- else }}
    {{- printf "%s-access-key" (include "common.fullname" .) }}
  {{- end}}
{{- end -}}

{{/*
Secure Api Token Secret Name
*/}}
{{- define "common.credentials.secure_api_token_secret_name" -}}
  {{- if .Values.sysdig_endpoint.secure_api_token_existing_secret }}
    {{- .Values.sysdig_endpoint.secure_api_token_existing_secret }}
  {{- else if .Values.sysdig_endpoint.secure_api_token }}
    {{- printf "%s-secure-api-token" (include "common.fullname" .) }}
  {{- end}}
{{- end -}}

{{/*
  Check if the Secure Api Token is provided
*/}}
{{- define "common.credentials.has_secure_api_token" -}}
  {{- if or .Values.sysdig_endpoint.secure_api_token .Values.sysdig_endpoint.secure_api_token_existing_secret -}}
    {{- true -}}
  {{- end -}}
{{- end -}}
