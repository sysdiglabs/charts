# Chart: {{ .Project.Name }}

## Overview

Use the [sysdig-deploy](../sysdig-deploy/README.md) parent chart to deploy the {{ .Project.Name }} and any other subcomponents. Do not deploy subcharts directly.

To deploy the {{ .Project.Name }}, follow the installation instructions given on the Sysdig Documentation website:

### Sysdig Monitor

- [Installation Requirements](https://docs.sysdig.com/en/docs/installation/sysdig-monitor/install-sysdig-agent/#installation-requirements)
- [Installation Instructions](https://docs.sysdig.com/en/docs/installation/sysdig-monitor/install-sysdig-agent/kubernetes/)

### Sysdig Secure | Sysdig Secure + Sysdig Monitor

- [Component Overview](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/)
- [Installation Requirements](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/installation-requirements/sysdig-agent/)
- [Installation Instructions](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/kubernetes/)

### On-Premises

- [Install Sysdig Agent for a Sysdig On-Premises Deployment](https://docs.sysdig.com/en/docs/installation/on-premises/)
- [Install Sysdig Agent in an Airgapped Environment](https://docs.sysdig.com/en/docs/installation/on-premises/airgapped-installation/)

## Verify the Integrity and Origin

Sysdig Helm Charts are signed so you can verify the integrity and origin of each chart. To verify the chart:

### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "{{ .Repository.URL }}/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

### Verify the Chart

To check the integrity and the origin of the charts you can now append the `--verify` flag to the `install`, `upgrade`, and `pull` helm commands.

## Configuration

You can use the Helm chart to update the default agent configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command.

For example:

```bash
$ helm install --namespace {{ .Release.Namespace }} {{ .Release.Name }} \
    --set {{ .Chart.ValuesExample }} \
    {{ .Repository.Name }}/{{ .Chart.Name }}
```

### Using values.yaml

The `values.yaml` file specifies the values for the agent configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

For example, to enable Prometheus metrics scraping:

1. Add the following to the `values.yaml` file:

   ```yaml
   sysdig:
     accessKey: <YOUR-ACCESS-KEY>
     settings:
       prometheus:
         enabled: true
         histograms: true
   ```

   **Tip**: You can use the default [values.yaml](values.yaml) file.

2. Run the following:

   ```
   helm install --namespace {{ .Release.Namespace }} {{ .Release.Name }} -f values.yaml {{ .Repository.Name}}/{{ .Chart.Name }}
   ```

## Configuration Parameters

The following table lists the configurable parameters of the Sysdig chart and their default values.

{{ .Chart.Values }}
