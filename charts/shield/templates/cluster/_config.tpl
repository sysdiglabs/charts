{{- define "cluster.features_config" -}}
  {{- $monitorFeature := (dig "monitor" nil .Values.features) -}}
  {{- $investigationsFeature := (dig "investigations" nil .Values.features) -}}
  {{- $respondFeature := (dig "respond" nil .Values.features) -}}
  {{- if not (hasKey $respondFeature.response_actions "cluster") }}
    {{- $_ := set $respondFeature.response_actions "cluster" (dict "volume_snapshot_class" "") }}
  {{- end }}
  {{- $features := list
      (dict "posture" (dig "posture" "cluster_posture" nil .Values.features ))
      (dict "container_vulnerability_management" (dig "vulnerability_management" "container_vulnerability_management" nil .Values.features ))
      (dict "audit" (dig "detections" "kubernetes_audit" nil .Values.features ))
      (dict "admission_control" (dig "admission_control" nil .Values.features ))
      (dict "kubernetes_metadata" (dig "kubernetes_metadata" nil .Values.features ))
      (dict "monitor" (pick $monitorFeature "kube_state_metrics" "kubernetes_events"))
      (dict "investigations" (pick $investigationsFeature "investigations" "network_security"))
  -}}
  {{- $featuresConfig := dict -}}
  {{- range $feature := $features }}
    {{- if (get $feature (keys $feature | first)) -}}
      {{- $featuresConfig = merge $featuresConfig $feature -}}
    {{- end -}}
  {{- end }}
  {{- $_ := set $featuresConfig.container_vulnerability_management "in_use" .Values.features.vulnerability_management.in_use -}}
  {{- $respond := (include "cluster.configmap.respond" .) | fromYaml }}
  {{- $_ := set $featuresConfig "respond" $respond -}}

  {{- $additionalFeaturesSettings := (dig "features" (dict) .Values.cluster.additional_settings) -}}
  {{- (mergeOverwrite $featuresConfig $additionalFeaturesSettings) | toYaml -}}
{{- end }}

{{- define "cluster.has_features_enabled" -}}
  {{- $config := (include "cluster.configmap" . | fromYaml) -}}
  {{- range $k, $v := (dig "features" (dict) $config) -}}
    {{- if dig "enabled" false $v -}}
      true
    {{- end -}}
  {{- end -}}
{{- end }}

