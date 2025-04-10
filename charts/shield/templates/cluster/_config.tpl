{{- define "cluster.features_config" -}}
  {{- $features := list
      (dict "posture" (dig "posture" "cluster_posture" nil .Values.features ))
      (dict "container_vulnerability_management" (dig "vulnerability_management" "container_vulnerability_management" nil .Values.features ))
      (dict "audit" (dig "detections" "kubernetes_audit" nil .Values.features ))
      (dict "admission_control" (dig "admission_control" nil .Values.features ))
      (dict "kubernetes_metadata" (dig "kubernetes_metadata" nil .Values.features ))
  -}}
  {{- $featuresConfig := dict -}}
  {{- range $feature := $features }}
    {{- if (get $feature (keys $feature | first)) -}}
      {{- $featuresConfig = merge $featuresConfig $feature -}}
    {{- end -}}
  {{- end }}
  {{- $_ := set $featuresConfig.container_vulnerability_management "in_use" .Values.features.vulnerability_management.in_use -}}
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
    {{- if and (not .Values.sysdig_endpoint.api_url) (ne "custom" .Values.sysdig_endpoint.region) -}}
      {{- $_ := unset $sysdigEndpointConfig "api_url" -}}
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
      {{- if regexMatch "^v?([0-9]+)(\\.[0-9]+)?(\\.[0-9]+)?(-([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?(\\+([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?$" (.Values.on_prem_version | default "") -}}
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

      {{- if regexMatch "^v?([0-9]+)(\\.[0-9]+)?(\\.[0-9]+)?(-([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?(\\+([0-9A-Za-z\\-]+(\\.[0-9A-Za-z\\-]+)*))?$" (.Values.on_prem_version | default "") -}}
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
