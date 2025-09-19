{{- define "host.rapid_response_existing_secret" }}
{{- if and (hasKey .Values.features.respond.rapid_response "existing_secret") (not (empty .Values.features.respond.rapid_response.existing_secret)) }}
{{- .Values.features.respond.rapid_response.existing_secret }}
{{- end }}
{{- end }}

{{- define "host.rapid_response_secret" }}
{{- if (include "host.rapid_response_existing_secret" .) }}
{{- (include "host.rapid_response_existing_secret" .) }}
{{- else }}
{{- printf "%s-host-rapid-response" (include "shield.fullname" . | trunc 43 | trimSuffix "-") }}
{{- end }}
{{- end }}

{{- define "host.rapid_response_secret_password_key" }}
{{- if and (hasKey .Values.features.respond.rapid_response "existing_secret_password_key") (not (empty .Values.features.respond.rapid_response.existing_secret_password_key)) }}
{{- .Values.features.respond.rapid_response.existing_secret_password_key }}
{{- else }}
{{- "password" }}
{{- end }}
{{- end }}
