{{/* vim: set filetype=mustache: */}}
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
    {{- include "agent.imageRegistry" . -}} / {{- include "agent.repositoryName" . -}} {{- if .Values.image.digest -}} @ {{- .Values.image.digest -}} {{- else -}} : {{- .Values.image.tag -}} {{- end -}}
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
{{/* custom resource values are always first-class */}}
{{- if .Values.resources }}
{{- toYaml .Values.resources -}}
{{- else if eq .Values.resourceProfile "small" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $smallCpu $smallMemory $smallCpu $smallMemory -}}
{{- else if eq .Values.resourceProfile "medium" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $mediumCpu $mediumMemory $mediumCpu $mediumMemory -}}
{{- else if eq .Values.resourceProfile "large" -}}
{{- printf "requests:\n  cpu: %s\n  memory: %s\nlimits:\n  cpu: %s\n  memory: %s" $largeCpu $largeMemory $largeCpu $largeMemory -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Sysdig Agent image name for module building
*/}}
{{- define "agent.image.kmodule" -}}
    {{- include "agent.imageRegistry" . -}} / {{- .Values.slim.kmoduleImage.repository -}} {{- if .Values.slim.kmoduleImage.digest -}} @ {{- .Values.slim.kmoduleImage.digest -}} {{- else -}} : {{- .Values.image.tag -}} {{- end -}}
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
app: "sysdig-agent"
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
{{- define "agent.daemonsetLabels" -}}
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
Deployment labels
*/}}
{{- define "agent.deploymentLabels" -}}
  {{- if .Values.delegatedAgentDeployment.deployment.labels }}
    {{- $tp := typeOf .Values.delegatedAgentDeployment.deployment.labels }}
    {{- if eq $tp "string" }}
        {{- if not (regexMatch "^[a-z0-9A-Z].*(: )(.*[a-z0-9A-Z]$)?" .Values.delegatedAgentDeployment.deployment.labels) }}
            {{- fail "delegatedAgentDeployment.deployment.labels does not seem to be of the type key:[space]value" }}
        {{- end }}
        {{- tpl .Values.delegatedAgentDeployment.deployment.labels . }}
    {{- else }}
        {{- toYaml .Values.delegatedAgentDeployment.deployment.labels }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
Use like: {{ include "get_if_not_in_settings" (dict "root" . "default" "<coalesced value>" "setting" "<agent_setting>") }}
Return the default only if the value is not defined in sysdig.settings.<agent_setting>.
*/}}
{{- define "get_if_not_in_settings" -}}
{{- if not (hasKey .root.Values.sysdig.settings .setting) -}}
  {{- if or (kindIs "bool" .default) (.default) -}}
    {{- .default -}}
  {{- end -}}
{{- end -}}
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

{{/*
This helper uses the lookup function to check the osImage field of every node.
If all of them match the string indicating COS, then this will return true. If
the list is empty (ie, the lookup failed) or one or more don't match, this will
be false.
This doesn't return a true boolean, so anywhere it is used, it must be checked:
    eq "true" (include "agent.isAllCos")
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
Check for all COS nodes or a flag to enable eBPF. If false, return nothing so
it can act like a boolean
*/}}
{{- define "agent.ebpfEnabled" -}}
  {{- if (or (eq "true" (include "agent.isAllCos" .)) .Values.ebpf.enabled) -}}
    true
  {{- end -}}
{{- end -}}

{{/*
to help the maxUnavailable and max_parallel_cold_starts pick a reasonable value depending on the cluster size
*/}}
{{- define "agent.parallelStarts" -}}
{{- if .Values.daemonset.updateStrategy.rollingUpdate.maxUnavailable -}}
    {{- .Values.daemonset.updateStrategy.rollingUpdate.maxUnavailable -}}
{{- else if eq .Values.resourceProfile "small" -}}
    {{- 1 -}}
{{- else if or (eq .Values.resourceProfile "medium") (eq .Values.resourceProfile "large") -}}
    {{- 10 -}}
{{- else -}}
    {{- 1 -}}
{{- end -}}
{{- end -}}

{{/*
Returns the namespace for installing components
*/}}
{{- define "agent.namespace" -}}
    {{- coalesce .Values.namespace .Values.global.clusterConfig.namespace .Release.Namespace -}}
{{- end -}}

