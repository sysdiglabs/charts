{{- define "cluster.secret" -}}
  {{- $secret := dict -}}
  {{- if (include "cluster.container_vulnerability_management_enabled" .) -}}
    {{- $natsConfig := dig "cluster_scanner" "runtime_status_integrator" "nats_server" nil .Values.cluster.additional_settings -}}
    {{- if not (hasKey $natsConfig "password_existing_secret") -}}
      {{- $_ := set $secret "sysdig-cluster-nats-password" (default (randAlphaNum 32) (get $natsConfig "password")) -}}
    {{- end -}}
  {{- end -}}
  {{- range $index, $value := $secret }}
      {{- $_ := set $secret $index (b64enc $value) -}}
  {{- end -}}
  {{- $secret | toYaml -}}
{{- end -}}
