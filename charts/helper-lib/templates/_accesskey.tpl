{{- define "helper-lib.accessKey" -}}
    {{- required "A valid accessKey is required" (.Values.sysdig.accessKey | default .Values.global.sysdig.apiKey) -}}
{{- end -}}
