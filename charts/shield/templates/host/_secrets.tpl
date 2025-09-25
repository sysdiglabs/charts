{{- define "host.rapid_response_password_existing_secret" }}
{{- if and (hasKey .Values.features.respond.rapid_response "password_existing_secret") (not (empty .Values.features.respond.rapid_response.password_existing_secret)) }}
{{- .Values.features.respond.rapid_response.password_existing_secret }}
{{- end }}
{{- end }}

{{- define "host.rapid_response_password_secret" }}
{{- if (include "host.rapid_response_password_existing_secret" .) }}
{{- (include "host.rapid_response_password_existing_secret" .) }}
{{- else }}
{{- printf "%s-host-rapid-response" (include "shield.fullname" . | trunc 43 | trimSuffix "-") }}
{{- end }}
{{- end }}

{{- define "host.rapid_response_password_secret_key" }}
{{- if and (hasKey .Values.features.respond.rapid_response "password_existing_secret_key") (not (empty .Values.features.respond.rapid_response.password_existing_secret_key)) }}
{{- .Values.features.respond.rapid_response.password_existing_secret_key }}
{{- else }}
{{- "password" }}
{{- end }}
{{- end }}
