{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "nodeAnalyzer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nodeAnalyzer.fullname" -}}
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
{{- define "nodeAnalyzer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the node analyzer specific service account to use
*/}}
{{- define "nodeAnalyzer.serviceAccountName" -}}
{{- if .Values.nodeAnalyzer.serviceAccount.create -}}
    {{ default (include "nodeAnalyzer.fullname" .) .Values.nodeAnalyzer.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.nodeAnalyzer.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Define the proper imageRegistry to use for agent and kmodule image
*/}}
{{- define "nodeAnalyzer.imageRegistry" -}}
{{- if and .Values.global (hasKey (default .Values.global dict) "imageRegistry") -}}
    {{- .Values.global.imageRegistry -}}
{{- else -}}
    {{- .Values.image.registry -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig Agent image name
*/}}
{{- define "nodeAnalyzer.repositoryName" -}}
{{- if .Values.slim.enabled -}}
    {{- .Values.slim.image.repository -}}
{{- else -}}
    {{- .Values.image.repository -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper nodeAnalyzer Agent image name for the Runtime Scanner
*/}}
{{- define "nodeAnalyzer.image.runtimeScanner" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.runtimeScanner.image.repository -}} {{- if .Values.nodeAnalyzer.runtimeScanner.image.digest -}} @ {{- .Values.nodeAnalyzer.runtimeScanner.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.runtimeScanner.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig nodeAnalyzer image name for the Eve Connector
*/}}
{{- define "nodeAnalyzer.image.eveConnector" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.runtimeScanner.eveConnector.image.repository -}} {{- if .Values.nodeAnalyzer.runtimeScanner.eveConnector.image.digest -}} @ {{- .Values.nodeAnalyzer.runtimeScanner.eveConnector.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.runtimeScanner.eveConnector.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper nodeAnalyzer Agent image name for the Host Scanner
*/}}
{{- define "nodeAnalyzer.image.hostScanner" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.hostScanner.image.repository -}} {{- if .Values.nodeAnalyzer.hostScanner.image.digest -}} @ {{- .Values.nodeAnalyzer.hostScanner.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.hostScanner.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper image name for the Image Analyzer
*/}}
{{- define "nodeAnalyzer.image.imageAnalyzer" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.imageAnalyzer.image.repository -}} {{- if .Values.nodeAnalyzer.imageAnalyzer.image.digest -}} @ {{- .Values.nodeAnalyzer.imageAnalyzer.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.imageAnalyzer.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper image name for the Host Analyzer
*/}}
{{- define "nodeAnalyzer.image.hostAnalyzer" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.hostAnalyzer.image.repository -}} {{- if .Values.nodeAnalyzer.hostAnalyzer.image.digest -}} @ {{- .Values.nodeAnalyzer.hostAnalyzer.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.hostAnalyzer.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper image name for the Benchmark Runner
*/}}
{{- define "nodeAnalyzer.image.benchmarkRunner" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.benchmarkRunner.image.repository -}} {{- if .Values.nodeAnalyzer.benchmarkRunner.image.digest -}} @ {{- .Values.nodeAnalyzer.benchmarkRunner.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.benchmarkRunner.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Return the proper image name for the CSPM Analyzer
*/}}
{{- define "nodeAnalyzer.image.kspmAnalyzer" -}}
    {{- include "nodeAnalyzer.imageRegistry" . -}} / {{- .Values.nodeAnalyzer.kspmAnalyzer.image.repository -}} {{- if .Values.nodeAnalyzer.kspmAnalyzer.image.digest -}} @ {{- .Values.nodeAnalyzer.kspmAnalyzer.image.digest -}} {{- else -}} : {{- .Values.nodeAnalyzer.kspmAnalyzer.image.tag -}} {{- end -}}
{{- end -}}

{{/*
Node Analyzer labels
*/}}
{{- define "nodeAnalyzer.labels" -}}
helm.sh/chart: {{ include "nodeAnalyzer.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Daemonset labels
*/}}
{{- define "daemonset.labels" -}}
  {{- if .Values.daemonset.labels }}
  {{- $tp := typeOf .Values.daemonset.labels }}
    {{- if eq $tp "string" }}
        {{- if not (regexMatch "^[a-z0-9A-Z].*(: )(.*[a-z0-9A-Z]$)?" .Values.daemonset.labels) }}
            {{- fail "daemonset.label does not seem to be of the type key:[space]value" }}
        {{- end }}
        {{- tpl .Values.daemonset.labels . }}
    {{- else }}
        {{- toYaml .Values.daemonset.labels }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
Sysdig Eve Connector service URL
*/}}
{{- define "eveconnector.host" -}}
{{ include "nodeAnalyzer.fullname" .}}-eveconnector.{{ .Release.Namespace }}
{{- end -}}

{{/*
Sysdig Eve Connector Secret generation (if not exists)
*/}}
{{- define "eveconnector.token" -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace "sysdig-eve-secret" -}}
{{- if $secret -}}
{{ $secret.data.token }}
{{- else -}}
{{ randAlphaNum 32 | b64enc | quote }}
{{- end -}}
{{- end -}}

{{/*
The following helper functions are all designed to use global values where
possible, but accept overrides from the chart values.
*/}}
{{- define "nodeAnalyzer.accessKey" -}}
    {{- required "A valid accessKey is required" (.Values.sysdig.accessKey | default .Values.global.sysdig.accessKey) -}}
{{- end -}}

