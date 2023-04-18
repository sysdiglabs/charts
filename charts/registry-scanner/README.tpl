<!--


DO NOT MODIFY THIS FILE (README.md) MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Registry Scanner

{{ .Project.Name }} scan your images registry on a Kubernetes Cluster.
<br/>{{ .Project.Description }}

<br/>

- [Installing the Chart](#installing-the-chart)
- [Uninstalling the Chart](#uninstalling-the-chart)
- [Configuration](#configuration)

<br/>

## Introduction

This chart deploys {{ .Project.App }} on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


### Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}

## Installing the Chart

Add Sysdig Helm charts repository:

```bash
$ helm repo add {{ .Repository.Name }} {{ .Repository.URL }}
$ helm repo update
```

Deploy the registry scanner specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm upgrade --install {{ .Chart.Name }} \
    {{- with .Chart.Version }}
    --version={{.}} \
    {{- end }}
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.registryURL=<REGISTRY_URL> \
    --set config.registryUser=admin \
    --set config.registryPassword=<REGISTRY_PASSWORD> \
    sysdig/{{ .Chart.Name }}
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install {{ .Chart.Name }} -f values.yaml {{- with .Chart.Version }} --version={{.}} {{- end }} sysdig/{{ .Chart.Name }}
```


By default the created CronJob, scheduled at the default time: 6:00 am.
For testing purpose you can launch a manual job:

```bash
$ kubectl create job --from=cronjob/{{ .Chart.Name }} registry-scanner-manual
```


## Uninstalling the Chart

To uninstall/delete

```bash
$ helm uninstall {{ .Chart.Name }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

{{- if .Chart.Values }}

## Configuration

The following table lists the configurable parameters of the Sysdig Registry Scanner chart and their default values:

{{ .Chart.Values }}

{{- end }}


## Other Options

### I still want to use legacy scanning engine

Chart version `1.*` relies on new Vulnerability Management scanning engine.
<br/>If you still use the legacy scanning engine and want to keep running that version, pin the Helm chart version with  `--version=0.1.39`

### On-Prem deployment

Use the following command to deploy in an on-prem:

```bash
$ helm upgrade --install registry-scanner \
    {{- with .Chart.Version }}
    --version={{.}} \
    {{- end }}
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.secureSkipTLS=true \
    --set config.registryURL=<REGISTRY_URL> \
    --set config.registryUser=admin \
    --set config.registryPassword=<REGISTRY_PASSWORD> \
    sysdig/registry-scanner
```

Use `config.secureSkipTLS=true` if you are using self signed certificates.
