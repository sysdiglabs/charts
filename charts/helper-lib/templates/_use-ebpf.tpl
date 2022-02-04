{{- define "helper-lib.ebpfEnabled" -}}
  {{- or (include "helper-lib.isAllCos" .) .Values.ebpf.enabled -}}
{{- end -}}
