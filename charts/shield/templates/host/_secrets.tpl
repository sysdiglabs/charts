---
{{- define "host.rapid_response_secret" }}
{{- printf "%s-host-rapid-response" (include "shield.fullname" . | trunc 43 | trimSuffix "-") }}
{{- end }}

{{- define "host.rapid_response_password" }}
{{- if .Values.features.responding.rapid_response.password }}
{{- .Values.features.responding.rapid_response.password }}
{{- else if (dig "rapid_response" "password" false .Values.host.additional_settings) }}
{{- dig "rapid_response" "password" "wubnub" .Values.host.additional_settings }}
{{- end }}
{{- end }}
