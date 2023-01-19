# Cloud Scanning

This chart deploys the Sysdig Cloud scanning on your Kubernetes cluster.

>  ⚠️ **Deprecated Module** 
> <br>Use [Cloud-Connector `scanning`](https://charts.sysdig.com/charts/cloud-connector/#scanners) configuration instead of this module

## Installing the Chart

Add Sysdig Helm charts repository and deploy the chart:

```
$ helm repo add sysdig https://charts.sysdig.com

$ helm install --create-namespace -n cloud-scanning cloud-scanning -f values.yaml sysdig/cloud-scanning
```

## Configuration

The following table lists the configurable parameters of the Sysdig Cloud Scanning
chart and their default values:

| Parameter                    | Description                                                                                                     | Default                                                                                                            |
|------------------------------|-----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| `affinity`                   | Configure affinity rules                                                                                        | `{}`                                                                                                               |
| `aws.accessKeyId`            | AWS Credentials AccessKeyID                                                                                     | ` `                                                                                                                |
| `aws.region`                 | AWS Region                                                                                                      | ` `                                                                                                                |
| `aws.secretAccessKey`        | AWS Credentials: SecretAccessKey                                                                                | ` `                                                                                                                |
| `codeBuildProject`           | Name of the CodeBuild exeuting the scanner                                                                      | ` `                                                                                                                |
| `ecrScanning`                | Enable scanning for images pushed to ECR                                                                        | `true`                                                                                                             |
| `ecsScanning`                | Enable scanning for images of tasks or services running in ECS                                                  | `true`                                                                                                             |
| `existingSecretName`         | Provide an existing secret name (see details in values.yaml) instead of creating a new one from provided values | ` `                                                                                                                |
| `extraEnvVars`               | Extra environment variables to be set                                                                           | `[]`                                                                                                               |
| `fullnameOverride`           | Chart full name override                                                                                        | ` `                                                                                                                |
| `gcp.credentials`            | GCP Credentials JSON                                                                                            | ` `                                                                                                                |
| `image.pullPolicy`           | The image pull policy                                                                                           | `IfNotPresent`                                                                                                     |
| `imagePullSecrets`           | The image pull secrets                                                                                          | `[]`                                                                                                               |
| `image.repository`           | The image repository to pull from                                                                               | `sysdiglabs/cloud-scanning`                                                                                        |
| `nameOverride`               | Chart name override                                                                                             | ` `                                                                                                                |
| `nodeSelector`               | Configure nodeSelector for scheduling                                                                           | `{}`                                                                                                               |
| `nodeSelector`               | Configure nodeSelector for scheduling                                                                           | `{}`                                                                                                               |
| `podSecurityContext`         | Configure deployment PSP's                                                                                      | <pre>capabilities:<br>&emsp;drop:<br>&emsp;&emsp;- ALL<br>readOnlyRootFileSystem: true<br>runAsNonRoot: true</pre> |
| `rbac.create`                | Create and use RBAC resources                                                                                   | `true`                                                                                                             |
| `replicaCount`               | Amount of replicas for Cloud Scanning                                                                           | `1`                                                                                                                |
| `resources.limits.cpu`       | Configure resource limits for cpu                                                                               | `256m`                                                                                                             |
| `resources.limits.memory`    | Configure resource limits for memory                                                                            | `512Mi`                                                                                                            |
| `resources.requests.cpu`     | Configure resource requests for cpu                                                                             | `256m`                                                                                                             |
| `resources.requests.memory`  | Configure resource requests for memory                                                                          | `512Mi`                                                                                                            |
| `secureAPITokenSecret`       | Secret name that contains the API Token for Secure (required to inline-scan without leaking the secret)         | ` `                                                                                                                |
| `securityContext`            | Configure securityContext                                                                                       | `{}`                                                                                                               |
| `serviceAccount.annotations` | Extra annotations for serviceAccount                                                                            | `{}`                                                                                                               |
| `serviceAccount.create`      | Create the service account                                                                                      | `true`                                                                                                             |
| `serviceAccount.name`        | Use this value as serviceAccount Name                                                                           | ` `                                                                                                                |
| `service.port`               | Configure port for the service                                                                                  | `5000`                                                                                                             |
| `service.type`               | Use this type as service                                                                                        | `ClusterIP`                                                                                                        |
| `sqsQueueUrl`                | URL of the SQS queue for CloudTrail events                                                                      | ` `                                                                                                                |
| `sysdig.secureAPIToken`      | API Token to access Sysdig Secure                                                                               | ` `                                                                                                                |
| `sysdig.url`                 | Sysdig Secure URL                                                                                               | `https://secure.sysdig.com`                                                                                        |
| `sysdig.verifySSL`           | Verify SSL certificate                                                                                          | `true`                                                                                                             |
| `tolerations`                | Tolerations for scheduling                                                                                      | `[]`                                                                                                               |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
    --set sysdig.secureAPIToken=YOUR-KEY-HERE \
    sysdig/cloud-scanning
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml sysdig/cloud-scanning
```

You have more details about Cloud Scanning configuration on [Cloud Scanning documentation](https://sysdiglabs.github.io/cloud-connector/scanning.html)
