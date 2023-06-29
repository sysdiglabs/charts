<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Cloud Connector

[{{ .Project.Name }}]({{ .Project.URL }}) - {{ .Project.Description }}

## TL;DR;

```
$ helm repo add {{ .Repository.Name }} {{ .Repository.URL }}
$ helm repo update
$ helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```

- [Configuration](#configuration)
- [Configuration Detail](#configuration-detail)
- [Usage examples](#usage-examples)
- [Troubleshooting](#troubleshooting)


## Introduction

This chart deploys {{ .Project.App }} on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager
to enable threat-detection and image scanning capabilities for the main three providers: AWS, GCP and Azure.

### Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}

###  Installing the Chart

To install the chart with the release name `{{ .Release.Name }}`:

```console
$ helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }}
```

The command deploys {{ .Project.App }} on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list -A`


### Uninstalling the Chart

To uninstall/delete the `{{ .Release.Name }}`:

```console
$ helm uninstall {{ .Release.Name }} -n {{ .Release.Namespace }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

### Verify the integrity and origin
Sysdig Helm Charts are signed so users can verify the integrity and origin of each chart, the steps are as follows:

#### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

#### Verify the chart

To check the integrity and the origin of the charts you can now append the `--verify` flag to the `install`, `upgrade` and `pull` helm commands.

{{ if .Chart.Values -}}

## Configuration

The following table lists the configurable parameters of the `{{ .Chart.Name }}` chart and their default values.

{{ .Chart.Values }}

Specify each parameter using the **`--set key=value[,key=value]`** argument to `helm upgrade --install`. For example:

```console
$ helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} \
    --set {{ .Chart.ValuesExample }}
```

**Alternatively, a YAML file** that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} \
    --values values.yaml
```

## Examples
- [Default `values.yaml`](./values.yaml)

{{- end }}

## Configuration Detail

### Ingestors

Where to ingest events from

```yaml
ingestors:
#  - aws-cloudtrail-sns-sqs: # Receives CloudTrail events from an SQS queue using the SNS paylaod
#      queueURL:
#      assumeRole: # organizational usage, assumeRole to fetch S3 elements
#      concurrentDownloads: 4
#
#  - aws-cloudtrail-s3-sns-sqs: # Receives CloudTrail events using s3 events as triggers
#      queueURL:
#      assumeRole: # organizational usage, assumeRole to fetch S3 elements
#      concurrentDownloads: 4
#
#  - eks: # Enables K8s audit log for EKS clusters
#      cluster: # EKS cluster name to secure
#      interval: 60s
#      tags:
#
#  - gcp-auditlog: # Polls for GCP auditlog events from StackDriver API
#      project:
#      interval: 90s
#
#  - gcp-auditlog-pubsub: # Receives GCP AuditLog from a PubSub topic
#      project:
#      subscription:
#
#  - gcp-gcr-pubsub: # Receives GCP GCR from a PubSub topic
#      project:
#      subscription:
#
#  - gcp-auditlog-pubsub-http: # Receives GCP AuditLog from a PubSub topic streamed over an HTTP Endpoint
#      url:
#
#  - gcp-gcr-pubsub-http: # Receives GCR events from a PubSub topic streamed over an HTTP Endpoint
#      url:
#
#  - azure-event-hub:
#      subscriptionID: 00000000-1111-2222-3333-444444444444
#
#  - azure-event-grid:
#      subscriptionID: 00000000-1111-2222-3333-444444444444

```


### Scanners

Trigger scanners when a new image is detected

```yaml
scanners:
#  - gcp-gcr: # Scan images when a new image is pushed to GCP GCR
#      project:
#      secureAPITokenSecretName:
#      serviceAccount:
#
#  - gcp-cloud-run: # Scan images when a new image is detected from GCP CloudRun
#    project:
#      secureAPITokenSecretName:
#      serviceAccount:
#
#  - aws-ecr: # Scan images when a new image is pushed to AWS ECR
#      codeBuildProject:
#      secureAPITokenSecretName:
#      masterOrganizationRole:
#      organizationRolePerAccount:
#
#  - aws-ecs: # Scan images when a new image is detected in a ECS cluster
#      codeBuildProject:
#      secureAPITokenSecretName:
#      masterOrganizationRole:
#      organizationRolePerAccount:
#
#  - azure-acr: {} # Scan images when a new image is pushed to Azure container registry
#
#  - azure-aci: # Scan images when a new image is detected in container instance group
#      subscriptionID: 00000000-1111-2222-3333-444444444444
#      resourceGroup: sfc-resourcegroup # resource group of azure container registry
#      containerRegistry: sfccontainerregistry # container registry name where to run the scan
```

### Usage examples

Check live examples present in our different Terraform Modules:

* [Single Account Deployment for AWS in K8s](https://github.com/sysdiglabs/terraform-aws-secure-for-cloud/blob/master/examples/single-account-k8s/cloud-connector.tf#L27)
* [Single Project Deployment for GCP in K8s](https://github.com/sysdiglabs/terraform-google-secure-for-cloud/blob/master/examples/single-project-k8s/cloud-connector.tf#L32)
* [Single Subscription Deployment for Azure in K8s](https://github.com/sysdiglabs/terraform-azurerm-secure-for-cloud/blob/master/examples/single-subscription-k8s/cloud-connector.tf#L1)


### Troubleshooting

#### Q: How do I enable `debug` logs?
A: By editing the configmap and killing pod(s)/deployment so it restart
```yaml
  data:
    cloud-connector.yaml: |
  <    logging: info
  >    logging: debug
```



<!--
Q: Helm v2 usage
should work with minor changes
1. Removed the option "--create-namespace" since not supported in v2. I don't see particular problem in creating the namespace manually before the execution of the chart
2. Added "--name" since required by v2 to specify the chart name
3. Changed Chart.yaml apiVersion: from v2 to v1. It seems that the difference is only related to dependencies and types, and I didn't find any of those in the chart (by default chats are considered as apps)
-->
