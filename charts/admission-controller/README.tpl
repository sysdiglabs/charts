# {{ .Project.ShortName }}

[{{ .Project.Name }}]({{ .Project.URL }}) - {{ .Project.Description }}

## TL;DR;

```console
$ helm repo add {{ .Repository.Name }} {{ .Repository.URL }}
$ helm repo update
$ helm install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }}
```

## Introduction

This chart deploys {{ .Project.App }} on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}

## Installing the Chart

To install the chart with the release name `{{ .Release.Name }}`:

```console
$ helm install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }}
```

The command deploys {{ .Project.App }} on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `{{ .Release.Name }}`:

```console
$ helm delete {{ .Release.Name }} -n {{ .Release.Namespace }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

{{ if .Chart.Values -}}
## Configuration

The following table lists the configurable parameters of the `{{ .Chart.Name }}` chart and their default values.

{{ .Chart.Values }}

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} --create-namespace -n {{ .Release.Namespace }} {{ with .Chart.Version }} --version={{.}}{{ end }} --set {{ .Chart.ValuesExample }}
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} --values values.yaml
```
{{- end }}


### Custom Admission Controller Rules to be detected
In case you don't want to detect some resources you can create your custom rules. To achieve this, you can change the **k8sAuditDetectionsRules**
variable in the _values.yaml_ file.
For example, if you want to filter out secrets from the AC you can try with these rules:]
```
- apiGroups:
  - ""
  apiVersions: [ "*" ]
  operations: [ "*" ]
  resources:
  - bindings
  - componentstatuses
  - configmaps
  - endpoints
  - events
  - limitranges
  - namespaces
  - nodes
  - persistentvolumeclaims
  - persistentvolumes
  - pods/*
  - podtemplates
  - replicationcontrollers
  - resourcequotas
  - serviceaccounts
  - services
  scope: "*"
- apiGroups:
  - apps
  - autoscaling
  - batch
  - networking.k8s.io
  - rbac.authorization.k8s.io
  - extensions
  apiVersions: [ "*" ]
  operations: [ "*" ]
  resources: [ "*/*" ]
  scope: "*"
```
### On Prem deployment

Use the following command to deploy in an on-prem:

```
$ helm install  --create-namespace -n {{ .Release.Namespace }} {{ .Release.Name }} \
                --set sysdig.url=SECURE_URL \
                --set sysdig.secureAPIToken=SECURE_API_TOKEN \
                --set clusterName=CLUSTER_NAME \
                --set verifySSL=false \
                {{ .Repository.Name }}/{{ .Chart.Name }}
```

Use `verifySSL=false` if you are using self signed certificates.
