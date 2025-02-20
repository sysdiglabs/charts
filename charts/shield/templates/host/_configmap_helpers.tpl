{{/* Helper utitlies for generating the Host Shield's various ConfigMaps */}}

{{- define "host.configmap.posture" }}
{{- with .posture }}
  {{- dict "posture" (pick . "host_posture") | toYaml }}
{{- end }}
{{- end }}

{{- define "host.configmap.vm" }}
{{- with .vulnerability_management }}
  {{- dict "vulnerability_management" (pick . "host_vulnerability_management" "in_use") | toYaml }}
{{- end }}
{{- end }}

{{- define "host.configmap.respond" }}
{{- with .respond }}
  {{- $config := dict "respond" (pick . "rapid_response") }}
  {{- $_ := unset $config.respond.rapid_response "password"}}
  {{- $config | toYaml }}
{{- end }}
{{- end }}

{{- define "host.configmap.detections" }}
{{- with .detections }}
  {{- dict "detections" (pick . "ml_policies") | toYaml }}
{{- end }}
{{- end }}

{{- define "host.configmap.monitor" }}
{{- with .monitor }}
  {{- $config := (pick . "app_checks" "java_management_extensions" "statsd") }}
  {{- $config = merge $config (dict "prometheus" (pick .prometheus "enabled")) }}
  {{- dict "monitor" $config | toYaml }}
{{- end }}
{{- end }}

{{- define "host.configmap.investigations" }}
{{- with .investigations }}
  {{- $config := (pick . "activity_audit" "live_logs" "network_security") }}
  {{- $config = merge $config (dict "event_forwarder" (pick .event_forwarder "enabled")) }}
  {{- dict "investigations" $config | toYaml }}
{{- end }}
{{- end }}

{{/* Generate the 'host-shield.yaml' content */}}
{{- define "host.host_shield_yaml" }}
{{- $config := dict }}
{{- with .Values.features }}
  {{- $config = merge $config ((include "host.configmap.posture" .) | fromYaml) }}
  {{- $config = merge $config ((include "host.configmap.vm" .) | fromYaml) }}
  {{- $config = merge $config ((include "host.configmap.respond" .) | fromYaml) }}
  {{- $config = merge $config ((include "host.configmap.detections" .) | fromYaml) }}
  {{- $config = merge $config ((include "host.configmap.monitor" .) | fromYaml) }}
  {{- $config = merge $config ((include "host.configmap.investigations" .) | fromYaml) }}
{{- end }}
{{- dict "features" $config | toYaml }}
{{- end }}

{{- define "host.features.netsec_enabled" }}
{{- if or .Values.features.investigations.network_security.enabled
          (dig "network_topology" "enabled" false .Values.host.additional_settings) }}
true
{{- end }}
{{- end }}

{{- define "host.features.monitor_enabled" }}
{{- if  or .Values.features.monitor.app_checks.enabled
           .Values.features.monitor.java_management_extensions.enabled
           .Values.features.monitor.prometheus.enabled
           .Values.features.monitor.statsd.enabled
           (dig "app_checks_enabled" false .Values.host.additional_settings)
           (dig "jmx" "enabled" false .Values.host.additional_settings)
           (dig "prometheus" "enabled" false .Values.host.additional_settings)
           (dig "statsd" "enabled" false .Values.host.additional_settings) }}
true
{{- end }}
{{- end }}

{{/* Calculate the agent mode based on enabled features */}}
{{- define "host.configmap.agent_mode" }}
  {{- $mode := "secure_light" }}
{{- if (include "host.features.netsec_enabled" .) }}
  {{- $mode = "secure" }}
{{- end }}
{{- if (include "host.features.monitor_enabled" .) }}
  {{- $mode = "monitor" }}
{{- end }}
{{- dict "feature" (dict "mode" $mode) | toYaml -}}
{{- end }}

{{- define "host.parse_features" }}
{{/* TODO: Kubernetes metadata */}}
{{- with .Values.features }}
{{- $config := dict
  "audit_tap"
    (dict "enabled" .investigations.audit_tap.enabled)
  "malware_control"
    (dict "enabled" .detections.malware_control.enabled)
  "sysdig_capture_enabled" .investigations.captures.enabled }}
{{- $config | toYaml }}
{{- end }}
{{- end }}

{{- define "host.dragent_yaml" }}
{{- $config := dict
  "k8s_cluster_name" .Values.cluster_config.name
  "collector" (include "common.collector_endpoint" .)
}}
{{- if .Values.features.kubernetes_metadata.enabled }}
  {{- $_ := set $config "k8s_delegated_nodes" (dig "k8s_delegated_nodes" 0 .Values.host.additional_settings) -}}
{{- else if hasKey .Values.host.additional_settings "k8s_delegated_nodes" }}
  {{- $_ := set $config "k8s_delegated_nodes" (get $config "k8s_delegated_nodes") }}
{{- end }}
{{- if .Values.sysdig_endpoint.collector.port }}
  {{- $config = merge $config (dict "collector_port" .Values.sysdig_endpoint.collector.port) }}
{{- end }}
  {{- $config = merge $config (dict "sysdig_api_endpoint" (include "common.secure_api_endpoint" .)) }}
{{- if (include "common.proxy.enabled" . ) }}
  {{- $config := merge $config (dict "http_proxy" (include "host.proxy_config" . | fromYaml)) }}
{{- end }}
{{- $config = merge $config (include "host.parse_features" . | fromYaml) }}
{{- if and .Values.features.vulnerability_management.host_vulnerability_management.enabled
        (not (dig "host_scanner" "host_fs_mount_path" nil .Values.host.additional_settings)) }}
{{- $config = merge $config (dict "host_scanner" (dict "host_fs_mount_path" "/host")) }}
{{- end }}
{{- if or .Values.features.posture.host_posture.enabled (dig "kspm_analyzer" "enabled" false .Values.host.additional_settings) }}
  {{- $config = merge $config (dict "kspm_analyzer" (dict "agent_app_name" (include "shield.name" .))) }}
{{- end }}
{{- if .Values.cluster_config.tags -}}
  {{- $tagList := list }}
  {{- range $k, $v := .Values.cluster_config.tags }}
    {{- $tagList = append $tagList (printf "%s:%s" $k $v) }}
  {{- end }}
  {{- $_ := set $config "tags" (join "," $tagList) -}}
{{- end -}}
{{- if .Values.features.investigations.event_forwarder.enabled }}
  {{- with .Values.features.investigations.event_forwarder }}
    {{- $config = merge $config (dict "local_forwarder" (dict "enabled" .enabled "transmit_message_types" .transmit_message_types)) }}
  {{- end }}
{{- end }}
{{- $config = merge $config (include "host.configmap.agent_mode" . | fromYaml) }}
{{- if .Values.host.additional_settings }}
  {{- $config = mergeOverwrite $config (include "host.config_override" . | fromYaml) }}
{{- end }}
{{- $config | toYaml }}
{{- end }}
