# Cloud Connector

This chart deploys the Sysdig Cloud connector on your Kubernetes cluster.

## Installing the Chart

Add Sysdig Helm charts repository and deploy the chart:

```
$ helm repo add sysdig https://charts.sysdig.com

$ helm install --create-namespace -n cloud-connector cloud-connector -f values.yaml sysdig/cloud-connector
```

## Configuration

The following table lists the configurable parameters of the Harbor Scanner
Sysdig Secure chart and their default values:

| Parameter                    | Description                                          | Default                                                                         |
| ---------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------- |
| `replicaCount`               | Amount of replicas for Cloud Connector               | `1`                                                                             |
| `image.repository`           | The image repository to pull from                    | `sysdiglabs/cloud-connector`                                                    |
| `image.pullPolicy`           | The image pull policy                                | `IfNotPresent`                                                                  |
| `imagePullSecrets`           | The image pull secrets                               | `[]`                                                                            |
| `nameOverride`               | Chart name override                                  | ` `                                                                             |
| `fullnameOverride`           | Chart full name override                             | ` `                                                                             |
| `serviceAccount.create`      | Create the service account                           | `true`                                                                          |
| `serviceAccount.annotations` | Extra annotations for serviceAccount                 | `{}`                                                                            |
| `serviceAccount.name`        | Use this value as serviceAccount Name                | ` `                                                                             |
| `rbac.create`                | Create and use RBAC resources                        | `true`                                                                          |
| `podSecurityContext`         | Configure deployment PSP's                           | `{ capabilities: drop: - ALL readOnlyRootFileSystem: true runAsNonRoot: true }` |
| `securityContext`            | Configure securityContext                            | `{}`                                                                            |
| `service.type`               | Use this type as service                             | `ClusterIP`                                                                     |
| `service.port`               | Configure port for the service                       | `5000`                                                                          |
| `resources.limits.cpu`       | Configure resource limits for cpu                    | `256m`                                                                          |
| `resources.limits.memory`    | Configure resource limits for memory                 | `512Mi`                                                                         |
| `resources.requests.cpu`     | Configure resource requests for cpu                  | `256m`                                                                          |
| `resources.requests.memory`  | Configure resource requests for memory               | `512Mi`                                                                         |
| `nodeSelector`               | Configure nodeSelector for scheduling                | `{}`                                                                            |
| `nodeSelector`               | Configure nodeSelector for scheduling                | `{}`                                                                            |
| `tolerations`                | Tolerations for scheduling                           | `[]`                                                                            |
| `affinity`                   | Configure affinity rules                             | `{}`                                                                            |
| `extraEnvVars`               | Extra environment variables to be set                | `[]`                                                                            |
| `aws.accessKeyId`            | AWS Credentials AccessKeyID                          | ` `                                                                             |
| `aws.secretAccessKey`        | AWS Credentials: SecretAccessKey                     | ` `                                                                             |
| `aws.region`                 | AWS Region                                           | ` `                                                                             |
| `gcp.credentials`            | GCP Credentials JSON                                 | ` `                                                                             |
| `sysdig.url`                 | Sysdig Secure URL                                    | `https://secure.sysdig.com`                                                     |
| `sysdig.secureAPIToken`      | API Token to access Sysdig Secure                    | ` `                                                                             |
| `sysdig.verifySSL`           | Verify SSL certificate                               | `true`                                                                          |
| `rules`                      | Rules Section for Cloud Connector                    | `[]`                                                                            |
| `ingestors`                  | Ingestors Section for Cloud Connector                | `[]`                                                                            |
| `notifiers`                  | Notifiers Section for Cloud Connector                | `[]`                                                                            |


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

You have more details about Rules, Ingestors and Notifiers on [Cloud Connector documentation](https://sysdiglabs.github.io/cloud-connector/config-file.html)
