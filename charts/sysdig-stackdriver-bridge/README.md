# Chart: Sysdig Stackdriver Bridge

[Sysdig Stackdriver Bridge](https://docs.sysdig.com/en/kubernetes-audit-logging.html#UUID-f62c275e-389a-317f-2079-2c61d1f282a7_UUID-ded20060-405c-1f5f-4b3f-c18d20b5668d) is an extension of the Sysdig tool that reads audit logs from Stackdriver, reformats them to match the Kubernetes-native format, and sends the logs to a configurable webhook and to the Sysdig agent service.


This chart adds the Sysdig Stackdriver Bridge application into a cluster using a simple `Deployment` with a `ConfigMap`.

## Prerequisites

- Sysdig is deployed in the target Kubernetes cluster.
- A secret that matches the value `secret.name` (`stackdriver-webhook-bridge` by default) is created. It should contain the `key.json` key with the value of the created GCP IAM Service Account for Sysdig to access Stackbridge.
  - It is recommended to create this `Secret` in an out-of-band fashion in CI/CD, etc.
  - Optionally, you can enable the creation of the `Secret` via the chart by setting `secret.create=true` and providing the JSON data directly via `secret.data`. **This is not an advisable approach for production systems.**

## Install the Chart

To install the chart with the release name `my-release`:

1. Add the `sysdiglabs` Helm chart repository.

    ```bash
    $ helm repo add sysdiglabs https://sysdiglabs.github.io/charts/
    ```

2. Install `sysdig-stackdriver-bridge`:

    ```bash
    $ helm install --name my-release sysdiglabs/sysdig-stackdriver-bridge
    ```

When done, the application should be running within your cluster if properly configured.

> **Tip**: List all the releases using the `helm list` command.


## Verify the Integrity and Origin

Sysdig Helm Charts are signed so you can verify the integrity and origin of each chart. To verify the chart:

### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

### Verify the Chart

To check the integrity and the origin of the charts you can now append the `--verify` flag to the `install`, `upgrade`, and `pull` helm commands.

## Configuration

You can use the Helm chart to update the default Sysdig Stackdriver Bridge configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install` command.

For example:

```bash
$ helm install --name my-release \
    --set bridge.forwardURL=FOO,bridge.pollInterval=60s \
    sysdiglabs/sysdig-stackdriver-bridge
```

### Using values.yaml

The `values.yaml` file specifies the values for the Sysdig Stackdriver Bridge configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

```bash
$ helm install --name my-release -f values.yaml sysdiglabs/sysdig-stackdriver-bridge
```

## Configuration Parameters

The following table lists the configurable parameters of the Sysdig Stackdriver Bridge chart and their default values.

| Parameter               | Description                                                                                                                                            | Default                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| `image.repository`      | Image to use with Stackdriver bridge application.                                                                                                      | `sysdiglabs/stackdriver-webhook-bridge`                             |
| `image.pullPolicy`      | Image pull policy.                                                                                                                                     | `IfNotPresent`                                                      |
| `image.tag`             | Image tag to pull.                                                                                                                                     | `v0.0.7-a4d6ade`                                                            |
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


## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


## Support

For getting support from the Sysdig team, see [Sysdig Support page](https://sysdig.com/support).


