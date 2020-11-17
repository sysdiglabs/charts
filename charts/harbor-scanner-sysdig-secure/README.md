# Chart: Harbor Scanner Adapter for Sysdig Secure

This chart deploys the Harbor Scanner Adapter for Sysdig Secure on your
Kubernestes cluster.

## Installing the Chart

1. Ensure you are passing the **sysdig.secure.apiToken** value. This one is
mandatory to connect with the backend and perform scanning analysis
2. Create a namespace for the deployment:

```
$ kubectl create ns harbor-scanner-sysdig-secure
```

3. Add Sysdig Helm charts repository:

```
$ helm repo add sysdiglabs https://sysdiglabs.github.io/charts/
```

4. Deploy the scanner adapter

```
$ helm install -n sysdig-admission-controller sysdig-admission-controller -f values.yaml sysdiglabs/sysdig-admission-controller
```

## Configuration

The following table lists the configurable parameters of the Harbor Scanner
Sysdig Secure chart and their default values:

| Parameter                                     | Description                                                                                                                 | Default                                   |
| ---                                           | ---                                                                                                                         | ---                                       |
| `replicaCount`                                | Amount of replicas for Scanner Adapter                                                                                      | `1`                                       |
| `image.repository`                            | The image repository to pull from                                                                                           | `sysdiglabs/harbor-scanner-sysdig-secure` |
| `image.pullPolicy`                            | The image pull policy                                                                                                       | `IfNotPresent`                            |
| `imagePullSecrets`                            | The image pull secrets                                                                                                      | `[]`                                      |
| `nameOverride`                                | Chart name override                                                                                                         | ` `                                       |
| `fullnameOverride`                            | Chart full name override                                                                                                    | ` `                                       |
| `serviceAccount.create`                       | Create the service account                                                                                                  | `true`                                    |
| `serviceAccount.annotations`                  | Extra annotations for serviceAccount                                                                                        | `{}`                                      |
| `serviceAccount.name`                         | Use this value as serviceAccount Name                                                                                       | ` `                                       |
| `rbac.create`                                 | Create and use RBAC resources                                                                                               | `true`                                    |
| `podSecurityContext`                          | Configure deployment PSP's                                                                                                  | `{}`                                      |
| `securityContext`                             | Configure securityContext                                                                                                   | `{}`                                      |
| `service.type`                                | Use this type as service                                                                                                    | `ClusterIP`                               |
| `service.port`                                | Configure port for the service                                                                                              | `5000`                                    |
| `nodeSelector`                                | Configure nodeSelector for scheduling                                                                                       | `{}`                                      |
| `tolerations`                                 | Tolerations for scheduling                                                                                                  | `[]`                                      |
| `affinity`                                    | Configure affinity rules                                                                                                    | `{}`                                      |
| `sysdig.secure.apiToken`                      | API Token to access Sysdig Secure. This value is **mandatory**.                                                             | ` `                                       |
| `sysdig.secure.url`                           | Sysdig Secure endpoint                                                                                                      | `https://secure.sysdig.com`               |
| `sysdig.secure.verifySSL`                     | Verify SSL certificate when connecting to Sysdig Secure endpoint                                                            | `true`                                    |
| `inlineScanning.enabled`                      | Enable Inline Scanning feature                                                                                              | `false`                                   |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name my-release \
    --set sysdig.accessKey=YOUR-KEY-HERE,sysdig.settings.tags="role:webserver\,location:europe" \
    sysdiglabs/sysdig
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml sysdiglabs/sysdig
```

> **Tip**: You can use the default [values.yaml](values.yaml)
