{{- /* host-shield image features. Emit only keys set in values. */ -}}
{{- define "host.host_shield.linux_features" }}
{{- $features := .Values.features }}
{{- $out := dict }}
{{- with $features.posture }}
  {{- with .host_posture }}
    {{- $_ := set $out "posture" (dict "host_posture" (pick . "enabled")) }}
  {{- end }}
{{- end }}
{{- with $features.vulnerability_management }}
  {{- $vm := dict }}
  {{- with .host_vulnerability_management }}
    {{- $_ := set $vm "host_vulnerability_management" (pick . "enabled") }}
  {{- end }}
  {{- with .container_vulnerability_management }}
    {{- $cvm := pick . "enabled" }}
    {{- with .target_workloads }}
      {{- $tw := dict }}
      {{- with .kubernetes }}{{- $_ := set $tw "kubernetes" (pick . "enabled" "image_source") }}{{- end }}
      {{- with .non_orchestrated_containers }}{{- $_ := set $tw "non_orchestrated_containers" (pick . "enabled" "ignore_init_failures") }}{{- end }}
      {{- $_ := set $cvm "target_workloads" $tw }}
    {{- end }}
    {{- $_ := set $vm "container_vulnerability_management" $cvm }}
  {{- end }}
  {{- with .in_use }}
    {{- $_ := set $vm "in_use" (pick . "enabled") }}
  {{- end }}
  {{- $_ := set $out "vulnerability_management" $vm }}
{{- end }}
{{- with $features.detections }}
  {{- $src := . }}
  {{- $det := dict }}
  {{- range $k := list "drift_control" "malware_control" "ml_policies" }}
    {{- if hasKey $src $k }}
      {{- $_ := set $det $k (pick (get $src $k) "enabled") }}
    {{- end }}
  {{- end }}
  {{- $_ := set $out "detections" $det }}
{{- end }}
{{- with $features.investigations }}
  {{- $src := . }}
  {{- $inv := dict }}
  {{- range $k := list "activity_audit" "live_logs" "network_security" "captures" }}
    {{- if hasKey $src $k }}
      {{- $_ := set $inv $k (pick (get $src $k) "enabled") }}
    {{- end }}
  {{- end }}
  {{- with .event_forwarder }}
    {{- $ef := pick . "enabled" }}
    {{- if .integrations }}{{- $_ := set $ef "integrations" (deepCopy .integrations) }}{{- end }}
    {{- if .transmit_message_types }}{{- $_ := set $ef "transmit_message_types" (deepCopy .transmit_message_types) }}{{- end }}
    {{- $_ := set $inv "event_forwarder" $ef }}
  {{- end }}
  {{- $_ := set $out "investigations" $inv }}
{{- end }}
{{- with (get $features (include "host.respond_key" $features)) }}
  {{- $respond := dict }}
  {{- with .rapid_response }}
    {{- $_ := set $respond "rapid_response" (pick . "enabled") }}
  {{- end }}
  {{- with .response_actions }}
    {{- $ra := pick . "kill_process" "file_acquire" "file_quarantine" "file_unquarantine" "kill_container" "stop_container" "start_container" "pause_container" "unpause_container" "capture" "host" }}
    {{- if $ra }}{{- $_ := set $respond "response_actions" (deepCopy $ra) }}{{- end }}
  {{- end }}
  {{- $_ := set $out "respond" $respond }}
{{- end }}
{{- with (get $features (include "host.monitor_key" $features)) }}
  {{- $src := . }}
  {{- $mon := dict }}
  {{- range $k := list "app_checks" "java_management_extensions" "prometheus" "statsd" }}
    {{- if hasKey $src $k }}
      {{- $_ := set $mon $k (pick (get $src $k) "enabled") }}
    {{- end }}
  {{- end }}
  {{- $_ := set $out "monitor" $mon }}
{{- end }}
{{- $out | toYaml }}
{{- end }}

{{- /* host-shield image Linux host-shield.yaml. No credentials. */ -}}
{{- define "host.host_shield.linux_config" }}
{{- $config := dict }}
{{- $endpoint := include "host.shield_config.sysdig_endpoint" . | fromYaml }}
{{- if not $endpoint.api_url }}{{- $_ := unset $endpoint "api_url" }}{{- end }}
{{- if not (and $endpoint.collector (or $endpoint.collector.host $endpoint.collector.port)) }}{{- $_ := unset $endpoint "collector" }}{{- end }}
{{- $_ := set $config "sysdig_endpoint" $endpoint }}
{{- with .Values.cluster_config.name }}{{- $_ := set $config "cluster_config" (dict "name" .) }}{{- end }}
{{- with .Values.cluster_config.tags }}{{- $_ := set $config "tags" (deepCopy .) }}{{- end }}
{{- $_ := set $config "ssl" (include "host.shield_config.ssl" (dict "ctx" . "CACertsPath" "/opt/draios/certificates/") | fromYaml) }}
{{- if (include "common.proxy.enabled" .) }}{{- $_ := set $config "proxy" (include "host.proxy_config" . | fromYaml) }}{{- end }}
{{- $system := dict "driver_type" "universal_ebpf" }}
{{- if (include "host.need_host_root" .) }}{{- $_ := set $system "root_path" "/host" }}{{- end }}
{{- $_ := set $config "system" $system }}
{{- $_ := set $config "features" (include "host.host_shield.linux_features" . | fromYaml) }}
{{- $config = mergeOverwrite $config (deepCopy (default (dict) .Values.host.additional_settings)) }}
{{- $config | toYaml }}
{{- end }}
