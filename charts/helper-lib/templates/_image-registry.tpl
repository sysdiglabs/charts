{{- define "helper-lib.imageRegistry" -}}
    {{- .Values.global.image.registry | default .Values.image.registry -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.image.registry -}}
{{- end -}}
{{- end -}}
