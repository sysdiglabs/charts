# CSPM Collector

This chart deploys the Sysdig CSPM Collector as a deployment in your Kubernetes cluster.

## Installing the Chart

Add Sysdig Helm charts repository:

```
$ helm repo add sysdig https://charts.sysdig.com
```

Deploy the cspm collector

```
$ helm install --create-namespace -n cspm-collector cspm-collector -f values.yaml sysdig/cspm-collector
```

## Configuration

The following table lists the configurable parameters of the Sysdig CSPM Collector chart and their default values:

| Parameter                            | Description                                                                                                            | Default                           |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------- | --------------------------------- |
| `sysdig.accessKey`                                                   | Your Sysdig Access Key                                                                   | ` ` Either accessKey or existingAccessKeySecret is required                    |
| `sysdig.existingAccessKeySecret`                                     | Alternatively, specify the name of a Kubernetes secret containing an 'access-key' entry  | ` ` Either accessKey or existingAccessKeySecret is required                    |
| `rbac.create`                                                        | If true, create & use RBAC resources                                                     | `true`                                                                         |
| `serviceAccount.create`                                              | Create serviceAccount                                                                    | `true`                                                                         |
| `serviceAccount.name`                                                | Use this value as serviceAccountName                                                     | `cspm-collector`                                                               |
| `clusterName`                                                        | Set a cluster name to identify events using *kubernetes.cluster.name* tag                | ` `                                                                            |
| `image.registry`                                                     | CSPM Collector image registry                                                            | `quay.io`                                                                      |
| `image.repository`                                                   | The image repository to pull from                                                        | `sysdig/cspm-collector`                                                        |
| `image.tag`                                                          | The image tag to pull                                                                    | `1.1.1`                                                                        |
| `image.digest`                                                       | The image digest to pull                                                                 | ` `                                                                            |
| `image.pullPolicy`                                                   | The Image pull policy                                                                    | `Always`                                                                       |
| `replicas`                                    | CSPM collector deployment replicas                                                       | `1`                                                                            |
| `namespaces.included`                         | Namespaces to include in the CSPM collector scans, when empty scans all                  | ``                                                                             |
| `namespaces.excluded`                         | Namespaces to exclude in the CSPM collector scans                                        | ``                                                                             |
| `workloads.included`                          | Workloads to include in the CSPM collector scans, when empty scans all                   | ``                                                                             |
| `workloads.excluded`                          | Workloads to exclude in the CSPM collector scans, when empty scans all                   | ``                                                                             |
| `healthIntervalMin`                           | Minutes interval for CSPM collector health status messages                               | `5`                                                                            |
| `resources.requests.cpu`                               | CSPM collector CPU requests                                                     | `150m`                                                                        |
| `resources.requests.memory`                            | CSPM collector Memory requests                                                  | `256Mi`                                                                        |
| `resources.limits.cpu`                                 | CSPM collector CPU limits                                                       | `500m`                                                                         |
| `resources.limits.memory`                              | CSPM collector Memory limits                                                    | `1536Mi`                                                                        |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --namespace cspmcollector cspm-collector \
    --set sysdig.accessKey=YOUR-KEY-HERE, \
    sysdig/cspm-collector
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For
example,

```bash
$ helm install --namespace cspmcollector cspm-collector -f values.yaml sysdig/cspm-collector
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release-name -f values.yaml sysdig/cspm-collector
```
