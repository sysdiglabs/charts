{{/*
Expand the name of the chart.
*/}}
{{- define "agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "agent.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "agent.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "agent.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Define the proper imageRegistry to use for agent and kmodule image
*/}}
{{- define "agent.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.image.registry -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig Agent image name
*/}}
{{- define "agent.repositoryName" -}}
{{- if .Values.slim.enabled -}}
    {{- .Values.slim.image.repository -}}
{{- else -}}
    {{- .Values.image.repository -}}
{{- end -}}
{{- end -}}

{{- define "agent.image" -}}
{{- if .Values.image.overrideValue }}
    {{- printf .Values.image.overrideValue -}}
{{- else -}}
    {{- include "agent.imageRegistry" . -}} / {{- include "agent.repositoryName" . -}} : {{- .Values.image.tag -}}
{{- end -}}
{{- end -}}

{{/*
Sysdig Agent resources
*/}}
{{- define "agent.resources" -}}
{{/* we have same values for both requests and limits */}}
{{- $smallCpu := "1000m" -}}
{{- $smallMemory := "1024Mi" -}}
{{- $mediumCpu := "3000m" -}}
{{- $mediumMemory := "3072Mi" -}}
{{- $largeCpu := "5000m" -}}
{{- $largeMemory := "6144Mi" -}}
{{- if eq .Values.resourceProfile "small" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $smallCpu $smallMemory $smallCpu $smallMemory -}}
{{- else if eq .Values.resourceProfile "medium" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $mediumCpu $mediumMemory $mediumCpu $mediumMemory -}}
{{- else if eq .Values.resourceProfile "large" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $largeCpu $largeMemory $largeCpu $largeMemory -}}
{{- else -}}{{/* "custom" or anything else falls here */}}
{{- toYaml .Values.resources -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig Agent image name for module building
*/}}
{{- define "agent.image.kmodule" -}}
    {{- include "agent.imageRegistry" . -}} / {{- .Values.slim.kmoduleImage.repository -}} : {{- .Values.image.tag -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "agent.labels" -}}
helm.sh/chart: {{ include "agent.chart" . }}
{{ include "agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Daemonset labels
*/}}
{{- define "daemonset.labels" -}}
  {{- if .Values.daemonset.labels }}
    {{- $tp := typeOf .Values.daemonset.labels }}
    {{- if eq $tp "string" }}
      {{- tpl .Values.daemonset.labels . }}
    {{- else }}
      {{- toYaml .Values.daemonset.labels }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
The following helper functions are all designed to use global values where
possible, but accept overrides from the chart values.
*/}}
{{- define "agent.accessKey" -}}
    {{- required "A valid accessKey is required" (.Values.sysdig.accessKey | default .Values.global.sysdig.accessKey) -}}
{{- end -}}

{{- define "agent.accessKeySecret" -}}
    {{/*
    Note: the last default function call is to avoid some weirdness when either
    argument is nil. If .Values.global.sysdig.accessKeySecret was undefined, the
    returned empty string does not evaluate to empty on Helm Version:"v3.8.0"
    */}}
    {{- .Values.sysdig.existingAccessKeySecret | default .Values.global.sysdig.accessKeySecret | default "" -}}
{{- end -}}

{{- define "agent.clusterName" -}}
    {{- .Values.clusterName | default .Values.global.clusterConfig.name | default "" -}}
{{- end -}}

{{/*
This helper uses the lookup function to check the osImage field of every node.
If all of them match the string indicating COS, then this will return true. If
the list is empty (ie, the lookup failed) or one or more don't match, this will
be false.
*/}}
{{- define "agent.isAllCos" -}}
    {{- $nodes := (lookup "v1" "Node" "" "").items -}}
    {{- $isCos := list -}}
    {{- range $_, $node := $nodes -}}
        {{- $isCos = append $isCos (eq $node.status.nodeInfo.osImage "Container-Optimized OS from Google") -}}
    {{- end -}}
    {{- not (or (empty $isCos) (has false $isCos)) -}}
{{- end -}}

{{/*
Check for all COS nodes or a flag to enable eBPF.
*/}}
{{- define "agent.ebpfEnabled" -}}
  {{- or (include "agent.isAllCos" .) .Values.ebpf.enabled -}}
{{- end -}}
