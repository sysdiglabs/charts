# Chart: Sysdig Stackdriver Bridge

[Sysdig Stackdriver Bridge](https://docs.sysdig.com/en/kubernetes-audit-logging.html#UUID-f62c275e-389a-317f-2079-2c61d1f282a7_UUID-ded20060-405c-1f5f-4b3f-c18d20b5668d) is an extension of the Sysdig tool that reads audit logs from Stackdriver, reformats them to match the Kubernetes-native format, and sends the logs to a configurable webhook and to the Sysdig agent service.

## Introduction

This chart adds the Sysdig Stackdriver Bridge application into a cluster using a simple `Deployment` with a `ConfigMap`.

## Prerequisites

- Sysdig should be deployed in the target Kubernetes cluster.
- You will need to create a secret that matches the value `secret.name` (`stackdriver-webhook-bridge` by default) that contains the key `key.json` with the value of the created GCP IAM Service Account for Sysdig to access Stackbridge.
- It is recommended to create this `Secret` in an out-of-band fashion in CI/CD, etc.
  - Optionally, you can enable creation of the `Secret` via the chart by setting `secret.create=true` and providing the JSON data directly via `secret.data`. **This is not an advisable approach for production systems.**

## Installing the Chart

To install the chart with the release name `my-release`, run:

```bash
$ helm repo add sysdiglabs https://sysdiglabs.github.io/charts/
```

to add the `sysdiglabs` Helm chart repository. Then run:

```bash
$ helm install --name my-release sysdiglabs/sysdig-stackdriver-bridge
```

When done, the application should be running within your cluster if properly configured.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

> **Tip**: Use helm delete --purge my-release to completely remove the release from Helm internal storage

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Sysdig Stackdriver Bridge chart and their default values.

| Parameter               | Description                                                                                                                                            | Default                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| `image.repository`      | Image to use with Stackdriver bridge application.                                                                                                      | `sysdiglabs/stackdriver-webhook-bridge`                             |
| `image.pullPolicy`      | Image pull policy.                                                                                                                                     | `IfNotPresent`                                                      |
| `image.tag`             | Image tag to pull.                                                                                                                                     | `v0.0.5`                                                            |
| `settings.forwardURL`   | The destination for converted audit events.                                                                                                            | `http://sysdig-agent.sysdig-agent.svc.cluster.local:7765/k8s_audit` |
| `settings.projectID`    | Read Stackdriver logs from this project id. If blank, the bridge will use the metadata service to find the project id.                                 | `nil`                                                               |
| `settings.clusterID`    | Read Stackdriver logs for this GKE cluster. If blank, the bridge will use the metadata service to find the cluster name.                               | `nil`                                                               |
| `settings.logFile`      | If provided, also write all log entries to this file.                                                                                                  | `nil`                                                               |
| `settings.outFile`      | If provided, write all converted k8s audit events to this file.                                                                                        | `nil`                                                               |
| `settings.pollInterval` | Poll interval for new Stackdriver log messages.                                                                                                        | `5s`                                                                |
| `settings.lagInterval`  | When reading Stackdriver log messages, read this many seconds behind "now" when reading.                                                               | `30s`                                                               |
| `settings.logLevel`     | Log level.                                                                                                                                             | `info`                                                              |
| `secret.create`         | If set to `true`, the chart will generate a `Secret` that matches the value of `bridge.secretName`.                                                    | `false`                                                             |
| `secret.data`           | This will set the value `key.json` in the created `Secret`. Contents of the GCP IAM Service Account that was created for Sysdig to access Stackbridge. | `nil`                                                               |
| `secret.name`           | Name of the `Secret` that contains the `json` data for the GCP IAM account for use with the Stackdriver bridge application.                            | `stackdriver-webhook-bridge`                                        |
| `nodeSelector`          | Node labels for pod assignment                              | `{}`                                        |
| `affinity`              | Affinity settings for pod assignment                        | `{}`                                        |
| `annotations`           | Pod annotations                                             | `{}`                                        |
| `tolerations`           | Toleration labels for pod assignment                        | `[]`                                        |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name my-release \
    --set bridge.forwardURL=FOO,bridge.pollInterval=60s \
    sysdiglabs/sysdig-stackdriver-bridge
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example:

```bash
$ helm install --name my-release -f values.yaml sysdiglabs/sysdig-stackdriver-bridge
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Support

For getting support from the Sysdig team, you should refer to the official [Sysdig Support page](https://sysdig.com/support).

In addition to this, you can browse the documentation for the different
components of the Sysdig Platform:

* [Sysdig Monitor](https://app.sysdigcloud.com)
* [Sysdig Secure](https://secure.sysdig.com)
* [Platform Documentation](https://docs.sysdig.com/en/sysdig-platform.html)
* [Monitor Documentation](https://docs.sysdig.com/en/sysdig-monitor.html)
* [Secure Documentation](https://docs.sysdig.com/en/sysdig-secure.html)
