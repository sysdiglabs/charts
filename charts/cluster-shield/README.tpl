<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Cluster Shield

[{{ .Project.Name }}]({{ .Project.URL }}).
<br/>{{ .Project.Description }}

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

To install the chart  create a `values.yaml` file. Set your values and decide which features you would like to enable.
```yaml
cluster_shield:
    cluster_config:
        name: <your-cluster-name>
    features:
        admission_control:
            enabled: true
        audit:
            enabled: true
        container_vulnerability_management:
            enabled: true
        posture:
            enabled: true
    sysdig_endpoint:
        api_url: <your-api-url>
        secure_api_token: <your-secure-api-token>
        access_key: <your-access-key>
```

Then, to install it with the release name `{{ .Release.Name }}`, run:

```console
$ helm upgrade --install --atomic --create-namespace \
    -n {{ .Release.Namespace }} \
    -f values.yaml \
    {{ .Release.Name }} \
    {{ .Repository.Name }}/{{ .Chart.Name }}
```

The command deploys {{ .Project.App }} on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

### Uninstalling the Chart

To uninstall/delete the `{{ .Release.Name }}`:

```console
$ helm uninstall {{ .Release.Name }} -n {{ .Release.Namespace }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

{{ if .Chart.Values -}}

## Configuration

The following table lists the configurable parameters of the `{{ .Chart.Name }}` chart and their default values.

{{ .Chart.Values }}

{{- end }}

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
make test
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.