{{- define "nodeAnalyzer.accessKeySecret" -}}
    {{/*
    Note: the last default function call is to avoid some weirdness when either
    argument is nil. If .Values.global.sysdig.accessKeySecret was undefined, the
    returned empty string does not evaluate to empty on Helm Version:"v3.8.0"
    */}}
    {{- .Values.sysdig.existingAccessKeySecret | default .Values.global.sysdig.accessKeySecret | default "" -}}
{{- end -}}

{{- define "nodeAnalyzer.clusterName" -}}
    {{- .Values.clusterName | default .Values.global.clusterConfig.name | default "" -}}
{{- end -}}

{{/*
Determine collector endpoint based on provided region or .Values.nodeAnalyzer.apiEndpoint
*/}}
{{- define "nodeAnalyzer.apiEndpoint" -}}
    {{- if (or .Values.nodeAnalyzer.apiEndpoint (eq .Values.global.sysdig.region "custom"))  -}}
        {{- required "A valid apiEndpoint is required" .Values.nodeAnalyzer.apiEndpoint -}}
    {{- else if hasKey ((include "sysdig.regions" .) | fromYaml) .Values.global.sysdig.region }}
        {{- include "sysdig.secureApiEndpoint" . }}
    {{- else -}}
        {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
    {{- end -}}
{{- end -}}

{{- define "deploy-na" -}}
{{- if .Values.nodeAnalyzer.deploy -}}
true
{{- end -}}
{{- end -}}

{{/*
Sysdig NATS service URL
*/}}
{{- define "nodeAnalyzer.natsUrl" -}}
{{- if .Values.natsUrl -}}
    {{- .Values.natsUrl -}}
{{- else -}}
    wss://{{ ( include "nodeAnalyzer.apiEndpoint" .) }}:443
{{- end -}}
{{- end -}}

{{/*
nodeAnalyzer agentConfigmapName
*/}}
{{- define "nodeAnalyzer.configmapName" -}}
    {{- default .Values.global.agentConfigmapName | default "sysdig-agent" -}}
{{- end -}}

{{- define "nodeAnalyzer.deployHostScanner" -}}
{{- if and (hasKey ((.Values.nodeAnalyzer).hostScanner) "deploy") (not .Values.nodeAnalyzer.hostScanner.deploy ) }}
{{- else if or ((.Values.secure).vulnerabilityManagement).newEngineOnly (and (hasKey ((.Values.nodeAnalyzer).hostScanner) "deploy") .Values.nodeAnalyzer.hostScanner.deploy) -}}
true
{{- end -}}
{{- end -}}

{{- define "nodeAnalyzer.deployRuntimeScanner" -}}
{{- if and (hasKey ((.Values.nodeAnalyzer).runtimeScanner) "deploy") (not .Values.nodeAnalyzer.runtimeScanner.deploy ) }}
{{- else if or ((.Values.secure).vulnerabilityManagement).newEngineOnly (and (hasKey ((.Values.nodeAnalyzer).runtimeScanner) "deploy") .Values.nodeAnalyzer.runtimeScanner.deploy) -}}
true
{{- end -}}
{{- end -}}

{{- define "nodeAnalyzer.deployBenchmarkRunner" -}}
{{- if or (not (hasKey .Values.nodeAnalyzer.benchmarkRunner "deploy")) .Values.nodeAnalyzer.benchmarkRunner.deploy }}
true
{{- end -}}
{{- end -}}

{{- define "nodeAnalyzer.useHostPID" -}}
{{- if (include "nodeAnalyzer.deployBenchmarkRunner" .) }}
true
{{ else if or (not (hasKey .Values.global.kspm "deploy")) .Values.global.kspm.deploy }}
true
{{- end -}}
{{- end -}}

{{- define "nodeAnalyzer.deployImageAnalyzer" -}}
{{- if and (not .Values.secure.vulnerabilityManagement.newEngineOnly) (or (not (hasKey .Values.nodeAnalyzer.imageAnalyzer "deploy")) .Values.nodeAnalyzer.imageAnalyzer.deploy) }}
true
{{- end -}}
{{- end -}}

# Legacy components #
{{- define "nodeAnalyzer.deployHostAnalyzer" -}}
{{- if and (not .Values.secure.vulnerabilityManagement.newEngineOnly) (or (not (hasKey .Values.nodeAnalyzer.hostAnalyzer "deploy")) .Values.nodeAnalyzer.hostAnalyzer.deploy) }}
true
{{- end -}}
{{- end -}}

{{/*
Deploy on GKE autopilot
*/}}
{{- define "nodeAnalyzer.gke.autopilot" -}}
    {{- if (or .Values.global.gke.autopilot .Values.gke.autopilot) }}
        true
    {{- end -}}
{{- end -}}

{{/*
Returns the namespace for installing components
*/}}
{{- define "nodeAnalyzer.namespace" -}}
    {{- coalesce .Values.namespace .Values.global.clusterConfig.namespace .Release.Namespace -}}
{{- end -}}

{{/* Returns string 'true' if the cluster's kubeVersion is less than the parameter provided, or nothing otherwise
     Use like: {{ include "nodeAnalyzer.kubeVersionLessThan" (dict "root" . "major" <kube_major_to_compare> "minor" <kube_minor_to_compare>) }}

     Note: The use of `"root" .` in the parameter dict is necessary as the .Capabilities fields are not provided in
           helper functions when "helm template" is used.
*/}}
{{- define "nodeAnalyzer.kubeVersionLessThan" }}
{{- if (and (le (.root.Capabilities.KubeVersion.Major | int) .major)
            (lt (.root.Capabilities.KubeVersion.Minor | trimSuffix "+" | int) .minor)) }}
true
{{- end }}
{{- end }}
