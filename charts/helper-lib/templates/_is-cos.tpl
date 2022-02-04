{{- define "helper-lib.isAllCos" -}}
    {{- $nodes := (lookup "v1" "Node" "" "").items -}}
    {{- $isCos := list -}}
    {{- range $_, $node := $nodes -}}
        {{- $isCos = append $isCos (eq $node.status.nodeInfo.osImage "Container-Optimized OS from Google") -}}
    {{- end -}}
    {{- not (has false $isCos) -}}
{{- end -}}
