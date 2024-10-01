{{- define "host.rapid_response_secret" }}
{{- printf "%s-host-rapid-response" (include "shield.fullname" . | trunc 43 | trimSuffix "-") }}
{{- end }}
