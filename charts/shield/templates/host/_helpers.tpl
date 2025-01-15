{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "host.fullname" -}}
    {{- printf "%s-host" (include "shield.fullname" . | trunc 57 | trimSuffix "-") }}
{{- end }}


{{- define "host.proxy_config" -}}
{{- if (include "common.proxy.enabled" . ) -}}
    {{- $proxyConfig := dict -}}
    {{- $parsedProxyConfig := urlParse (coalesce
      (include "common.proxy.https_proxy_value" .)
      (include "common.proxy.http_proxy_value" .)
    ) -}}
    {{- $_ := set $proxyConfig "ssl" (eq "https" $parsedProxyConfig.scheme) -}}
    {{- if $parsedProxyConfig.userinfo -}}
        {{- $userInfo := split ":" $parsedProxyConfig.userinfo -}}
        {{- $_ := set $proxyConfig "proxy_user" $userInfo._0 -}}
        {{- $_ := set $proxyConfig "proxy_password" $userInfo._1 -}}
    {{- end -}}
    {{- $host := split ":" $parsedProxyConfig.host -}}
    {{- $_ := set $proxyConfig "proxy_host" $host._0 -}}
    {{- $_ := set $proxyConfig "proxy_port" $host._1 -}}
    {{- if (include "common.custom_ca.enabled" .) }}
      {{- $_ = set $proxyConfig "ca_certificate" (include "common.custom_ca.path" (merge (dict) . (dict "CACertsPath" "certificates/"))) }}
    {{- end }}
    {{- $proxyConfig | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.service_account_name" -}}
{{- default (include "host.fullname" .) .Values.host.rbac.service_account_name }}
{{- end }}

{{- define "host.config_override" -}}
{{ .Values.host.additional_settings | toYaml }}
{{- end -}}

{{- define "host.has_priority_class" -}}
{{- if or .Values.host.priority_class.create .Values.host.priority_class.name }}
{{- true -}}
{{- end -}}
{{- end }}

{{- define "host.priority_class_name" -}}
{{- default (include "host.fullname" .) .Values.host.priority_class.name }}
{{- end }}

{{- define "host.node_selector" -}}
{{- $nodeSelector := merge (dict) .Values.node_selector .Values.host.node_selector -}}
{{- with $nodeSelector -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.tolerations" -}}
{{- $tolerations := concat .Values.tolerations .Values.host.tolerations -}}
{{- with $tolerations -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.affinity" -}}
{{- $affinity := merge (dict) .Values.affinity .Values.host.affinity -}}
{{- with $affinity -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.kmodule_resources" }}
{{- with .Values.host.resources.kmodule }}
{{- . | toYaml }}
{{- end }}
{{- end }}

{{- define "host.resources" }}
{{- with .Values.host.resources.shield }}
{{- . | toYaml }}
{{- end }}
{{- end }}

{{- define "host.driver.is_ebpf" }}
{{- if or (include "host.driver.is_legacy_ebpf" .) (include "host.driver.is_universal_ebpf" .) }}
true
{{- else }}
{{- end }}
{{- end }}

{{- define "host.driver.is_legacy_ebpf" }}
{{- if eq "legacy_ebpf" .Values.host.driver }}
true
{{- else }}
{{- end }}
{{- end }}

{{- define "host.driver.is_universal_ebpf" }}
{{- if eq "universal_ebpf" .Values.host.driver }}
true
{{- else }}
{{- end }}
{{- end }}

{{- define "host.shield_image" }}
{{- .Values.host.image.registry -}} / {{- .Values.host.image.repository -}} / {{- .Values.host.image.shield_name -}} : {{- .Values.host.image.tag }}
{{- end }}

{{- define "host.kmodule_image" }}
{{- .Values.host.image.registry -}} / {{- .Values.host.image.repository -}} / {{- .Values.host.image.kmodule_name -}} : {{- .Values.host.image.tag }}
{{- end }}

{{- define "host.need_host_root" }}
{{- if or .Values.features.posture.host_posture.enabled .Values.features.vulnerability_management.host_vulnerability_management.enabled }}
{{- true -}}
{{- end }}
{{- end }}

{{- define "host.env" -}}
{{- $env := concat (default (list) .Values.env) (default (list) .Values.host.env) -}}
{{- with $env -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.volumes" -}}
{{- $volumes := concat (default (list) .Values.volumes) (default (list) .Values.host.volumes) -}}
{{- with $volumes -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.volume_mounts" -}}
{{- $volumeMounts := concat (default (list) .Values.volume_mounts) (default (list) .Values.host.volume_mounts) -}}
{{- with $volumeMounts -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.capabilities" -}}
- DAC_READ_SEARCH
- KILL
- SETGID
- SETUID
- SYS_ADMIN
- SYS_CHROOT
- SYS_PTRACE
- SYS_RESOURCE
{{- end -}}

{{- define "host.security_context" -}}
{{- if .Values.host.custom_security_context }}
  {{- toYaml .Values.host.custom_security_context -}}
{{- else if .Values.host.privileged }}
privileged: true
runAsNonRoot: false
runAsUser: 0
runAsGroup: 0
readOnlyRootFilesystem: false
allowPrivilegeEscalation: true
capabilities:
  drop:
    - ALL
{{- else }}
allowPrivilegeEscalation: false
seccompProfile:
  type: Unconfined
capabilities:
  drop:
    - ALL
  add:
    {{- include "host.capabilities" . | nindent 4 }}
{{- end }}
{{- end -}}
