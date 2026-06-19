{{/*
Go runtime tuning env vars (GOMAXPROCS / GOMEMLIMIT) derived from this container's
own resource limits, so nothing is hardcoded and it tracks whatever the chart
renders. Intended for Windows pods, where Go cannot read cgroup limits and would
otherwise fall back to whole-node CPU count and no memory ceiling. Each var is
emitted only when the matching limit is set.

Expected context:
  .ContainerName  name of the container the resourceFieldRef points at
  .Limits         the container's resources.limits map
*/}}
{{- define "common.go_runtime.envs" -}}
{{- with .Limits }}
{{- if .cpu }}
- name: GOMAXPROCS
  valueFrom:
    resourceFieldRef:
      containerName: {{ $.ContainerName }}
      resource: limits.cpu        # exposed rounded UP to integer cores
{{- end }}
{{- if .memory }}
- name: GOMEMLIMIT
  valueFrom:
    resourceFieldRef:
      containerName: {{ $.ContainerName }}
      resource: limits.memory
      divisor: "1"                # raw bytes; Go reads a bare int as bytes
{{- end }}
{{- end }}
{{- end -}}
