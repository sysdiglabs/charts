# Cloud Connector

This chart deploys the Sysdig Cloud connector on your Kubernetes cluster.

## Installing the Chart

1. Create a namespace for the deployment:

```
$ kubectl create ns cloud-connector
```

2. Add Sysdig Helm charts repository:

```
$ helm repo add sysdig https://charts.sysdig.com
```

3. Deploy the scanner adapter

```
$ helm install -n cloud-connector cloud-connector -f values.yaml sysdig/cloud-connector
```

## Configuration

The following table lists the configurable parameters of the Harbor Scanner
Sysdig Secure chart and their default values:

| Parameter                    | Description                            | Default                                   |
| ---                          | ---                                    | ---                                       |
| `replicaCount`               | Amount of replicas for Cloud Connector | `1`                                       |
| `image.repository`           | The image repository to pull from      | `sysdiglabs/harbor-scanner-sysdig-secure` |
| `image.pullPolicy`           | The image pull policy                  | `IfNotPresent`                            |
| `imagePullSecrets`           | The image pull secrets                 | `[]`                                      |
| `nameOverride`               | Chart name override                    | ` `                                       |
| `fullnameOverride`           | Chart full name override               | ` `                                       |
| `serviceAccount.create`      | Create the service account             | `true`                                    |
| `serviceAccount.annotations` | Extra annotations for serviceAccount   | `{}`                                      |
| `serviceAccount.name`        | Use this value as serviceAccount Name  | ` `                                       |
| `rbac.create`                | Create and use RBAC resources          | `true`                                    |
| `podSecurityContext`         | Configure deployment PSP's             | `{}`                                      |
| `securityContext`            | Configure securityContext              | `{}`                                      |
| `service.type`               | Use this type as service               | `ClusterIP`                               |
| `service.port`               | Configure port for the service         | `5000`                                    |
| `nodeSelector`               | Configure nodeSelector for scheduling  | `{}`                                      |
| `tolerations`                | Tolerations for scheduling             | `[]`                                      |
| `affinity`                   | Configure affinity rules               | `{}`                                      |
| `aws.accessKeyId`            | AWS Credentials AccessKeyID            | ` `                                       |
| `aws.secretAccessKey`        | AWS Credentials: SecretAccessKey       | ` `                                       |
| `aws.region`                 | AWS Region                             | ` `                                       |
| `sysdig.secureApiToken`      | API Token to access Sysdig Secure      | ` `                                       |
| `sysdig.agentKey`            | Agent Key for Sysdig                   | ` `                                       |
| `rules`                      | Rules Section for Cloud Connector      | `{ - directory: path: /rules }`           |
| `ingestors`                  | Ingestors Section for Cloud Connector  | `{}`                                      |
| `notifiers`                  | Notifiers Section for Cloud Connector  | `{ - console: {}, - metrics: {}}`         |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name my-release \
    --set sysdig.secureApiToken=YOUR-KEY-HERE \
    sysdig/cloud-connector
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml sysdig/cloud-connector
```

You have more details about Rules, Ingestors and Notifiers on [Cloud Connector documentation](https://sysdiglabs.github.io/cloud-connector/config-file.html)
