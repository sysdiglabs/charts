# KSPM Collector

See the [Actionable Compliance documentation](https://docs.sysdig.com/en/docs/sysdig-secure/posture/compliance/actionable-compliance/) for details on the Actionable Compliance feature. The
KSPM Collector collects Kubernetes resource manifests and sends them to be evaluated against compliance policies.
The scan results are displayed in Sysdig Secure's Actionable Compliance screens.

## Installing the Chart

Add Sysdig Helm charts repository:

```
$ helm repo add sysdig https://charts.sysdig.com
```

Deploy the kspm collector

```
$ helm install --create-namespace -n kspm-collector kspm-collector -f values.yaml sysdig/kspm-collector
```

## Configuration

The following table lists the configurable parameters of the Sysdig KSPM Collector chart and their default values:

| Parameter                                 | Description                                                                             | Default                                                     |
|-------------------------------------------|-----------------------------------------------------------------------------------------|-------------------------------------------------------------|
| `global.proxy.httpProxy`                  | Sets `HTTP_PROXY` on the KSPM Collector containers                                      | `""`                                                        |
| `global.proxy.httpsProxy`                 | Sets `HTTPS_PROXY` on the KSPM Collector containers                                     | `""`                                                        |
| `global.proxy.noProxy`                    | Sets `NO_PROXY` on the KSPM Collector containers                                        | `""`                                                        |
| `global.sslVerifyCertificate`             | Sets `NATS_INSECURE` env variable on the KSPM Collector Containers                      |                                                             |
| `global.kspm.deploy`                      | Enables Sysdig KSPM node analyzer & KSPM collector                                      | `true`                                                      |
| `global.image.pullSecrets`                                       | Global pull secrets.                                                                                                                                                                                                                                                                                                                                                                                                                                         | <code>[]</code>                                             |
| `global.image.pullPolicy`                                       | Global pull policy.                                                                                                                                                                                                                                                                                                                                                                                                                                         | <code>`Always`</code>                                       
| `sysdig.accessKey`                        | Your Sysdig Access Key                                                                  | ` ` Either accessKey or existingAccessKeySecret is required |
| `sysdig.existingAccessKeySecret`          | Alternatively, specify the name of a Kubernetes secret containing an 'access-key' entry | ` ` Either accessKey or existingAccessKeySecret is required |
| `rbac.create`                             | If true, create & use RBAC resources                                                    | `true`                                                      |
| `serviceAccount.create`                   | Create serviceAccount                                                                   | `true`                                                      |
| `serviceAccount.name`                     | Use this value as serviceAccountName                                                    | `kspm-collector`                                            |
| `clusterName`                             | Set a cluster name to identify events using *kubernetes.cluster.name* tag               | ` `                                                         |
| `image.registry`                          | KSPM Collector image registry                                                           | `quay.io`                                                   |
| `image.repository`                        | The image repository to pull from                                                       | `sysdig/kspm-collector`                                     |
| `image.tag`                               | The image tag to pull                                                                   | `1.25.0`                                                    |
| `image.digest`                            | The image digest to pull                                                                | ` `                                                         |
| `image.pullPolicy`                        | The Image pull policy                                                                   | `""`                                                        |
| `imagePullSecrets`                        | The Image pull secret                                                                   | `[]`                                                        |
| `replicas`                                | KSPM collector deployment replicas                                                      | `1`                                                         |
| `namespaces.included`                     | Namespaces to include in the KSPM collector scans, when empty scans all                 | ``                                                          |
| `namespaces.excluded`                     | Namespaces to exclude in the KSPM collector scans                                       | ``                                                          |
| `nodeSelector`                            | Node Selector                                                                           | `{}`                                                        |
| `workloads.included`                      | Workloads to include in the KSPM collector scans, when empty scans all                  | ``                                                          |
| `workloads.excluded`                      | Workloads to exclude in the KSPM collector scans, when empty scans all                  | ``                                                          |
| `healthIntervalMin`                       | Minutes interval for KSPM collector health status messages                              | `5`                                                         |
| `resources.requests.cpu`                  | KSPM collector CPU requests                                                             | `150m`                                                      |
| `resources.requests.memory`               | KSPM collector memory requests                                                          | `256Mi`                                                     |
| `resources.limits.cpu`                    | KSPM collector CPU limits                                                               | `500m`                                                      |
| `resources.limits.memory`                 | KSPM collector memory limits                                                            | `1536Mi`                                                    |
| `priorityClassName`                       | Name of an existing PriorityClass for the KSPM Collector to use                         | `{}`                                                        |
| `apiEndpoint`                             | kspmCollector apiEndpoint                                                               | `""`                                                        |
| `httpProxy`                               | Proxy configuration variables                                                           |                                                             |
| `httpsProxy`                              | Proxy configuration variables                                                           |                                                             |
| `noProxy`                                 | Proxy configuration variables                                                           |                                                             |
| `sslVerifyCertificate`                    | Sets `NATS_INSECURE` env variable on the KSPM Collector Containers                      |                                                             |
| `arch`                                    | Allowed architectures for scheduling                                                    | `[ amd64, arm64 ]`                                          |
| `os`                                      | Allowed OSes for scheduling                                                             | `[ linux ]`                                                 |
| `affinity`                                | Node affinities. Overrides `arch` and `os` values                                       | `{}`                                                        |
| `labels`                                  | KSPM collector specific labels (as a multi-line templated string map or as YAML)        | `{}`                                                        |
| `port`                                    | KSPM collector port for health checks                                                   | `8080`                                                      |
| `psp.create`                              | Create Pod Security Policy to allow the KSPM Collector running in clusters with PSP enabled | `true`                                                      |
| `readinessProbe.enabled`                  | KSPM collector readinessProbe enablement                                                | `true`                                                      |
| `livenessProbe.enabled`                   | KSPM collector livenessProbe enablement                                                 | `true`                                                      |
| `scc.create`                              | Create OpenShift's Security Context Constraint                                          | `true`                                                      |
| `securityContext.runAsNonRoot`            | make KSPM collector run as non root                                                     | `true`                                                      |
| `securityContext.runAsUser`               | make KSPM collector run as user with this ID                                            | `10001`                                                     |
| `securityContext.runAsGroup`              | make KSPM collector run as group with this ID                                           | `10001`                                                     |
| `securityContext.readOnlyRootFilesystem`  | make KSPM collector root file system read only                                          | `true`                                                      |
| `securityContext.allowPrivilegeEscalation`| allow KSPM collector apps to gain priviledges stronger than their parent process        | `false`                                                     |
| `securityContext.capabilities.drop`       | Linux capabilities to be taken from KSPM collector                                      | `['all']`                                                   |
| `tolerations`                             | The tolerations for scheduling                                                          | `kubernetes.io/arch=arm64:NoSchedule`                       |



Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --namespace kspmcollector kspm-collector \
    --set sysdig.accessKey=YOUR-KEY-HERE, \
    sysdig/kspm-collector
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For
example,

```bash
$ helm install --namespace kspmcollector kspm-collector -f values.yaml sysdig/kspm-collector
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release-name -f values.yaml sysdig/kspm-collector
```

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
helm unittest --helm3 .
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.
