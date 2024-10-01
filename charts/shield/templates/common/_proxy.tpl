{{/*
Proxy Secret Name
*/}}
{{- define "common.proxy.enabled" -}}
  {{- if or .Values.proxy.http_proxy .Values.proxy.http_proxy_existing_secret .Values.proxy.https_proxy .Values.proxy.https_proxy_existing_secret }}
    {{- true }}
  {{- end }}
{{- end -}}

{{- define "common.proxy.create_proxy_secret" -}}
  {{- if or
    (and .Values.proxy.http_proxy (not .Values.proxy.http_proxy_existing_secret ))
    (and .Values.proxy.https_proxy (not .Values.proxy.https_proxy_existing_secret ))
    (and
      (include "common.proxy.enabled" .)
      (not .Values.proxy.no_proxy_existing_secret)
    )
  }}
    {{- true }}
  {{- end }}
{{- end -}}

{{/*
Proxy Secret Name
*/}}
{{- define "common.proxy.secret_name" -}}
  {{- printf "%s-proxy" (include "common.fullname" .) }}
{{- end -}}

{{/*
Proxy Envs
*/}}
{{- define "common.proxy.envs" -}}
{{- if (include "common.proxy.enabled" .) -}}
- name: HTTP_PROXY
  valueFrom:
    secretKeyRef:
      name: {{ default (include "common.proxy.secret_name" .) .Values.proxy.http_proxy_existing_secret }}
      key: http_proxy
      optional: true
- name: HTTPS_PROXY
  valueFrom:
    secretKeyRef:
      name: {{ default (include "common.proxy.secret_name" .) .Values.proxy.https_proxy_existing_secret }}
      key: https_proxy
      optional: true
- name: NO_PROXY
  valueFrom:
    secretKeyRef:
      name: {{ default (include "common.proxy.secret_name" .) .Values.proxy.no_proxy_existing_secret }}
      key: no_proxy
      optional: true
{{- end -}}
{{- end -}}

{{- define "common.proxy.no_proxy" -}}
  {{- $noProxyList := list -}}
  {{- if .Values.proxy.no_proxy -}}
    {{- $noProxyList = splitList "," .Values.proxy.no_proxy -}}
  {{- end -}}
  {{- $noProxyList = append $noProxyList "127.0.0.1" -}}
  {{- $noProxyList = append $noProxyList "localhost" -}}
  {{- $noProxyList = append $noProxyList "169.254.0.0/16" -}}
  {{- $noProxyList = append $noProxyList (printf ".%s" .Values.cluster_config.cluster_domain) -}}
  {{- print (join "," (uniq $noProxyList)) }}
{{- end -}}

{{- define "common.proxy.http_proxy_value" -}}
  {{- if (include "common.proxy.enabled" .) -}}
    {{- if .Values.proxy.http_proxy_existing_secret -}}
      {{- $secret := lookup "v1" "Secret" .Release.Namespace .Values.proxy.http_proxy_existing_secret -}}
      {{- if $secret -}}
          {{- printf "%s" (index $secret.data "http_proxy" | b64dec) -}}
      {{- else -}}
          {{- fail (printf "Secret '%s' not found" .Values.proxy.http_proxy_existing_secret) -}}
      {{- end -}}
    {{- else if .Values.proxy.http_proxy -}}
      {{- .Values.proxy.http_proxy -}}
    {{- else -}}
      {{- printf "" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "common.proxy.https_proxy_value" -}}
  {{- if (include "common.proxy.enabled" .) -}}
    {{- if .Values.proxy.https_proxy_existing_secret -}}
      {{- $secret := lookup "v1" "Secret" .Release.Namespace .Values.proxy.https_proxy_existing_secret -}}
      {{- if $secret -}}
          {{- printf "%s" (index $secret.data "https_proxy" | b64dec) -}}
      {{- else -}}
          {{- fail (printf "Secret '%s' not found" .Values.proxy.https_proxy_existing_secret) -}}
      {{- end -}}
    {{- else if .Values.proxy.https_proxy -}}
      {{- .Values.proxy.https_proxy -}}
    {{- else -}}
      {{- printf "" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
