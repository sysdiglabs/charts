
{{- define "host.windows.node_selector" -}}
{{- $nodeSelector := merge (dict) .Values.node_selector .Values.host_windows.node_selector -}}
{{- with $nodeSelector -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.windows.tolerations" -}}
{{- $tolerations := concat .Values.tolerations .Values.host_windows.tolerations -}}
{{- with $tolerations -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.windows.affinity" -}}
{{- $affinity := merge (dict) .Values.affinity .Values.host_windows.affinity -}}
{{- with $affinity -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.windows.resources" }}
{{- with .Values.host_windows.resources }}
{{- . | toYaml }}
{{- end }}
{{- end }}

{{- define "host.windows.shield_image" }}
{{- .Values.host_windows.image.registry -}} / {{- .Values.host_windows.image.repository -}} / {{- .Values.host_windows.image.name -}} : {{- .Values.host_windows.image.tag }}
{{- end }}

{{- define "host.windows.env" -}}
{{- $env := concat (default (list) .Values.env) (default (list) .Values.host_windows.env) -}}
{{- with $env -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.windows.volumes" -}}
{{- $volumes := concat (default (list) .Values.volumes) (default (list) .Values.host_windows.volumes) -}}
{{- with $volumes -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.windows.volume_mounts" -}}
{{- $volumeMounts := concat (default (list) .Values.volume_mounts) (default (list) .Values.host_windows.volume_mounts) -}}
{{- with $volumeMounts -}}
{{- . | toYaml -}}
{{- end -}}
{{- end -}}

{{- define "host.windows.runtime_config_override" -}}
{{ .Values.host_windows.agent_runtime_additional_settings | toYaml }}
{{- end -}}

{{- define "host.windows.shield_config_override" -}}
{{ .Values.host_windows.additional_settings | toYaml }}
{{- end -}}

{{- define "host.windows.need_host_root" }}
{{- if or .Values.features.posture.host_posture.enabled .Values.features.vulnerability_management.host_vulnerability_management.enabled }}
{{- true -}}
{{- end }}
{{- end }}
