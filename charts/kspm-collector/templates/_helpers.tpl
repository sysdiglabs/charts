{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "kspmCollector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kspmCollector.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kspmCollector.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the kspm collector specific service account to use
*/}}
{{- define "kspmCollector.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "kspmCollector.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Define the proper imageRegistry to use for agent and kmodule image
*/}}
{{- define "kspmCollector.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.image.registry -}}
{{- end -}}
{{- end -}}


{{/*
Return the proper image name for the KSPM Collector
*/}}
{{- define "kspmCollector.image.kspmCollector" -}}
    {{- include "kspmCollector.imageRegistry" . -}} / {{- .Values.image.repository -}} {{- if .Values.image.digest -}} @ {{- .Values.image.digest -}} {{- else -}} : {{- .Values.image.tag -}} {{- end -}}
{{- end -}}

{{/*
KSPM Collector labels
*/}}
{{- define "kspmCollector.labels" -}}
helm.sh/chart: {{ include "kspmCollector.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.labels }}
{{- $tp := typeOf .Values.labels }}
{{- if eq $tp "string" }}
{{- if not (regexMatch "^[a-z0-9A-Z].*(: )(.*[a-z0-9A-Z]$)?" .Values.labels) }}
    {{- fail "labels does not seem to be of the type key:[space]value" }}
{{- end }}
{{ tpl .Values.labels . }}
{{- else }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
The following helper functions are all designed to use global values where
possible, but accept overrides from the chart values.
*/}}
{{- define "kspmCollector.accessKey" -}}
    {{- required "A valid accessKey is required" (.Values.sysdig.accessKey | default .Values.global.sysdig.accessKey) -}}
{{- end -}}

{{- define "kspmCollector.accessKeySecret" -}}
    {{/*
    Note: the last default function call is to avoid some weirdness when either
    argument is nil. If .Values.global.sysdig.accessKeySecret was undefined, the
    returned empty string does not evaluate to empty on Helm Version:"v3.8.0"
    */}}
    {{- .Values.sysdig.existingAccessKeySecret | default .Values.global.sysdig.accessKeySecret | default "" -}}
{{- end -}}

{{- define "kspmCollector.clusterName" -}}
    {{- .Values.clusterName | default .Values.global.clusterConfig.name | default "" -}}
{{- end -}}

{{/*
Determine collector endpoint based on provided region or .Values.apiEndpoint
*/}}
{{- define "kspmCollector.apiEndpoint" -}}
    {{- if .Values.apiEndpoint -}}
        {{- .Values.apiEndpoint -}}
    {{- else if hasKey ((include "sysdig.regions" .) | fromYaml) .Values.global.sysdig.region }}
        {{- include "sysdig.secureApiEndpoint" . }}
    {{- end -}}
{{- end -}}

{{/*
Sysdig NATS service URL
*/}}
{{- define "kspmCollector.natsUrl" -}}
{{- if .Values.natsUrl -}}
    {{- .Values.natsUrl -}}
{{- else -}}
    wss://{{ (include "kspmCollector.apiEndpoint" .) }}:443
{{- end -}}
{{- end -}}


{{/*
 Helper to define if to enable nats_insecure
*/}}
{{- define "kspmCollector.natsInsecure" -}}
{{- if and (hasKey .Values "sslVerifyCertificate") ( .Values.sslVerifyCertificate ) -}}
    "false"
{{- else if and (hasKey .Values.global "sslVerifyCertificate") ( .Values.global.sslVerifyCertificate ) -}}
    "false"
{{- else -}}
    "true"
{{- end -}}
{{- end -}}


{{/*
Returns the namespace for installing components
*/}}
{{- define "kspmCollector.namespace" -}}
    {{- coalesce .Values.namespace .Release.Namespace -}}
{{- end -}}

{{/*
KSPM Collector nodeSelector
*/}}
{{- define "kspmCollector.nodeSelector" -}}
{{- if .Values.nodeSelector }}
{{- $tp := typeOf .Values.nodeSelector }}
{{- if eq $tp "string" }}
{{- if not (regexMatch "^[a-z0-9A-Z].*(: )(.*[a-z0-9A-Z]$)?" .Values.nodeSelector) }}
    {{- fail "nodeSelector does not seem to be of the type key:[space]value" }}
{{- end }}
{{ tpl .Values.nodeSelector . }}
{{- else }}
{{ toYaml .Values.nodeSelector }}
{{- end }}
{{- end }}
{{- end -}}

{{/* Returns string 'true' if the cluster's kubeVersion is less than the parameter provided, or nothing otherwise
     Use like: {{ include "kspmCollector.kubeVersionLessThan" (dict "root" . "major" <kube_major_to_compare> "minor" <kube_minor_to_compare>) }}

     Note: The use of `"root" .` in the parameter dict is necessary as the .Capabilities fields are not provided in
           helper functions when "helm template" is used.
*/}}
{{- define "kspmCollector.kubeVersionLessThan" }}
{{- if (and (le (.root.Capabilities.KubeVersion.Major | int) .major)
            (lt (.root.Capabilities.KubeVersion.Minor | trimSuffix "+" | int) .minor)) }}
true
{{- end }}
{{- end }}

{{/*
Return agent tags if available
*/}}
{{- define "agent.tags" }}
{{- if hasKey .Values.global "settings" }}
{{- if hasKey .Values.global.settings "tags" }}
{{- .Values.global.settings.tags }}
{{- end }}
{{- else if hasKey .Values.agent.sysdig.settings "tags" }}
{{- .Values.agent.sysdig.settings.tags }}
{{- end }}
{{- end }}