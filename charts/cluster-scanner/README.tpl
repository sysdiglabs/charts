<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Cluster Scanner - [Controlled Availability]

[{{ .Project.Name }}]({{ .Project.URL }}) features Runtime Image scanning on Kubernetes.
<br/>{{ .Project.Description }}

**NOTE: {{ .Project.Name }} is released in Controlled Availability to selected customers. If you would like to use it, please contact your Sysdig Field Representative or our Support.**

## TL;DR;

```
$ helm repo add {{ .Repository.Name }} {{ .Repository.URL }}
$ helm repo update
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
      --set global.clusterConfig.name=CLUSTER_NAME \
      --set global.sysdig.region=SYSDIG_REGION \
      --set global.sysdig.accessKey=YOUR-KEY-HERE
```

- [Configuration](#configuration)
- [Usages](#usages)
- [Confirm Working Status](#confirm-working-status)
- [Troubleshooting](#troubleshooting)

<br/><br/>

## Introduction

This chart deploys {{ .Project.App }} as a Deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


### Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}


###  Installing the Chart

To install the chart with the release name `{{ .Release.Name }}`, run:

```console
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
       --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} \
       --set global.clusterConfig.name=CLUSTER_NAME \
       --set global.sysdig.region=SYSDIG_REGION \
       --set global.sysdig.accessKey=YOUR-KEY-HERE
```

To find the values:

- YOUR-KEY-HERE: This is the sysdig access key.
- CLUSTER_NAME: The name to be used for the cluster. Make sure it is unique for all your clusters.
- SYSDIG_REGION: The region of the Sysdig Backend to use. E.g.: `us1`, or `eu1`.

The command deploys {{ .Project.App }} on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`


### Uninstalling the Chart

To uninstall/delete the `{{ .Release.Name }}`:

```console
$ helm uninstall sysdig-{{ .Release.Name }} -n {{ .Release.Namespace }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

{{ if .Chart.Values -}}

## Configuration

The following table lists the configurable parameters of the `{{ .Chart.Name }}` chart and their default values.

{{ .Chart.Values }}

Specify each parameter using the **`--set key=value[,key=value]`** argument to `helm upgrade --install`. For example:

```console
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} \
    --set {{ .Chart.ValuesExample }}
```

**Alternatively, a YAML file** that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} \
    --values values.yaml
```

{{- end }}

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
make test
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.

## Troubleshooting

### Q: I need to troubleshoot, any way to switch to `debug` verbose?
A: If you used helm to install, you can edit the helm `values.yaml` to set `global.loggingLevel=DEBUG`
<br/>Alternatively, you can edit the webhook configmap - add the `logging_level=DEBUG` key-value and restart the scanner
```
    $ kubectl edit configmap -n {{ .Release.Namespace }} {{ .Release.Name }}
    $ kubectl rollout restart deployment -n {{ .Release.Namespace }} {{ .Release.Name }}
```
