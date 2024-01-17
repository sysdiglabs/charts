<!--
TODO: Correct content is now in README.md, being refactories. We will copy back to README.tpl once finished

DO NOT MODIFY README.md MANUALLY!! CHANGE README.tpl instead!!

README.md IS AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->


# Admission Controller

This chart deploys {{ .Project.App }} on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Overview

[{{ .Project.Name }}]({{ .Project.URL }}) provides Audit Logging and optional Image Scanning capabilities to secure your Kubernetes environment.

Use the [sysdig-deploy](../sysdig-deploy/README.md) parent chart to deploy the Admission Controller and any other subcomponents. Do not deploy subcharts directly.

To deploy the Admission Controller, follow the installation instructions given in  [Install Kubernetes Audit Logging](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/kubernetes/install-kubernetes-audit-logging/).

## Use Cases

### Kubernetes Audit Logging

This chart is primarily responsible for enabling Kubernetes audit logging so that Sysdig Secure can audit the following:

- Creation and destruction of pods, services, deployments, and DaemonSets.
- Creating, updating, and removing ConfigMaps or secrets.
- Attempts at subscribing to the changes to any endpoint.

For deployment instructions, including common deployment configurations related to proxies and certificates, see [Install Kubernetes Audit Logging](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/kubernetes/install-kubernetes-audit-logging/).

### (Legacy Option) Image Scanning Using Scanning Engine V1

If you use the [Legacy Scanning Engine](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/) instead of the new Vulnerability Management engine in Sysdig Secure, you can [deploy the `admission-controller` chart](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/admission-controller/#installation) with old scanning options enabled and use [admission controller policies](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/admission-controller/#create-admission-controller-policies) to reject container images that do not fulfill the policy requirements from the cluster before being scheduled.

This option is enabled by default unless you specify  `--scanner.enabled=false` .


## Verify the Integrity and Origin

Sysdig Helm charts are signed so you can confirm the integrity and origin of each chart. To do so:

1. Import the Public Key:

   ```bash
   $ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
   $ gpg --import /tmp/sysdig_public.gpg
   ```

2. Verify the chart by appending the `--verify` flag to the `install`, `upgrade`, and `pull` helm commands.


## Configuration

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command.

For example:

```bash
helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
    --set sysdig.secureAPIToken=YOUR-KEY-HERE,clusterName=YOUR-CLUSTER-NAME
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


## Examples
- [Default `values.yaml`](https://github.com/sysdiglabs/charts/blob/main/charts/admission-controller/values.yaml)
- Find some [examples of these values](https://github.com/sysdiglabs/charts/tree/main/charts/admission-controller/ci)


<!--
Q: Helm v2 usage
should work with minor changes
1. Removed the option "--create-namespace" since not supported in v2. I don't see particular problem in creating the namespace manually before the execution of the chart
2. Added "--name" since required by v2 to specify the chart name
3. Changed Chart.yaml apiVersion: from v2 to v1. It seems that the difference is only related to dependencies and types, and I didn't find any of those in the chart (by default chats are considered as apps)
-->
