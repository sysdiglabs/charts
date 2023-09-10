{{/*
Flatten tags dict recursively
*/}}
{{- define "dict.flatten" -}}
    {{- $map := first . -}}
    {{- $label := last . -}}
    {{- $fields := list -}}
    {{- range $key, $val := $map -}}
        {{- $sublabel := list $label $key | join "." -}}
        {{- if $label | eq "" -}}
        {{ $sublabel = $key }}
        {{- end -}}
        {{- if kindOf $val | eq "map" -}}
            {{- $fields = (list $val $sublabel | include "dict.flatten") | append $fields }}
        {{- else -}}
            {{- $fields = (printf "%s:%s" $sublabel $val) | append $fields -}}
        {{- end -}}
    {{- end -}}
    {{- join "," $fields -}}
{{- end -}}

{{/*
Use global sysdig tags for agent
*/}}
{{- define "agent.tags" -}}
{{- if .Values.global.sysdig.tags -}}
    {{- $args := list .Values.global.sysdig.tags ""}}
    {{- include "dict.flatten" $args }}
{{- end -}}
{{- end -}}