<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Cloud Connector

## Overview

{{ .Project.Description }}

Use [{{ .Project.Name }}]({{ .Project.URL }}) only if your Sysdig representative recommends it to you. For the official installation instruction, see [Install Sysdig Secure for Cloud ](https://docs.sysdig.com/en/docs/installation/sysdig-secure-for-cloud/).


### Prerequisites

{{ range .Prerequisites }}
- {{ . }}
{{- end }}

###  Installation

To install the chart:

```console
helm repo add sysdig https://charts.sysdig.com
helm repo update
helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
     --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
     --set sysdig.secureAPIToken=<SECURE_API_TOKEN>
```

The command deploys {{ .Project.App }} on the Kubernetes cluster with the default configuration. The [configuration](#configuration) section lists the additional parameters that can be configured during installation.

> **Tip**: Use `helm list -A` to list all the releases.


## Configuration

You can use the Helm chart to update the default Cloud Connector configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command.

For example:

```bash
helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
     --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
     --set sysdig.secureAPIToken=<SECURE_API_TOKEN>
```

#### Setting Arrays

Both [ingestors](#ingestors) and [scanners](#scanners) configurations expect an array structure. When setting values for these configurations, ensure that this array structure in is reflected in your key-value pairs.

For instance, to set values for the first element of the ingestors array, use the [0] index:

```bash
--set 'ingestors[0].azure-event-hub.subscriptionID=<SUBSCRIPTION_ID>'
```
Omitting the index causes Helm to interpret the setting as a plain map, leading to errors.

### Using values.yaml

The `values.yaml` file specifies the values for the agent configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

For example:

```bash
helm upgrade --install {{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
     --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
    --values values.yaml
```

See the default [`values.yaml`](./values.yaml) file for more information.

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

## Configuration Parameters

The following table lists the configurable parameters of the `{{ .Chart.Name }}` chart and their default values.

{{ .Chart.Values }}

{{- end }}

## Examples

### Ingestors

Specifies where to ingest the events:

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

Specifies the trigger scanners when a new image is detected:

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

### Usage Examples

See additional examples in the Terraform modules:

* [Single Account Deployment for AWS in K8s](https://github.com/sysdiglabs/terraform-aws-secure-for-cloud/blob/master/examples/single-account-k8s/cloud-connector.tf#L27)
* [Single Project Deployment for GCP in K8s](https://github.com/sysdiglabs/terraform-google-secure-for-cloud/blob/master/examples/single-project-k8s/cloud-connector.tf#L32)
* [Single Subscription Deployment for Azure in K8s](https://github.com/sysdiglabs/terraform-azurerm-secure-for-cloud/blob/master/examples/single-subscription-k8s/cloud-connector.tf#L1)


### Troubleshooting

#### Enable `debug` Logs

To enable `debug logs`, edit the ConfigMap and terminate the pod or deployment.

```yaml
  data:
    cloud-connector.yaml: |
  <    logging: info
  >    logging: debug
```

## Uninstall the Chart

To uninstall the `{{ .Release.Name }}`:

```console
$ helm uninstall {{ .Release.Name }} -n {{ .Release.Namespace }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release artifacts.




<!--
Q: Helm v2 usage
should work with minor changes
1. Removed the option "--create-namespace" since not supported in v2. I don't see particular problem in creating the namespace manually before the execution of the chart
2. Added "--name" since required by v2 to specify the chart name
3. Changed Chart.yaml apiVersion: from v2 to v1. It seems that the difference is only related to dependencies and types, and I didn't find any of those in the chart (by default chats are considered as apps)
-->
