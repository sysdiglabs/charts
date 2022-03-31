# Cloud Connector

This chart deploys the Sysdig Cloud connector on your Kubernetes cluster to enable threat-detection and image scanning
capabilities for the main three providers; AWS, GCP and Azure

## Installing the Chart

Add Sysdig Helm charts repository and deploy the chart:

```
$ helm repo add sysdig https://charts.sysdig.com

$ helm install --create-namespace -n cloud-connector cloud-connector -f values.yaml sysdig/cloud-connector
```

## Configuration

The following table lists the configurable parameters of the Sysdig Cloud connector
chart and their default values:

| Parameter                        | Description                                                                                                     | Default                                                                         |
| -------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `replicaCount`                   | Amount of replicas for Cloud Connector                                                                          | `1`                                                                             |
| `image.repository`               | The image repository to pull from                                                                               | `sysdiglabs/cloud-connector`                                                    |
| `image.tag`               	   | The image tag (immutable tags are recommended)                                                                 | `latest pinned version`                                                                    |
| `image.pullPolicy`               | The image pull policy                                                                                           | `IfNotPresent`                                                                  |
| `imagePullSecrets`               | The image pull secrets                                                                                          | `[]`                                                                            |
| `nameOverride`                   | Chart name override                                                                                             | ` `                                                                             |
| `fullnameOverride`               | Chart full name override                                                                                        | ` `                                                                             |
| `serviceAccount.create`          | Create the service account                                                                                      | `true`                                                                          |
| `serviceAccount.annotations`     | Extra annotations for serviceAccount                                                                            | `{}`                                                                            |
| `serviceAccount.name`            | Use this value as serviceAccount Name                                                                           | ` `                                                                             |
| `rbac.create`                    | Create and use RBAC resources                                                                                   | `true`                                                                          |
| `podSecurityContext`             | Configure deployment PSP's                                                                                      | `{ capabilities: drop: - ALL readOnlyRootFileSystem: true runAsNonRoot: true }` |
| `securityContext`                | Configure securityContext                                                                                       | `{}`                                                                            |
| `service.type`                   | Use this type as service                                                                                        | `ClusterIP`                                                                     |
| `service.port`                   | Configure port for the service                                                                                  | `5000`                                                                          |
| `service.labels`                 | Additional labels to specify for the service                                                                    | `{}`                                                                            |
| `resources`                      | Configure resource requests and limits                                                                          | `{}`                                                                            |
| `nodeSelector`                   | Configure nodeSelector for scheduling                                                                           | `{}`                                                                            |
| `nodeSelector`                   | Configure nodeSelector for scheduling                                                                           | `{}`                                                                            |
| `tolerations`                    | Tolerations for scheduling                                                                                      | `[]`                                                                            |
| `affinity`                       | Configure affinity rules                                                                                        | `{}`                                                                            |
| `telemetryDeploymentMethod`      | Configure deployment source for inner telemetry                                                                 | `helm`                                                                          |
| `extraEnvVars`                   | Extra environment variables to be set                                                                           | `[]`                                                                            |
| `aws.accessKeyId`                | AWS Credentials AccessKeyID                                                                                     | ` `                                                                             |
| `aws.secretAccessKey`            | AWS Credentials: SecretAccessKey                                                                                | ` `                                                                             |
| `aws.region`                     | AWS Region                                                                                                      | ` `                                                                             |
| `gcp.credentials`                | GCP Credentials JSON                                                                                            | ` `                                                                             |
| `azure.eventHubConnectionString` | Azure EventHub Connection String                                                                                | ` `                                                                             |
| `azure.eventGridEventHubConnectionString` | Azure Eveng Grid EventHub Connection String                                                                                | ` `                                                                             |
| `tenantId`                       | Azure service principal tenant id         |                                                                     |
| `clientId`                       | Azure service principal client id         |                                                                     |
| `clientSecret`                   | Azure service principal client secret     |                                                                     |
| `sysdig.url`                     | Sysdig Secure URL                                                                                               | `https://secure.sysdig.com`                                                     |
| `sysdig.secureAPIToken`          | API Token to access Sysdig Secure                                                                               | ` `                                                                             |
| `sysdig.verifySSL`               | Verify SSL certificate                                                                                          | `true`                                                                          |
| `existingSecretName`             | Provide an existing secret name (see details in values.yaml) instead of creating a new one from provided values | ` `                                                                             |
| `rules`                          | Rules Section for Cloud Connector                                                                               | `[]`                                                                            |
| `ingestors`                      | Thread-Detection event ingestion configuration ([config](#ingestors))                                                             | `[]`                                                                            |
| `scanners`                       | Scanning capabilities configuration ([config](#scanners))                                                                        | `[]`                                                                            |
| `notifiers`                      | Notifiers Section for Cloud Connector                                                                           | `[]`                                                                            |
| `bruteForceDetection.duration`   | Time window for a bruteforce attack try    | `24h` |
| `bruteForceDetection.maximumTries`    | Maximum number of tries for given time window     | `10`    |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
    --set sysdig.secureAPIToken=YOUR-KEY-HERE \
    sysdig/cloud-connector
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml sysdig/cloud-connector
```

## Configuration Detail

### Ingestors

Where to ingest events from

```yaml
ingestors:
  #  - aws-cloudtrail-sns-sqs: # Receives CloudTrail events from an SQS queue using the SNS paylaod
  #      queueURL:
  #      assumeRole: # organizational usage, assumeRole to fetch S3 elements

  #
  #  - aws-cloudtrail-s3-sns-sqs: # Receives CloudTrail events using s3 events as triggers
  #      queueURL:
  #      assumeRole: # organizational usage, assumeRole to fetch S3 elements


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
#  - aws-ecr: # Scan images when a new image is pushed to AWS ECR
#      codeBuildProject:
#      secureAPITokenSecretName:
#      masterOrganizationRole:
#      organizationRolePerAccount:

#  - aws-ecs: # Scan images when a new image is detected in a ECS cluster
#      codeBuildProject:
#      secureAPITokenSecretName:
#      masterOrganizationRole:
#      organizationRolePerAccount:

#  - gcp-gcr: # Scan images when a new image is pushed to GCP GCR
#      project:
#      secureAPITokenSecretName:
#      serviceAccount:

#  - gcp-cloud-run: # Scan images when a new image is detected from GCP CloudRun
#      project:
#      secureAPITokenSecretName:
#      serviceAccount:
#
#
#  - azure-acr: {} # Scan images when a new image is pushed to Azure container registry

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
