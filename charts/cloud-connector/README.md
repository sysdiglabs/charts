<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Cloud Connector

[Cloud Connector](https://docs.sysdig.com/en/docs/installation/sysdig-secure-for-cloud/) - This chart deploys the Sysdig Cloud connector on your Kubernetes cluster to enable threat-detection and image scanning.


## TL;DR;

```
$ helm repo add sysdig https://charts.sysdig.com
$ helm repo update
$ helm upgrade --install cloud-connector sysdig/cloud-connector \
      --create-namespace -n cloud-connector --version=0.7.24  \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```

- [Configuration](#configuration)
- [Configuration Detail](#configuration-detail)
- [Usage examples](#usage-examples)
- [Troubleshooting](#troubleshooting)


## Introduction

This chart deploys the Sysdig Cloud Connector on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager
to enable threat-detection and image scanning capabilities for the main three providers: AWS, GCP and Azure.

### Prerequisites

- Helm 3
- Sysdig Secure API Token

###  Installing the Chart

To install the chart with the release name `cloud-connector`:

```console
$ helm upgrade --install cloud-connector sysdig/cloud-connector -n cloud-connector --version=0.7.24
```

The command deploys the Sysdig Cloud Connector on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list -A`


### Uninstalling the Chart

To uninstall/delete the `cloud-connector`:

```console
$ helm uninstall cloud-connector -n cloud-connector
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `cloud-connector` chart and their default values.

|                Parameter                |                                                      Description                                                       |                                                 Default                                                  |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| replicaCount                            | Amount of replicas for Cloud Connector                                                                                 | <code>1</code>                                                                                           |
| image.repository                        | The image repository to pull from.                                                                                     | <code>quay.io/sysdig/cloud-connector</code>                                                              |
| image.pullPolicy                        | The image pull policy.                                                                                                 | <code>IfNotPresent</code>                                                                                |
| image.tag                               | The image tag (immutable tags are recommended). Overrides the image tag whose default is the chart appVersion.         | <code></code>                                                                                            |
| imagePullSecrets                        | The image pull secrets                                                                                                 | <code>[]</code>                                                                                          |
| nameOverride                            | Chart name override                                                                                                    | <code>""</code>                                                                                          |
| fullnameOverride                        | Chart full name override                                                                                               | <code>""</code>                                                                                          |
| serviceAccount.create                   | Create the service account                                                                                             | <code>true</code>                                                                                        |
| serviceAccount.annotations              | Extra annotations for serviceAccount                                                                                   | <code>{}</code>                                                                                          |
| serviceAccount.name                     | The name of the service account to use. If not set and create is true, a name is generated using the fullname template | <code>""</code>                                                                                          |
| podAnnotations                          | Pod annotations                                                                                                        | <code>{"prometheus.io/path":"/metrics","prometheus.io/port":"5000","prometheus.io/scrape":"true"}</code> |
| podSecurityContext                      | Configure deployment PSP's                                                                                             | <code>{}</code>                                                                                          |
| securityContext                         | Configure securityContext                                                                                              | <code>{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true}</code>         |
| service.type                            | Use this type as service                                                                                               | <code>ClusterIP</code>                                                                                   |
| service.port                            | Configure port for the service                                                                                         | <code>80</code>                                                                                          |
| service.labels                          | Additional labels to specify for the service                                                                           | <code>{}</code>                                                                                          |
| resources                               | Configure resource requests and limits                                                                                 | <code>{}</code>                                                                                          |
| nodeSelector                            | Configure nodeSelector for scheduling                                                                                  | <code>{}</code>                                                                                          |
| tolerations                             | Tolerations for scheduling                                                                                             | <code>[]</code>                                                                                          |
| affinity                                | Configure affinity rules                                                                                               | <code>{}</code>                                                                                          |
| telemetryDeploymentMethod               | Configure deployment source for inner telemetry                                                                        | <code>"helm"</code>                                                                                      |
| extraEnvVars                            | Extra environment variables to be set                                                                                  | <code>[]</code>                                                                                          |
| aws.accessKeyId                         | AWS Credentials AccessKeyID                                                                                            | <code>""</code>                                                                                          |
| aws.secretAccessKey                     | AWS Credentials: SecretAccessKey                                                                                       | <code>""</code>                                                                                          |
| aws.region                              | AWS Region                                                                                                             | <code>""</code>                                                                                          |
| gcpCredentials                          | GCP Credentials JSON                                                                                                   | <code>""</code>                                                                                          |
| azure.eventHubConnectionString          | Azure EventHub Connection String                                                                                       | <code>""</code>                                                                                          |
| azure.eventGridEventHubConnectionString | Azure Event Grid EventHub Connection String                                                                            | <code>""</code>                                                                                          |
| azure.tenantId                          | Azure service principal tenant id                                                                                      | <code>""</code>                                                                                          |
| azure.clientId                          | Azure service principal client id                                                                                      | <code>""</code>                                                                                          |
| azure.clientSecret                      | Azure service principal client secret                                                                                  | <code>""</code>                                                                                          |
| azure.region                            | Azure region                                                                                                           | <code>""</code>                                                                                          |
| sysdig.url                              | Sysdig Secure URL                                                                                                      | <code>"https://secure.sysdig.com"</code>                                                                 |
| sysdig.secureAPIToken                   | API Token to access Sysdig Secure                                                                                      | <code>""</code>                                                                                          |
| sysdig.verifySSL                        | Verify SSL certificate                                                                                                 | <code>true</code>                                                                                        |
| existingSecretName                      | Provide an existing secret name (see details in 'templates/secret.yaml') for the entries it uses.                      | <code>""</code>                                                                                          |
| rules                                   | Rules Section for Cloud Connector                                                                                      | <code>[]</code>                                                                                          |
| ingestors                               | Thread-Detection event ingestion configuration ([config](#ingestors))                                                  | <code>[]</code>                                                                                          |
| scanners                                | Scanning capabilities configuration ([config](#scanners))                                                              | <code>[]</code>                                                                                          |
| bruteForceDetection.enabled             | Enable Brute Force detection                                                                                           | <code>true</code>                                                                                        |
| bruteForceDetection.duration            | Time window for a bruteforce attack try                                                                                | <code>24h</code>                                                                                         |
| bruteForceDetection.maximumTries        | Maximum number of tries for given time window                                                                          | <code>10</code>                                                                                          |


Specify each parameter using the **`--set key=value[,key=value]`** argument to `helm upgrade --install`. For example:

```console
$ helm upgrade --install cloud-connector sysdig/cloud-connector \
    --create-namespace -n cloud-connector --version=0.7.24 \
    --set sysdig.secureAPIToken=YOUR-KEY-HERE
```

**Alternatively, a YAML file** that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm upgrade --install cloud-connector sysdig/cloud-connector \
    --create-namespace -n cloud-connector --version=0.7.24 \
    --values values.yaml
```

## Examples
- [Default `values.yaml`](./values.yaml)

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
