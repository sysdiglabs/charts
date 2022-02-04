{{- define "helper-lib.clusterName" -}}
    {{- .Values.clusterName | default .Values.global.clusterConfig.name | default "" -}}
{{- end -}}
