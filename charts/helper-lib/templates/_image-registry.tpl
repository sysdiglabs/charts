{{- define "helper-lib.imageRegistry" -}}
    {{- .Values.image.registry | default .Values.global.image.registry -}}
{{- end -}}
