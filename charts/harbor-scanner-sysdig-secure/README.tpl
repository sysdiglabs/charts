<!--
TODO: Correct content is now in README.md, being refactories. We will copy back to README.tpl once finished

DO NOT MODIFY README.md MANUALLY!! CHANGE README.tpl instead!!

README.md IS AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# {{ .Project.App }}

This chart deploys the [Harbor Scanner Adapter](https://github.com/sysdiglabs/harbor-scanner-sysdig-secure) for Sysdig Secure on your Kubernetes cluster.

## Prerequisites

- Helm 3
- [Sysdig Secure API Token](https://docs.sysdig.com/en/docs/administration/administration-settings/user-profile-and-password/retrieve-the-sysdig-api-token/)

## Installation

To install the chart:

```console
helm repo add {{ .Repository.Name }} {{ .Repository.URL }}
helm repo update
helm install {{ .Release.Name }} --namespace {{ .Release.Name }} --create-namespace -f values.yaml {{ .Repository.Name }}/{{ .Chart.Name }}
```

## Verify the integrity and origin
Sysdig Helm Charts are signed so users can verify the integrity and origin of each chart, the steps are as follows:

### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

### Verify the chart

To check the integrity and the origin of the charts you can now append the `--verify` flag to the `install`, `upgrade` and `pull` helm commands.

## Configuration

You can use the Helm chart to update the default agent configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command.

For example:

```bash
helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
    --set sysdig.secure.apiToken=<SECURE-API-TOKEN>
```

### Using values.yaml

The `values.yaml` file specifies the values for the admission controller configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

For example:

```bash
helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
     --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
    --values values.yaml

```

See the default [`values.yaml`](./values.yaml) file for more information.


## Configuration Parameters

The following table lists the configurable parameters of the `{{ .Chart.Name }}` chart and their default values.

{{ .Chart.Values }}