{{/*
Determine collector endpoint based on provided region
*/}}
{{- define "agent.collectorEndpoint" -}}
    {{- if (or .Values.collectorSettings.collectorHost (eq .Values.global.sysdig.region "custom")) -}}
        {{- required "collectorSettings.collectorHost is required for custom regions" (.Values.collectorSettings.collectorHost) -}}
    {{- else if (eq .Values.global.sysdig.region "us1") -}}
        {{- "collector.sysdigcloud.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us2") -}}
        {{- "ingest-us2.app.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us3") -}}
        {{- "ingest.us3.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us4") -}}
        {{- "ingest.us4.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "eu1") -}}
        {{- "ingest-eu1.app.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "au1") -}}
        {{- "ingest.au1.sysdig.com" -}}
    {{- else -}}
        {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
    {{- end -}}
{{- end -}}

{{/*
Determine sysdig monitor endpoint based on provided region
*/}}
{{- define "monitorUrl" -}}
    {{- if (or .Values.collectorSettings.collectorHost (eq .Values.global.sysdig.region "custom")) -}}
        {{- required "collectorSettings.collectorHost is required for custom regions" (.Values.collectorSettings.collectorHost) -}}
    {{- else if (eq .Values.global.sysdig.region "us1") -}}
        {{- "app.sysdigcloud.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us2") -}}
        {{- "us2.app.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us3") -}}
        {{- "app.us3.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us4") -}}
        {{- "app.us4.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "eu1") -}}
        {{- "eu1.app.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "au1") -}}
        {{- "app.au1.sysdig.com" -}}
    {{- else -}}
        {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
    {{- end -}}
{{- end -}}

{{/*
Determine sysdig secure endpoint based on provided region
*/}}
{{- define "secureUrl" -}}
    {{- if (or .Values.collectorSettings.collectorHost (eq .Values.global.sysdig.region "custom")) -}}
        {{- required "collectorSettings.collectorHost is required for custom regions" (.Values.collectorSettings.collectorHost) -}}
    {{- else if (eq .Values.global.sysdig.region "us1") -}}
        {{- "secure.sysdig.com" -}}
    {{- else if (eq .Values.global.sysdig.region "us2") -}}
        {{- "us2.app.sysdig.com/secure" -}}
    {{- else if (eq .Values.global.sysdig.region "us3") -}}
        {{- "app.us3.sysdig.com/secure" -}}
    {{- else if (eq .Values.global.sysdig.region "us4") -}}
        {{- "app.us4.sysdig.com/secure" -}}
    {{- else if (eq .Values.global.sysdig.region "eu1") -}}
        {{- "eu1.app.sysdig.com/secure" -}}
    {{- else if (eq .Values.global.sysdig.region "au1") -}}
        {{- "app.au1.sysdig.com/secure" -}}
    {{- else -}}
        {{- fail (printf "global.sysdig.region=%s provided is not recognized." .Values.global.sysdig.region ) -}}
    {{- end -}}
{{- end -}}

{{/*
Agent agentConfigmapName
*/}}
{{- define "agent.configmapName" -}}
    {{- default .Values.global.agentConfigmapName | default "sysdig-agent" -}}
{{- end -}}

{{/*
Deploy on GKE autopilot
*/}}
{{- define "agent.gke.autopilot" -}}
    {{- if (or .Values.global.gke.autopilot .Values.gke.autopilot) }}
        true
    {{- end -}}
{{- end -}}

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

{{/*
Determine Sysdig Secure features that need to be enabled/disabled

For secure.enabled=true, only security.enabled is set to true
For secure.enabled=false, disable all secure features
Set k8s_audit_server_enabled to the provided value for auditLog.enabled

The logic behind enabling only security.enabled when secure.enabled=true is
that we can then rely on the agent's defualts, or a backend push to enable
the features the customer needs. However, when the user requests
secure.enabled=false we need to explicitly put those config entires in the
agent config to prevent a backend push from enabling them after installation.
*/}}
{{- define "agent.secureFeatures" }}
    {{- $secureEnabled := ternary false .root.Values.secure.enabled (eq .force_secure_disabled true) }}
    {{- $secureBlockConfig := dict "security" (dict
        "enabled" $secureEnabled
        "k8s_audit_server_enabled" .root.Values.auditLog.enabled) }}
    {{- if .root.Values.auditLog.enabled }}
        {{- range $key, $val := (dict
                 "k8s_audit_server_url" .root.Values.auditLog.auditServerUrl
                 "k8s_audit_server_port" .root.Values.auditLog.auditServerPort) }}
            {{- $_ := set $secureBlockConfig.security $key $val }}
        {{- end }}
    {{- end }}
    {{- if not $secureEnabled }}
        {{- range $secureFeature := (list
            "commandlines_capture"
            "drift_killer"
            "falcobaseline"
            "memdump"
            "network_topology"
            "secure_audit_streams") }}
            {{- $_ := set $secureBlockConfig $secureFeature (dict "enabled" false) }}
        {{- end }}
    {{- end }}
    {{- toYaml $secureBlockConfig }}
{{- end }}

{{ define "agent.k8sColdStart" }}
    {{- $k8sColdStartBlock := dict }}
    {{- if .Values.leaderelection.enable }}
        {{- range $key, $val := (dict "enabled" true
                                      "enforce_leader_election" true
                                      "namespace" (include "agent.namespace" .)) }}
            {{- $_ := set $k8sColdStartBlock $key $val }}
        {{- end }}
    {{- end }}
    {{- if not .Values.sysdig.settings.k8s_coldstart }}
        {{- if not .Values.delegatedAgentDeployment.enabled }}
            {{- $_ := set $k8sColdStartBlock "max_parallel_cold_starts" (include "agent.parallelStarts" . | int ) }}
        {{- else }}
            {{- $_ := set $k8sColdStartBlock "max_parallel_cold_starts" 1 }}
        {{- end }}
    {{- end }}
    {{- $completeBlock := dict "k8s_coldstart" $k8sColdStartBlock }}
    {{- toYaml $completeBlock }}
{{- end }}

{{ define "agent.connectionSettings" }}
{{- $collectorHost := include "get_if_not_in_settings" (dict "root" . "default" (include "agent.collectorEndpoint" .) "setting" "collector") }}
{{- if $collectorHost }}
collector: {{ $collectorHost }}
{{- end }}
{{- $collectorPort := include "get_if_not_in_settings" (dict "root" . "default" .Values.collectorSettings.collectorPort "setting" "collector_port")}}
{{- if $collectorPort }}
collector_port: {{ $collectorPort }}
{{- end }}
{{- $ssl := include "get_if_not_in_settings" (dict "root" . "default" .Values.collectorSettings.ssl "setting" "ssl")}}
{{- if $ssl }}
ssl: {{ $ssl }}
{{- end }}
{{- $sslVerifyCertificate := include "get_if_not_in_settings" (dict "root" . "default" .Values.collectorSettings.sslVerifyCertificate "setting" "ssl_verify_certificate")}}
{{- if $sslVerifyCertificate }}
ssl_verify_certificate: {{ $sslVerifyCertificate }}
{{- end }}
{{- end }}

{{ define "agent.logSettings" }}
{{/* check for log level sanity and skip this check if delegatedAgentDeployment
     is enabled because this will be run twice and the second check will error out. */}}
{{- if and .Values.logPriority
            (or (hasKey (default dict .Values.sysdig.settings.log) "console_priority") (hasKey (default dict .Values.sysdig.settings.log) "file_priority"))
            (not .Values.delegatedAgentDeployment.enabled) }}
  {{- fail "Cannot set logPriority when either sysdig.settings.log.console_priority or sysdig.settings.log.file_priority are set" }}
{{- end }}
{{- if .Values.logPriority }}
  {{- $_ := merge .Values.sysdig.settings (dict "log" (dict "console_priority" .Values.logPriority "file_priority" .Values.logPriority)) }}
{{- end }}
{{- end }}

{{ define "agent.containerProxyEnvVars" }}
{{- if (.Values.proxy.httpProxy | default .Values.global.proxy.httpProxy) }}
- name: http_proxy
  value: {{ .Values.proxy.httpProxy | default .Values.global.proxy.httpProxy }}
{{- end }}
{{- if (.Values.proxy.httpsProxy | default .Values.global.proxy.httpsProxy) }}
- name: https_proxy
  value: {{ .Values.proxy.httpsProxy | default .Values.global.proxy.httpsProxy }}
{{- end }}
{{- if (.Values.proxy.noProxy | default .Values.global.proxy.noProxy) }}
- name: no_proxy
  value: {{ .Values.proxy.noProxy | default .Values.global.proxy.noProxy }}
{{- end }}
{{- end }}

{{ define "agent.clusterName" }}
{{- $clusterName := include "get_if_not_in_settings" (dict "root" . "default" (coalesce .Values.clusterName .Values.global.clusterConfig.name) "setting" "k8s_cluster_name") }}
{{- if $clusterName }}
k8s_cluster_name: {{ $clusterName }}
{{- end }}
{{- end }}

{{- define "agent.disableCaptures" }}
{{- $disableCaptures := include "get_if_not_in_settings" (dict "root" . "default" .Values.sysdig.disableCaptures "setting" "sysdig_capture_enabled") }}
{{- if eq $disableCaptures "true" }}
sysdig_capture_enabled: false
{{- end }}
{{- end }}
