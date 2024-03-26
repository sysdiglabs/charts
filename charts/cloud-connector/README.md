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

This chart deploys Sysdig Cloud Connector on your Kubernetes cluster, enabling Threat Detection and Image Scanning for the  AWS, GCP, and Azure Cloud providers.


Use [Cloud Connector](https://docs.sysdig.com/en/docs/installation/sysdig-secure-for-cloud/) only if your Sysdig representative recommends it to you. For the official installation instruction, see [Install Sysdig Secure for Cloud ](https://docs.sysdig.com/en/docs/installation/sysdig-secure-for-cloud/).


### Prerequisites


- Helm v3.6
- Sysdig Secure API Token

###  Installation

To install the chart:

```console
helm repo add sysdig https://charts.sysdig.com
helm repo update
helm upgrade --install cloud-connector sysdig/cloud-connector \
     --create-namespace -n cloud-connector --version=0.8.8  \
     --set sysdig.secureAPIToken=<SECURE_API_TOKEN>
```

The command deploys the Sysdig Cloud Connector on the Kubernetes cluster with the default configuration. The [configuration](#configuration) section lists the additional parameters that can be configured during installation.

> **Tip**: Use `helm list -A` to list all the releases.


## Configuration

You can use the Helm chart to update the default Cloud Connector configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command.

For example:

```bash
helm upgrade --install cloud-connector sysdig/cloud-connector \
     --create-namespace -n cloud-connector --version=0.8.8  \
     --set sysdig.secureAPIToken=<SECURE_API_TOKEN>
```

### Using values.yaml

The `values.yaml` file specifies the values for the agent configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

For example:

```bash
helm upgrade --install cloud-connector sysdig/cloud-connector \
     --create-namespace -n cloud-connector --version=0.8.8  \
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

## Configuration Parameters

The following table lists the configurable parameters of the `cloud-connector` chart and their default values.

|                Parameter                |                                                          Description                                                           |                                                 Default                                                  |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| replicaCount                            | The number of replicas for the Cloud Connector.                                                                                | <code>1</code>                                                                                           |
| image.repository                        | Sets the image repository to pull from.                                                                                        | <code>quay.io/sysdig/cloud-connector</code>                                                              |
| image.pullPolicy                        | Sets the image pull policy.                                                                                                    | <code>IfNotPresent</code>                                                                                |
| image.tag                               | Sets the image tag. Immutable tags are recommended. Overrides the image tag whose default is the chart appVersion.             | <code></code>                                                                                            |
| imagePullSecrets                        | Specifies the image pull secrets.                                                                                              | <code>[]</code>                                                                                          |
| nameOverride                            | Specifies the chart name override.                                                                                             | <code>""</code>                                                                                          |
| fullnameOverride                        | Specifies the chart full name override.                                                                                        | <code>""</code>                                                                                          |
| serviceAccount.create                   | Creates the service account.                                                                                                   | <code>true</code>                                                                                        |
| serviceAccount.annotations              | Specifies the additional annotations for serviceAccount.                                                                       | <code>{}</code>                                                                                          |
| serviceAccount.name                     | Sets the name of the service account to use. If not set and create is `true`, a name is generated using the fullname template. | <code>""</code>                                                                                          |
| podAnnotations                          | Pod annotations                                                                                                                | <code>{"prometheus.io/path":"/metrics","prometheus.io/port":"5000","prometheus.io/scrape":"true"}</code> |
| podSecurityContext                      | Enables deployment PSPs.                                                                                                       | <code>{}</code>                                                                                          |
| securityContext                         | Enables securityContext.                                                                                                       | <code>{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true}</code>         |
| service.type                            | Uses this type as a service.                                                                                                   | <code>ClusterIP</code>                                                                                   |
| service.port                            | Enables the port for the service.                                                                                              | <code>80</code>                                                                                          |
| service.labels                          | Specifies the additional labels for the service.                                                                               | <code>{}</code>                                                                                          |
| resources                               | Enables resource requests and limits.                                                                                          | <code>{}</code>                                                                                          |
| nodeSelector                            | Enables nodeSelector for scheduling.                                                                                           | <code>{}</code>                                                                                          |
| tolerations                             | Sets tolerations for scheduling.                                                                                               | <code>[]</code>                                                                                          |
| affinity                                | Enables affinity rules.                                                                                                        | <code>{}</code>                                                                                          |
| telemetryDeploymentMethod               | Enables deployment source for inner telemetry.                                                                                 | <code>"helm"</code>                                                                                      |
| extraEnvVars                            | Specifies additional environment variables to be set.                                                                          | <code>[]</code>                                                                                          |
| aws.accessKeyId                         | Specifies the AWS Credentials AccessKeyID.                                                                                     | <code>""</code>                                                                                          |
| aws.secretAccessKey                     | Specifies the AWS Credentials: `SecretAccessKey`.                                                                              | <code>""</code>                                                                                          |
| aws.region                              | Specifies the AWS Region.                                                                                                      | <code>""</code>                                                                                          |
| gcpCredentials                          | Specifies the GCP credentials in JSON.                                                                                         | <code>""</code>                                                                                          |
| azure.eventHubConnectionString          | Specifies the Azure EventHub connection string.                                                                                | <code>""</code>                                                                                          |
| azure.eventGridEventHubConnectionString | Specifies the Azure Event Grid EventHub connection string.                                                                     | <code>""</code>                                                                                          |
| azure.tenantId                          | Specifies the Azure service principal tenant ID.                                                                               | <code>""</code>                                                                                          |
| azure.clientId                          | Specifies the Azure service principal client ID.                                                                               | <code>""</code>                                                                                          |
| azure.clientSecret                      | Specifies the Azure service principal client secret.                                                                           | <code>""</code>                                                                                          |
| azure.region                            | Specifies the Azure region.                                                                                                    | <code>""</code>                                                                                          |
| sysdig.url                              | Specifies the Sysdig Secure URL.                                                                                               | <code>"https://secure.sysdig.com"</code>                                                                 |
| sysdig.secureAPIToken                   | Specifies the API Token to access Sysdig Secure.                                                                               | <code>""</code>                                                                                          |
| sysdig.verifySSL                        | Verifies the SSL certificate.                                                                                                  | <code>true</code>                                                                                        |
| existingSecretName                      | Provides an existing secret name for the entries it uses. See `templates/secret.yaml` for more information.                    | <code>""</code>                                                                                          |
| rules                                   | Specifies the Rules Section for Cloud Connector.                                                                               | <code>[]</code>                                                                                          |
| ingestors                               | Specifies configuration for the threat detection event ingestion. See [ingestors](#ingestors) for more information.            | <code>[]</code>                                                                                          |
| scanners                                | Specifies configuration for scanning capabilities. See [scanners](#scanners) for more information.                             | <code>[]</code>                                                                                          |
| bruteForceDetection.enabled             | Enables Brute Force detection.                                                                                                 | <code>true</code>                                                                                        |
| bruteForceDetection.duration            | Specifies a time window for a bruteforce attack try.                                                                           | <code>24h</code>                                                                                         |
| bruteForceDetection.maximumTries        | Specifies the maximum number of tries for a given time window.                                                                 | <code>10</code>                                                                                          |


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

To uninstall the `cloud-connector`:

```console
$ helm uninstall cloud-connector -n cloud-connector
```

The command removes all the Kubernetes components associated with the chart and deletes the release artifacts.




<!--
Q: Helm v2 usage
should work with minor changes
1. Removed the option "--create-namespace" since not supported in v2. I don't see particular problem in creating the namespace manually before the execution of the chart
2. Added "--name" since required by v2 to specify the chart name
3. Changed Chart.yaml apiVersion: from v2 to v1. It seems that the difference is only related to dependencies and types, and I didn't find any of those in the chart (by default chats are considered as apps)
-->
