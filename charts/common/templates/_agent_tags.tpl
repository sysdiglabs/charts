{{/*
Use global sysdig tags for agent
*/}}
{{- define "agent.tags" -}}
    {{- if .Values.global.sysdig.tags -}}
        {{- with .Values.global.sysdig.tags -}}
            {{- $fields := list -}}
            {{- range $k, $v := . -}}
                {{- $fields = (printf "%s:%s" $k $v) | append $fields -}}
            {{- end -}}
            {{- join "," $fields -}}
        {{- end -}}
    {{- end -}}
{{- end -}}
