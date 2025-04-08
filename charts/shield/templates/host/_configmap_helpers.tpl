{{/* Helper utitlies for generating the Host Shield's various ConfigMaps */}}

{{- define "host.configmap.posture" }}
{{- dict "posture" (pick . "host_posture") | toYaml }}
{{- end }}

{{- define "host.configmap.vm" }}
{{- dict "vulnerability_management" (pick . "host_vulnerability_management" "in_use") | toYaml }}
{{- end }}

{{- define "host.configmap.responding" }}
{{- dict "respond" (pick . "rapid_response") | toYaml }}
{{- end }}

{{- define "host.configmap.detections" }}
{{- dict "detections" (pick . "ml_policies") | toYaml }}
{{- end }}

{{/* Generate the 'host_shield_config.yaml' content */}}
{{- define "host.host_shield_config" }}
{{- $config := dict }}

{{- $featuresConfig := dict -}}
{{- with .Values.features.posture }}
{{- $featuresConfig = merge $featuresConfig ((include "host.configmap.posture" .) | fromYaml) }}
{{- end }}
{{- with .Values.features.vulnerability_management }}
{{- $featuresConfig = merge $featuresConfig ((include "host.configmap.vm" .) | fromYaml) }}
{{- end }}
{{- with .Values.features.respond }}
{{- $featuresConfig = merge $featuresConfig ((include "host.configmap.responding" .) | fromYaml) }}
{{- end }}
{{- with .Values.features.detections }}
{{- $featuresConfig = merge $featuresConfig ((include "host.configmap.detections" .) | fromYaml)}}
{{- end }}
{{- $_ := set $config "features" $featuresConfig -}}

{{- $config | toYaml }}
{{- end }}

{{- define "host.features.netsec_enabled" }}
{{- if or .Values.features.investigations.network_security.enabled
          (dig "network_topology" "enabled" false .Values.host.additional_settings) }}
true
{{- end }}
{{- end }}

{{- define "host.features.monitor_enabled" }}
{{- if  or (dig (include "host.monitor_key" .) "app_checks" "enabled" false .Values.features)
           (dig (include "host.monitor_key" .) "java_management_extensions" "enabled" false .Values.features)
           (dig (include "host.monitor_key" .) "prometheus" "enabled" false .Values.features)
           (dig (include "host.monitor_key" .) "statsd" "enabled" false .Values.features)
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
  "app_checks_enabled" ((dig (include "host.monitor_key" .) "app_checks" "enabled" false .))
  "audit_tap"
    (dict "enabled" .investigations.audit_tap.enabled)
  "drift_control"
    (dict "enabled" .detections.drift_control.enabled)
  "jmx"
    (dict "enabled" (dig (include "host.monitor_key" .) "java_management_extensions" "enabled" false .))
  "live_logs"
    (dict "enabled" .investigations.live_logs.enabled)
  "local_forwarder"
    (dict "enabled" .investigations.event_forwarder.enabled)
  "malware_control"
    (dict "enabled" .detections.malware_control.enabled)
  "network_topology"
    (dict "enabled" .investigations.network_security.enabled)
  "prometheus"
    (dict "enabled" (dig (include "host.monitor_key" .) "prometheus" "enabled" false .))
  "secure_audit_streams"
    (dict "enabled" .investigations.activity_audit.enabled)
  "statsd"
    (dict "enabled" (dig (include "host.monitor_key" .) "statsd" "enabled" false .))
  "sysdig_capture_enabled" .investigations.captures.enabled }}
{{- $config | toYaml }}
{{- end }}
{{- end }}

{{/* Generate the 'dragent.yaml' content */}}
{{- define "host.configmap" }}
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
{{- $config := merge $config (dict "http_proxy" (include "host.dragent_proxy_config" . | fromYaml)) }}
{{- end }}
{{- if (include "host.rapid_response_enabled" .) }}
{{- $config = merge $config (dict "rapid_response" (dict "enabled" true)) }}
{{- end }}
{{- $config = merge $config (include "host.parse_features" . | fromYaml) }}
{{/* Host Scanner requires setting the host fs mount path variable, but that
     parameter has not been mapped into the new schema yet. As a result,
     it still needs to be set in the dragent.yaml file. */}}
{{- if .Values.features.vulnerability_management.host_vulnerability_management.enabled }}
{{/* Currently this pins the path to /host, but that is only because the final location of the
     parameters has not been determined. */}}
 {{- if and .Values.features.vulnerability_management.host_vulnerability_management.enabled
            (not (dig "host_scanner" "host_fs_mount_path" nil .Values.host.additional_settings)) }}
    {{- $config = merge $config (dict "host_scanner" (dict "host_fs_mount_path" "/host")) }}
  {{- end }}
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
