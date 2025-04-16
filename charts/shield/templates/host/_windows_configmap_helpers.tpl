{{/* Helper utitlies for generating the Windows Host Shield's various ConfigMaps */}}

{{- define "host.windows.configmap.posture" }}
{{- dict "posture" (pick . "host_posture") | toYaml }}
{{- end }}

{{- define "host.windows.configmap.vm" }}
{{- dict "vulnerability_management" (pick . "host_vulnerability_management" "in_use") | toYaml }}
{{- end }}

{{- define "host.windows.agent_runtime.log_level" }}
{{- $config := ((include "host.windows.shield_config_override" .) | fromYaml) -}}
{{- if and $config $config.log_level -}}
  {{- $log_level := $config.log_level -}}
  {{- if eq $log_level "debug" -}}
    {{- printf "debug" -}}
  {{- else if eq $log_level "info" -}}
    {{- printf "info" -}}
  {{- else if eq $log_level "warn" -}}
    {{- printf "warning" -}}
  {{- else if eq $log_level "err" -}}
    {{- printf "error" -}}
  {{- else if eq $log_level "trace" -}}
    {{- printf "debug" -}}
  {{- end -}}
{{- end -}}
{{- end }}

{{/* Generate the 'host-shield.yaml' content */}}
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

{{- $clusterConfig := dict "name" .Values.cluster_config.name -}}
{{- if .Values.cluster_config.tags -}}
  {{- $_ := set $clusterConfig "tags" .Values.cluster_config.tags -}}
{{- end -}}
{{- $_ := set $config "cluster_config" $clusterConfig -}}

{{- $config := merge $config (dict "proxy" (include "host.proxy_config" . | fromYaml)) }}

{{- $override := (include "host.windows.shield_config_override" .) | fromYaml }}
{{- $finalConfig := mergeOverwrite $config $override }}
{{- $finalConfig | toYaml }}
{{- end }}

{{/* Generate the 'dragent.yaml' content */}}
{{- define "host.windows.configmap" }}
{{- $config := dict
  "k8s_cluster_name" .Values.cluster_config.name
  "collector" (include "common.collector_endpoint" .)
}}
{{- if .Values.cluster_config.tags -}}
  {{- $tagList := list }}
  {{- range $k, $v := .Values.cluster_config.tags }}
    {{- $tagList = append $tagList (printf "%s:%s" $k $v) }}
  {{- end }}
  {{- $_ := set $config "tags" (join "," $tagList) -}}
{{- end -}}

{{- if (include "common.proxy.enabled" . ) }}
  {{- $http_proxy := (include "host.dragent_proxy_config" . | fromYaml) -}}
  {{- $config := merge $config (dict "http_proxy" $http_proxy) -}}
{{- end }}

{{- if (include "host.windows.agent_runtime.log_level" . ) -}}
  {{- $console_priority := dict "console_priority" (include "host.windows.agent_runtime.log_level" .) -}}
  {{- $_ := set $config "log" $console_priority -}}
{{- end }}

{{- $override := (include "host.windows.runtime_config_override" .) | fromYaml }}
{{- $finalConfig := mergeOverwrite $config $override }}
{{- $finalConfig | toYaml }}
{{- end }}
