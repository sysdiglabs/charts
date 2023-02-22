{{/*
Determine sysdig monitor endpoint based on provided region
*/}}
{{- define "monitorUrl" -}}
    {{- if hasKey ((include "sysdig.regions" .) | fromYaml) .Values.global.sysdig.region }}
        {{- include "sysdig.monitorApiEndpoint" . }}
    {{- else -}}
        {{- if (ne .Values.global.sysdig.region "custom") -}}
            {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{/*
Determine sysdig secure endpoint based on provided region
*/}}
{{- define "secureUrl" -}}
    {{- if hasKey ((include "sysdig.regions" .) | fromYaml) .Values.global.sysdig.region }}
        {{- include "sysdig.secureUi" . }}
    {{- else -}}
        {{- if (ne .Values.global.sysdig.region "custom") -}}
            {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{/* Returns string 'true' if the cluster's kubeVersion is greater than the parameter provided, or nothing otherwise
     Use like: {{ include "kubeVersionGreaterThan" (dict "root" . "major" <kube_major_to_compare> "minor" <kube_minor_to_compare>) }}

     Note: The use of `"root" .` in the parameter dict is necessary as the .Capabilities fields are not provided in
           helper functions when "helm template" is used.
*/}}
{{- define "kubeVersionGreaterThan" }}
{{- if (and (ge (.root.Capabilities.KubeVersion.Major | int) .major)
            (gt (.root.Capabilities.KubeVersion.Minor | trimSuffix "+" | int) .minor)) }}
true
{{- end }}
{{- end }}

{{/*
Determine whether runtime scanner shall run by including the helper from nodeAnalyzer chart.

Based on: https://github.com/helm/helm/issues/4535#issuecomment-416022809
*/}}
{{- define "deployRuntimeScanner" }}
{{- include "nodeAnalyzer.deployRuntimeScanner" (dict "Chart" (dict "Name" "nodeAnalyzer") "Values" (index .Values "nodeAnalyzer") "Release" .Release "Capabilities" .Capabilities) }}
{{- end }}
