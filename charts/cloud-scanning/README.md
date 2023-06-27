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

The following table lists the configurable parameters of the Sysdig Cloud Scanning
chart and their default values:

| Parameter                    | Description                                                                                                     | Default                                                                         |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `replicaCount`               | Amount of replicas for Cloud Scanning                                                                           | `1`                                                                             |
| `image.repository`           | The image repository to pull from                                                                               | `sysdiglabs/cloud-scanning`                                                     |
| `image.pullPolicy`           | The image pull policy                                                                                           | `IfNotPresent`                                                                  |
| `imagePullSecrets`           | The image pull secrets                                                                                          | `[]`                                                                            |
| `nameOverride`               | Chart name override                                                                                             | ` `                                                                             |
| `fullnameOverride`           | Chart full name override                                                                                        | ` `                                                                             |
| `serviceAccount.create`      | Create the service account                                                                                      | `true`                                                                          |
| `serviceAccount.annotations` | Extra annotations for serviceAccount                                                                            | `{}`                                                                            |
| `serviceAccount.name`        | Use this value as serviceAccount Name                                                                           | ` `                                                                             |
| `rbac.create`                | Create and use RBAC resources                                                                                   | `true`                                                                          |
| `podSecurityContext`         | Configure deployment PSP's                                                                                      | `{ capabilities: drop: - ALL readOnlyRootFileSystem: true runAsNonRoot: true }` |
| `securityContext`            | Configure securityContext                                                                                       | `{}`                                                                            |
| `service.type`               | Use this type as service                                                                                        | `ClusterIP`                                                                     |
| `service.port`               | Configure port for the service                                                                                  | `5000`                                                                          |
| `resources.limits.cpu`       | Configure resource limits for cpu                                                                               | `256m`                                                                          |
| `resources.limits.memory`    | Configure resource limits for memory                                                                            | `512Mi`                                                                         |
| `resources.requests.cpu`     | Configure resource requests for cpu                                                                             | `256m`                                                                          |
| `resources.requests.memory`  | Configure resource requests for memory                                                                          | `512Mi`                                                                         |
| `nodeSelector`               | Configure nodeSelector for scheduling                                                                           | `{}`                                                                            |
| `nodeSelector`               | Configure nodeSelector for scheduling                                                                           | `{}`                                                                            |
| `tolerations`                | Tolerations for scheduling                                                                                      | `[]`                                                                            |
| `affinity`                   | Configure affinity rules                                                                                        | `{}`                                                                            |
| `extraEnvVars`               | Extra environment variables to be set                                                                           | `[]`                                                                            |
| `aws.accessKeyId`            | AWS Credentials AccessKeyID                                                                                     | ` `                                                                             |
| `aws.secretAccessKey`        | AWS Credentials: SecretAccessKey                                                                                | ` `                                                                             |
| `aws.region`                 | AWS Region                                                                                                      | ` `                                                                             |
| `gcp.credentials`            | GCP Credentials JSON                                                                                            | ` `                                                                             |
| `sysdig.url`                 | Sysdig Secure URL                                                                                               | `https://secure.sysdig.com`                                                     |
| `sysdig.secureAPIToken`      | API Token to access Sysdig Secure                                                                               | ` `                                                                             |
| `existingSecretName`         | Provide an existing secret name (see details in values.yaml) instead of creating a new one from provided values | ` `                                                                             |
| `sysdig.verifySSL`           | Verify SSL certificate                                                                                          | `true`                                                                          |
| `ecrScanning`                | Enable scanning for images pushed to ECR                                                                        | `true`                                                                          |
| `ecsScanning`                | Enable scanning for images of tasks or services running in ECS                                                  | `true`                                                                          |
| `codeBuildProject`           | Name of the CodeBuild exeuting the scanner                                                                      | ` `                                                                             |
| `sqsQueueUrl`                | URL of the SQS queue for CloudTrail events                                                                      | ` `                                                                             |
| `secureAPITokenSecret`       | Secret name that contains the API Token for Secure (required to inline-scan without leaking the secret)         | ` `                                                                             |


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
