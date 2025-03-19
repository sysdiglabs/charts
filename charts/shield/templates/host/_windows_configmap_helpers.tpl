{{/* Helper utitlies for generating the Windows Host Shield's various ConfigMaps */}}

{{- define "host.windows.configmap.posture" }}
{{- dict "posture" (pick . "host_posture") | toYaml }}
{{- end }}

{{- define "host.windows.configmap.vm" }}
{{- dict "vulnerability_management" (pick . "host_vulnerability_management" "in_use") | toYaml }}
{{- end }}

{{/* Generate the 'host_shield_config.yaml' content */}}
{{- define "host.windows.host_shield_config" }}
{{- $config := dict }}
{{- $featuresConfig := dict -}}
{{- $sysdigEndpointWhitelist := list
    "region"
    "api_url"
    "collector"
-}}
{{- $sysdigEndpointConfig := dict -}}
{{- range $k, $v := .Values.sysdig_endpoint -}}
    {{- if has $k $sysdigEndpointWhitelist -}}
        {{- $_ := set $sysdigEndpointConfig $k $v -}}
    {{- end -}}
{{- end -}}
{{- $_ := set $config "sysdig_endpoint" $sysdigEndpointConfig -}}
{{- with .Values.features.posture }}
{{- $featuresConfig = merge $featuresConfig ((include "host.windows.configmap.posture" .) | fromYaml) }}
{{- end }}
{{- with .Values.features.vulnerability_management }}
{{- $featuresConfig = merge $featuresConfig ((include "host.windows.configmap.vm" .) | fromYaml) }}
{{- end }}
{{- $_ := set $config "features" $featuresConfig -}}
{{- $override := (include "host.windows.config_override" .) | fromYaml }}
{{- $finalConfig := mergeOverwrite $config $override }}
{{- $finalConfig | toYaml }}
{{- end }}

{{- define "host.windows.configmap" }}
{{- $config := dict }}
{{- if (include "common.proxy.enabled" . ) }}
{{- $config := merge $config (dict "http_proxy" (include "host.proxy_config" . | fromYaml)) }}
{{- end }}
{{- $override := (include "host.windows.runtime_config_override" .) | fromYaml }}
{{- $finalConfig := mergeOverwrite $config $override }}
{{- $finalConfig | toYaml }}
{{- end }}
