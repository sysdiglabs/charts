# Shield

[{{ .Project.Name }}]({{ .Project.URL }}).
<br/>{{ .Project.Description }}

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
cluster_config:
  name: <your-cluster-name>

sysdig_endpoint:
  access_key: <your-access-key>
  api_url: <your-api-url>
  collector:
    host: <your-collector-hostname>
    port: <your-collector-port>
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
{{- end -}}