{{- define "cluster.configmap" -}}
    {{- $config := dict -}}
    {{- $featuresConfig := (include "cluster.features_config" . | fromYaml) -}}
    {{- $sysdigEndpointWhitelist := list
        "region"
        "api_url"
    -}}
    {{- $sysdigEndpointConfig := dict -}}
    {{- range $k, $v := .Values.sysdig_endpoint -}}
        {{- if has $k $sysdigEndpointWhitelist -}}
            {{- $_ := set $sysdigEndpointConfig $k $v -}}
        {{- end -}}
    {{- end -}}
    {{- if and .Values.sysdig_endpoint.collector.host .Values.sysdig_endpoint.collector.port -}}
      {{- $_ := set $sysdigEndpointConfig "collector" (printf "%s:%d" .Values.sysdig_endpoint.collector.host (.Values.sysdig_endpoint.collector.port | int)) -}}
    {{- end -}}
    {{- $_ := set $config "sysdig_endpoint" $sysdigEndpointConfig -}}
    {{- $_ := set $config "cluster_config" (dict "name" .Values.cluster_config.name) -}}
    {{- $clusterConfig := dict "name" .Values.cluster_config.name -}}
    {{- if .Values.cluster_config.tags -}}
      {{- $_ := set $clusterConfig "tags" .Values.cluster_config.tags -}}
    {{- end -}}
    {{- $_ := set $config "cluster_config" $clusterConfig -}}
    {{- $_ := set $config "features" $featuresConfig -}}
    {{- $_ := set $config "kubernetes" (dict
      "root_namespace" .Values.cluster_config.root_namespace
      "running_namespace" .Release.Namespace
      "tls_cert_file" (printf "%s%s" (include "cluster.tls_certificates.mount_path" .) (include "cluster.tls_certificates.cert_file_name" .))
      "tls_private_key_file" (printf "%s%s" (include "cluster.tls_certificates.mount_path" .) (include "cluster.tls_certificates.private_key_file_name" .))
      "ca_cert_file" (printf "%s%s" (include "cluster.tls_certificates.mount_path" .) (include "cluster.tls_certificates.ca_cert_file_name" .))
    ) -}}
    {{- if (include "cluster.audit_enabled" .) -}}
      {{- if (include "common.semver.is_valid" (.Values.on_prem_version | default "")) -}}
        {{- if semverCompare "< 6.12.0" .Values.on_prem_version -}}
          {{- if not (include "common.credentials.has_secure_api_token" . ) -}}
            {{- fail "Secure API Token is required for kubernetes audit with On Premise Versions < 6.12.0" -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
    {{- if (include "cluster.container_vulnerability_management_enabled" .) -}}
      {{- $clusterScannerConfig := dig "cluster_scanner" (dict) $config -}}
      {{- $natsConfig := dig "cluster_scanner" "runtime_status_integrator" "nats_server" (dict) $clusterScannerConfig -}}
      {{- if hasKey $natsConfig "password" -}}
        {{- $_ := unset $clusterScannerConfig.runtime_status_integrator.nats_server "password" -}}
      {{- end -}}
      {{- if hasKey $natsConfig "password_existing_secret" -}}
        {{- $_ := unset $clusterScannerConfig.runtime_status_integrator.nats_server "password_existing_secret" -}}
      {{- end -}}
      {{- $iseConfig := dig "image_sbom_extractor" (dict) $clusterScannerConfig -}}
      {{- $_ := set $iseConfig "nats_url" (printf "nats://%s:4222" (include "cluster.container_vulnerability_management_service_name" .)) -}}
      {{- $_ := set $clusterScannerConfig "image_sbom_extractor" $iseConfig -}}
      {{- $_ := set $clusterScannerConfig "leader_election_lock_name" (include "cluster.container_vulnerability_management_lease_name" .) -}}
      {{- $_ := set $config "cluster_scanner" $clusterScannerConfig -}}

      {{- if (include "common.semver.is_valid" (.Values.on_prem_version | default "")) -}}
        {{- if semverCompare "< 6.12.0" .Values.on_prem_version -}}
          {{- $_ := set $config.features.container_vulnerability_management "platform_services_enabled" false -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
    {{- if (include "cluster.admission_control_container_vulnerability_management_enabled" .) -}}
      {{- $_ := set $config "admission_controller_secure" (dict
        "rsi_grpc_endpoint" (printf "%s:9999" (include "cluster.container_vulnerability_management_service_name" .))
      ) -}}
    {{- end -}}
    {{- if (include "cluster.posture_enabled" .) -}}
      {{- $kspmCollectorConfig := dig "kspm_collector" (dict) $config -}}
      {{- if (include "cluster.need_posture_lease" .) -}}
        {{- $_ := set $kspmCollectorConfig "leader_election_lock_name" (include "cluster.posture_lease_name" .) -}}
      {{- end -}}
      {{- $_ := set $config "kspm_collector" $kspmCollectorConfig -}}
    {{- end -}}
    {{- $_ := set $config "ssl" (dict "verify" .Values.ssl.verify) -}}
    {{- $_ := mergeOverwrite $config .Values.cluster.additional_settings -}}
    {{- $config | toYaml -}}
{{- end }}

{{/*
  Checks if the cluster has the container vulnerability management feature enabled.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.container_vulnerability_management_enabled" -}}
  {{- $featureConfig := (include "cluster.features_config" . | fromYaml) -}}
  {{- if or
    (dig "container_vulnerability_management" "enabled" false $featureConfig)
    (include "cluster.admission_control_container_vulnerability_management_enabled" .)
  -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
  Checks if the cluster has the admission control feature enabled.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.admission_control_enabled" -}}
  {{- $featureConfig := (include "cluster.features_config" . | fromYaml) -}}
  {{- if dig "admission_control" "enabled" false $featureConfig -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
  Checks if the cluster has the admission control container vulnerability management feature enabled.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.admission_control_container_vulnerability_management_enabled" -}}
  {{- $featureConfig := (include "cluster.features_config" . | fromYaml) -}}
  {{- if and
    (dig "admission_control" "enabled" false $featureConfig)
    (dig "admission_control" "container_vulnerability_management" "enabled" false $featureConfig)
  -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
  Checks if the cluster has the admission control container image signature feature enabled.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.admission_control_image_signature_enabled" -}}
  {{- $featureConfig := (include "cluster.features_config" . | fromYaml) -}}
  {{- if and
    (dig "admission_control" "enabled" false $featureConfig)
    (dig "admission_control" "supply_chain" "enabled" false $featureConfig)
    (dig "admission_control" "supply_chain" "image_signature" "enabled" false $featureConfig)
  -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
  Checks if the cluster has the audit feature enabled.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.audit_enabled" -}}
  {{- $featureConfig := (include "cluster.features_config" . | fromYaml) -}}
  {{- if dig "audit" "enabled" false $featureConfig -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
  Checks if the cluster has the posture feature enabled.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.posture_enabled" -}}
  {{- $featureConfig := (include "cluster.features_config" . | fromYaml) -}}
  {{- if dig "posture" "enabled" false $featureConfig -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
  Checks if the cluster has the kubernetes metadata feature enabled.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.kubernetes_metadata_enabled" -}}
  {{- $featureConfig := (include "cluster.features_config" . | fromYaml) -}}
  {{- if dig "kubernetes_metadata" "enabled" false $featureConfig -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
  Checks if the cluster requires the lease configuration for the posture feature.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.need_posture_lease" -}}
  {{- if and (eq (include "cluster.posture_enabled" .) "true") (eq (dig "kspm_collector" "transport_layer" "http" .Values.cluster.additional_settings) "http") -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
  Checks if the cluster has the response actions feature enabled.
  (either by the feature config or additional settings)
*/}}
{{- define "cluster.response_actions_enabled" -}}
  {{- $featureConfig := (include "cluster.features_config" . | fromYaml) -}}
  {{- if dig "respond" "response_actions" "enabled" false $featureConfig -}}
    {{- true -}}
  {{- end -}}
{{- end }}

{{/*
Generic helper: checks if .Values.features.respond.response_actions.<action>.trigger == "all"
Usage: {{ include "cluster.response_actions.is_enabled" (dict "Action" "delete_pod" "Context" .) }}
*/}}
{{- define "cluster.response_actions.is_enabled" -}}
    {{- $action := .Action }}
    {{- $ctx := .Context }}
    {{- with $ctx.Values.features.respond.response_actions -}}
        {{- $entry := index . $action }}
        {{- if and $entry (eq $entry.trigger "none") -}}
            false
        {{- else -}}
            true
        {{- end -}}
    {{- else -}}
        true
    {{- end -}}
{{- end -}}

{{/*
Response Actions: Cluster actions
In the future we will have more complex logic to determine if the action is enabled or not.
*/}}
{{- define "cluster.response_actions.rollout_restart.enabled" }}
    {{- include "cluster.response_actions.is_enabled" (dict "Action" "rollout_restart" "Context" .) }}
{{- end}}
{{- define "cluster.response_actions.delete_pod.enabled" }}
    {{- include "cluster.response_actions.is_enabled" (dict "Action" "delete_pod" "Context" .) }}
{{- end}}
{{- define "cluster.response_actions.isolate_network.enabled" }}
    {{- include "cluster.response_actions.is_enabled" (dict "Action" "isolate_network" "Context" .) }}
{{- end}}
{{- define "cluster.response_actions.delete_network_policy.enabled" }}
    {{- include "cluster.response_actions.is_enabled" (dict "Action" "delete_network_policy" "Context" .) }}
{{- end}}
{{- define "cluster.response_actions.get_logs.enabled" }}
    {{- include "cluster.response_actions.is_enabled" (dict "Action" "get_logs" "Context" .) }}
{{- end}}
{{- define "cluster.response_actions.volume_snapshot.enabled" }}
    {{- include "cluster.response_actions.is_enabled" (dict "Action" "volume_snapshot" "Context" .) }}
{{- end}}
{{- define "cluster.response_actions.delete_volume_snapshot.enabled" -}}
    {{- include "cluster.response_actions.is_enabled" (dict "Action" "delete_volume_snapshot" "Context" .) -}}
{{- end}}


{{- define "cluster.configmap.respond" }}
{{- $response_actions_feature := (dig "respond" "response_actions" nil .Values.features) }}
{{- $fields := list "enabled" "queue_length" "timeout" "cluster" }}
{{- $actions := list
  "rollout_restart"
  "delete_pod"
  "isolate_network"
  "delete_network_policy"
  "get_logs"
  "volume_snapshot"
  "delete_volume_snapshot"
}}
{{- if and (include "common.semver.is_valid" .Values.cluster.image.tag) (semverCompare ">= 1.14.0" .Values.cluster.image.tag) }}
  {{- $fields = (concat $fields $actions) }}
{{- end }}
{{- $response_actions := dict }}
{{- range $field := $fields }}
  {{- if hasKey $response_actions_feature $field}}
    {{- $response_actions := set $response_actions $field (index $response_actions_feature $field) }}
  {{- end}}
{{- end }}

{{- if (include "common.semver.is_valid" (.Values.on_prem_version | default "")) -}}
{{- if semverCompare ">= 7.3.0" .Values.on_prem_version -}}
    {{- dict "response_actions" $response_actions | toYaml -}}
{{- end -}}
{{- else -}}
{{- dict "response_actions" $response_actions | toYaml -}}
{{- end -}}

{{- end }}
