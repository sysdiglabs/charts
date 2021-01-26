# Admission Controller

This chart deploys the Sysdig Admission Controller in your Kubernetes cluster.

## Installing the Chart

1. Create a namespace for the deployment:

```
$ kubectl create ns admission-controller
```

2. Add Sysdig Helm charts repository:

```
$ helm repo add sysdig https://charts.sysdig.com
```

3. Deploy the scanner adapter

```
$ helm install -n admission-controller admission-controller -f values.yaml sysdig/admission-controller
```

## Configuration

The following table lists the configurable parameters of the Sysdig Admission
Controller chart and their default values:

| Parameter                             | Description                                        | Default                                                                                                                             |
| ---                                   | ---                                                | ---                                                                                                                                 |
| `sysdig.url`                          | The Sysdig URL prefix                              | `https://app.sysdigcloud.com`                                                                                                       |
| `sysdig.secureAPIToken`               | API Token to access Sysdig Secure                  | ``                                                                                                                                  |
| `sysdig.agentKey`                     | Agent Key for Sysdig                               | ``                                                                                                                                  |
| `clusterName`                         | Cluster Name which appear on Secure UI             | ``                                                                                                                                  |
| `nameOverride`                        | Chart name override                                | ` `                                                                                                                                 |
| `fullnameOverride`                    | Chart full name override                           | ` `                                                                                                                                 |
| `serviceAccounts.webhook.create`      | Create the service account                         | `true`                                                                                                                              |
| `serviceAccounts.webhook.annotations` | Extra annotations for serviceAccount               | `{}`                                                                                                                                |
| `serviceAccounts.webhook.name`        | Use this value as serviceAccount Name              | ` `                                                                                                                                 |
| `serviceAccounts.scanner.create`      | Create the service account                         | `true`                                                                                                                              |
| `serviceAccounts.scanner.annotations` | Extra annotations for serviceAccount               | `{}`                                                                                                                                |
| `serviceAccounts.scanner.name`        | Use this value as serviceAccount Name              | ` `                                                                                                                                 |
| `webhook.name`                        | Service name for Webhook deployment                | `webhook`                                                                                                                           |
| `webhook.replicaCount`                | Amount of replicas for webhook                     | `1`                                                                                                                                 |
| `webhook.image.repository`            | Webhook image repository                           | `sysdiglabs/admission-controller`                                                                                                   |
| `webhook.image.pullPolicy`            | PullPolicy for Webhook image                       | `Always`                                                                                                                            |
| `webhook.image.tag`                   | Webhook image tag                                  | `master`                                                                                                                            |
| `webhook.service.type`                | Use this type as webhook service                   | `ClusterIP`                                                                                                                         |
| `webhook.service.port`                | Configure port for the webhook service             | `5000`                                                                                                                              |
| `webhook.httpProxy`                   | HTTP Proxy settings for webhook                    | ``                                                                                                                                  |
| `webhook.noProxy`                     | No proxy these URL's for webhook                   | `kubernetes,10.0.0.0/8`                                                                                                             |
| `webhook.podAnnotations`              | Webhook pod annotations                            | `{"prometheus.io/scrape": "true", "prometheus.io/path": "/metrics", "prometheus.io/port": "5000", "prometheus.io/scheme": "https"}` |
| `webhook.podSecurityContext`          | PSP's for webhook                                  | `{"fsgroup": 1000}`                                                                                                                 |
| `webhook.securityContext`             | Configure securityContext for webhook              | `{"capabilities": {"drop": ["ALL"]}, "readOnlyRootFilesystem": true, "runAsNonRoot": true, "runAsUser": 1000 }`                     |
| `webhook.imagePullSecrets`            | The image pull secrets for webhook                 | `[]`                                                                                                                                |
| `webhook.resources`                   | Resource limits for webhook                        | `{}`                                                                                                                                |
| `webhook.nodeSelector`                | Configure nodeSelector for scheduling for webhook  | `{}`                                                                                                                                |
| `webhook.tolerations`                 | Tolerations for scheduling for webhook             | `[]`                                                                                                                                |
| `webhook.affinity`                    | Configure affinity rules for webhook               | `{}`                                                                                                                                |
| `scanner.enabled`                     | Deploy the Inline Scanner Service                  | `true`                                                                                                                              |
| `scanner.name`                        | Service name for Scanner deployment                | `scanner`                                                                                                                           |
| `scanner.replicaCount`                | Amount of replicas for scanner                     | `1`                                                                                                                                 |
| `scanner.image.repository`            | Scanner image repository                           | `sysdiglabs/inline-scan-service`                                                                                                    |
| `scanner.image.pullPolicy`            | PullPolicy for Scanner image                       | `Always`                                                                                                                            |
| `scanner.image.tag`                   | Scanner image tag                                  | `master`                                                                                                                            |
| `scanner.service.port`                | Configure port for the webhook service             | `8443`                                                                                                                              |
| `scanner.authWithSecureToken`         | Authenticate with Secure token                     | `false`                                                                                                                             |
| `scanner.sysdigSecureOnPrem`          | Configure scanner to work in an OnPrem environment | `false`                                                                                                                             |
| `scanner.httpProxy`                   | HTTP Proxy settings for scanner                    | ``                                                                                                                                  |
| `scanner.noProxy`                     | No proxy these URL's for scanner                   | `kubernetes,10.0.0.0/8`                                                                                                             |
| `scanner.podAnnotations`              | Scanner pod annotations                            | `{"prometheus.io/scrape": "true", "prometheus.io/path": "/metrics", "prometheus.io/port": "5000", "prometheus.io/scheme": "https"}` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name my-release \
    --set sysdig.secureApiToken=YOUR-KEY-HERE \
    sysdig/admission-controller
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml sysdig/admission-controller
```

You have more details about Rules, Ingestors and Notifiers on [Cloud Connector documentation](https://sysdiglabs.github.io/admission-controller/config-file.html)
