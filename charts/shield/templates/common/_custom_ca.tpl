{{- define "common.custom_ca.enabled" -}}
  {{- if or (include "common.custom_ca.use_existing_secret" .) (include "common.custom_ca.use_values" .) -}}
    {{- true -}}
  {{- end -}}
{{- end -}}

{{/*
Custom CA Secret Name
*/}}
{{- define "common.custom_ca.secret_name" -}}
  {{- printf "%s-ca" (include "common.fullname" .) }}
{{- end -}}


{{- define "common.custom_ca.use_existing_secret" -}}
  {{- if (and .Values.ssl.ca.existing_ca_secret_key_name .Values.ssl.ca.existing_ca_secret) -}}
    {{- true -}}
  {{- end -}}
{{- end -}}

{{- define "common.custom_ca.use_values" -}}
  {{- if and (not (include "common.custom_ca.use_existing_secret" .)) (and .Values.ssl.ca.certs .Values.ssl.ca.key_name) -}}
    {{- true -}}
  {{- end -}}
{{- end -}}

{{- define "common.custom_ca.key_name" -}}
  {{- if (include "common.custom_ca.use_existing_secret" .) -}}
    {{- .Values.ssl.ca.existing_ca_secret_key_name -}}
  {{- else if (include "common.custom_ca.use_values" .) -}}
    {{- .Values.ssl.ca.key_name -}}
  {{- end -}}
{{- end -}}

{{- define "common.custom_ca.cert" -}}
  {{- join "" (.Values.ssl.ca.certs) -}}
{{- end -}}

{{- define "common.custom_ca.volume" -}}
{{- if (include "common.custom_ca.use_values" .) -}}
- name: ca-certs
  secret:
    secretName: {{ include "common.custom_ca.secret_name" . }}
{{- else if (include "common.custom_ca.use_existing_secret" .) -}}
- name: ca-certs
  secret:
    secretName: {{ .Values.ssl.ca.existing_ca_secret }}
{{- end -}}
{{- end -}}

{{- define "common.custom_ca.volume_mount" -}}
{{- if not .CACertsPath -}}
  {{- fail "CACertsPath needs to be specified for this helper" -}}
{{- end -}}
{{- if (include "common.custom_ca.enabled" .) -}}
- name: ca-certs
  mountPath: {{ .CACertsPath }}
  readOnly: true
{{- end -}}
{{- end -}}

{{- define "common.custom_ca.envs" -}}
{{- if (include "common.custom_ca.enabled" .) -}}
- name: SSL_CERT_FILE
  value: {{ include "common.custom_ca.path" .}}
{{- end -}}
{{- end -}}

{{- define "common.custom_ca.path" -}}
  {{- if not .CACertsPath -}}
    {{- fail "CACertsPath needs to be specified for this helper" -}}
  {{- end -}}
  {{- printf "%s%s" .CACertsPath (include "common.custom_ca.key_name" .) -}}
{{- end -}}
