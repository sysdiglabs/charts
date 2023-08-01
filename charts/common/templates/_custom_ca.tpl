{{- define "sysdig.custom_ca.enabled" -}}
    {{ or (eq (include "sysdig.custom_ca.useExistingSecret" .) "true") (eq (include "sysdig.custom_ca.useExistingConfigMap" .) "true") (eq (include "sysdig.custom_ca.useValues" .) "true") -}}
{{- end -}}

{{- define "sysdig.custom_ca.useExistingSecret" -}}
    {{- if (and .component.ca.existingCaSecretKeyName .component.ca.existingCaSecret) -}}
        {{- true -}}
    {{- else if (and .component.ca.existingCaConfigMapKeyName .component.ca.existingCaConfigMap) -}}
        {{- false -}}
    {{- else if (and .component.ca.certs .component.ca.keyName) -}}
        {{- false -}}
    {{- else -}}
        {{- include "sysdig.custom_ca.globalUseExistingSecret" . -}}
    {{- end -}}
{{- end -}}

{{- define "sysdig.custom_ca.useExistingConfigMap" -}}
    {{- if (and .component.ca.existingCaSecretKeyName .component.ca.existingCaSecret) -}}
        {{- false -}}
    {{- else if (and .component.ca.existingCaConfigMapKeyName .component.ca.existingCaConfigMap) -}}
        {{- true -}}
    {{- else if (and .component.ca.certs .component.ca.keyName) -}}
        {{- false -}}
    {{- else -}}
        {{- include "sysdig.custom_ca.globalUseExistingConfigMap" . -}}
    {{- end -}}
{{- end -}}

{{- define "sysdig.custom_ca.useValues" -}}
    {{- if (and .component.ca.existingCaSecretKeyName .component.ca.existingCaSecret) -}}
        {{- false -}}
    {{- else if (and .component.ca.existingCaConfigMapKeyName .component.ca.existingCaConfigMap) -}}
        {{- false -}}
    {{- else if (and .component.ca.certs .component.ca.keyName) -}}
        {{- true -}}
    {{- else -}}
        {{- include "sysdig.custom_ca.globalUseValues" . -}}
    {{- end -}}
{{- end -}}

{{- define "sysdig.custom_ca.globalUseExistingSecret" -}}
    {{- if (and .global.ca.existingCaSecretKeyName .global.ca.existingCaSecret) -}}
        {{- true -}}
    {{- else if (and .global.ca.existingCaConfigMapKeyName .global.ca.existingCaConfigMap) -}}
        {{- false -}}
    {{- else if (and .global.ca.certs .global.ca.keyName) -}}
        {{- false -}}
    {{- end -}}
{{- end -}}

{{- define "sysdig.custom_ca.globalUseExistingConfigMap" -}}
    {{- if (and .global.ca.existingCaSecretKeyName .global.ca.existingCaSecret) -}}
        {{- false -}}
    {{- else if (and .global.ca.existingCaConfigMapKeyName .global.ca.existingCaConfigMap) -}}
        {{- true -}}
    {{- else if (and .global.ca.certs .global.ca.keyName) -}}
        {{- false -}}
    {{- end -}}
{{- end -}}

{{- define "sysdig.custom_ca.globalUseValues" -}}
    {{- if (and .global.ca.existingCaSecretKeyName .global.ca.existingCaSecret) -}}
        {{- false -}}
    {{- else if (and .global.ca.existingCaConfigMapKeyName .global.ca.existingCaConfigMap) -}}
        {{- false -}}
    {{- else if (and .global.ca.certs .global.ca.keyName) -}}
        {{- true -}}
    {{- end -}}
{{- end -}}

{{- define "sysdig.custom_ca.existingSecret" -}}
    {{- .component.ca.existingCaSecret | default .global.ca.existingCaSecret -}}
{{- end -}}

{{- define "sysdig.custom_ca.existingConfigMap" -}}
    {{- .component.ca.existingCaConfigMap | default .global.ca.existingCaConfigMap -}}
{{- end -}}

{{- define "sysdig.custom_ca.cert" -}}
    {{- printf "%s%s" (join "" (.component.ca.certs | default .global.ca.certs)) ( .Files.Get "sysdig_ca.toml" ) -}}
{{- end -}}

{{- define "sysdig.custom_ca.keyName" -}}
    {{- if eq (include "sysdig.custom_ca.useExistingSecret" .) "true" -}}
        {{- .component.ca.existingCaSecretKeyName | default .global.ca.existingCaSecretKeyName -}}
    {{- else if eq (include "sysdig.custom_ca.useExistingConfigMap" .) "true" -}}
        {{- .component.ca.existingCaConfigMapKeyName | default .global.ca.existingCaConfigMapKeyName -}}
    {{- else if eq (include "sysdig.custom_ca.useValues" .) "true" -}}
        {{- .component.ca.keyName | default .global.ca.keyName -}}
    {{- end -}}
{{- end -}}
