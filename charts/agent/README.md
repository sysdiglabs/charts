# Chart: Sysdig Agent

## Overview

Use the [sysdig-deploy](../sysdig-deploy/README.md) parent chart to deploy the Sysdig Agent and any other subcomponents. Do not deploy subcharts directly.

To deploy the Sysdig Agent, follow the installation instructions given on the Sysdig Documentation website:

### Sysdig Monitor

- [Installation Requirements](https://docs.sysdig.com/en/docs/installation/sysdig-monitor/install-sysdig-agent/#installation-requirements)
- [Installation Instructions](https://docs.sysdig.com/en/docs/installation/sysdig-monitor/install-sysdig-agent/kubernetes/)

### Sysdig Secure | Sysdig Secure + Sysdig Monitor

- [Component Overview](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/)
- [Installation Requirements](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/installation-requirements/sysdig-agent/)
- [Installation Instructions](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/kubernetes/)

### On-Premises

- [Install Sysdig Agent for a Sysdig On-Premises Deployment](https://docs.sysdig.com/en/docs/installation/on-premises/)
- [Install Sysdig Agent in an Airgapped Environment](https://docs.sysdig.com/en/docs/installation/on-premises/airgapped-installation/)

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

You can use the Helm chart to update the default agent configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command.

For example:

```bash
$ helm install --namespace sysdig-agent sysdig-agent \
    --set sysdig.accessKey=<YOUR-ACCESS-KEY>,sysdig.settings.tags="role:webserver\,location:europe" \
    sysdig/agent
```

### Using values.yaml

The `values.yaml` file specifies the values for the agent configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

For example, to enable Prometheus metrics scraping:

1. Add the following to the `values.yaml` file:

   ```yaml
   sysdig:
     accessKey: <YOUR-ACCESS-KEY>
     settings:
       prometheus:
         enabled: true
         histograms: true
   ```

   **Tip**: You can use the default [values.yaml](values.yaml) file.

2. Run the following:

   ```
   helm install --namespace sysdig-agent sysdig-agent -f values.yaml sysdig/agent
   ```

## Configuration Parameters

The following table lists the configurable parameters of the Sysdig chart and their default values.

| Parameter                                               | Description                                                                                                                                                                              | Default                                                                                                   |
|---------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| `global.clusterConfig.name`                             | Sets a unique name to the cluster. You can then use the cluster name to identify events using the `kubernetes.cluster.name` tag.                                                         | `quay.io`                                                                                                 |
| `global.sysdig.accessKey`                               | Specify your Sysdig Agent Access Key.                                                                                                                                                    | Either `accessKey` or `existingAccessKeySecret` is required                                               |
| `global.sysdig.existingAccessKeySecret`                 | An alternative to using the Sysdig Agent access key. Specify the name of a Kubernetes secret containing an `access-key` entry.                                                           | Either `accessKey` or `existingAccessKeySecret` is required                                               |
| `global.sysdig.region`                                  | The SaaS region for these agents. Possible values: `"us1"`, `"us2"`, `"us3"`, `"us4"`, `"eu1"`, `"au1"`, and `"custom"`                                                                  | `"us1"`                                                                                                   |
| `global.proxy.httpProxy`                                | Sets `http_proxy` on the `agent` container.                                                                                                                                              | `""`                                                                                                      |
| `global.proxy.httpsProxy`                               | Sets `https_proxy` on the `agent` container.                                                                                                                                             | `""`                                                                                                      |
| `global.proxy.noProxy`                                  | Sets `no_proxy` on the `agent` container.                                                                                                                                                | `""`                                                                                                      |
| `global.gke.autopilot`                                  | If true, overrides the agent configuration to run on GKE Autopilot clusters.                                                                                                             | `false`                                                                                                   |
| `global.image.pullSecrets`                              | Global pull secrets.                                                                                                                                                                     | <code>[]</code>                                                                                           |
| `global.image.pullPolicy`                               | Global pull policy.                                                                                                                                                                      | <code>`IfNotPresent`</code>                                                                               |
| `namespace`                                             | Overrides the global namespace setting and release namespace for components.                                                                                                             | `""`                                                                                                      |
| `image.registry`                                        | Sysdig Agent image registry.                                                                                                                                                             | `quay.io`                                                                                                 |
| `image.repository`                                      | Sets the image repository to pull the agent image from.                                                                                                                                  | `sysdig/agent`                                                                                            |
| `image.tag`                                             | Specifies the image tag to pull from the repository.                                                                                                                                     | `12.15.0`                                                                                                 |
| `image.digest`                                          | Specifies the image digest to pull from the repository.                                                                                                                                  | ` `                                                                                                       |
| `image.pullPolicy`                                      | Specifies the Image pull policy.                                                                                                                                                         | `IfNotPresent`                                                                                            |
| `image.pullSecrets`                                     | Specifies the image pull secrets.                                                                                                                                                        | `nil`                                                                                                     |
| `resourceProfile`                                       | Specifies the Sysdig Agent resource profile.                                                                                                                                             | `small`                                                                                                   |
| `resources.requests.cpu`                                | Specifies the CPU requested to run in a node                                                                                                                                             | ` `                                                                                                       |
| `resources.requests.memory`                             | Specifies the memory requested to run in a node.                                                                                                                                         | ` `                                                                                                       |
| `resources.limits.cpu`                                  | Specifies the CPU limit.                                                                                                                                                                 | ` `                                                                                                       |
| `resources.limits.memory`                               | Specifies the memory limit.                                                                                                                                                              | ` `                                                                                                       |
| `collectorSettings.collectorHost`                       | Specifies the IP address or hostname of the collector.                                                                                                                                   | ` `                                                                                                       |
| `collectorSettings.collectorPort`                       | Specifies the port number for the TCP connection of the collector service.                                                                                                               | `6443`                                                                                                    |
| `collectorSettings.ssl`                                 | Specifies whether the collector accepts SSL.                                                                                                                                             | `true`                                                                                                    |
| `collectorSettings.sslVerifyCertificate`                | Set this parameter to `false` if you don't want to verify SSL certificate.                                                                                                               | `true`                                                                                                    |
| `gke.autopilot`                                         | If true, overrides the agent configuration to run on GKE Autopilot clusters.                                                                                                             | `false`                                                                                                   |
| `gke.autopilot.createPriorityClass`                     | If true, required PriorityClass will be created to ensure that the agent pods are scheduled in GKE Autopilot. The parameter uses the name provided by the `priorityClassName` parameter. | `false`                                                                                                   |
| `gke.ephemeralStorage`                                  | Specifies the amount of ephemeral storage to provide to the agent container in GKE Autopilot clusters.                                                                                   | `500Mi`                                                                                                   |
| `rbac.create`                                           | If true, RBAC resources will be created and used.                                                                                                                                        | `true`                                                                                                    |
| `scc.create`                                            | Creates OpenShift's Security Context constraint.                                                                                                                                         | `true`                                                                                                    |
| `psp.create`                                            | Creates Pod Security Policy to allow the agent running in clusters with PSP enabled.                                                                                                     | `true`                                                                                                    |
| `serviceAccount.create`                                 | Creates serviceAccount.                                                                                                                                                                  | `true`                                                                                                    |
| `serviceAccount.name`                                   | Use this value as serviceAccountName.                                                                                                                                                    | ` `                                                                                                       |
| `priorityClassName`                                     | Sets the priority class for the agent daemonset.                                                                                                                                         | `""`                                                                                                      |
| `daemonset.deploy`                                      | Deploys the agent daemonset.                                                                                                                                                             | `true`                                                                                                    |
| `daemonset.env`                                         | Specifies the environment variables for the agent container. Provide as map of `VAR: val`                                                                                                | `{}`                                                                                                      |
| `daemonset.updateStrategy.type`                         | Specifies the updateStrategy for updating the daemonset.                                                                                                                                 | `RollingUpdate`                                                                                           |
| `daemonset.updateStrategy.rollingUpdate.maxUnavailable` | The maximum number of pods that can be unavailable during the update process                                                                                                             |                                                                                                           |
| `daemonset.updateStrategy.rollingUpdate.maxSurge`       | The maximum number of nodes with an existing available DaemonSet pod that can have an updated DaemonSet pod during an update                                                             |                                                                                                           |
| `daemonset.nodeSelector`                                | Specifies the Node Selector.                                                                                                                                                             | `{}`                                                                                                      |
| `daemonset.arch`                                        | Specifies the allowed architectures for scheduling.                                                                                                                                      | `[ amd64, arm64, s390x ]`                                                                                 |
| `daemonset.os`                                          | Specifies the allowed operating systems for scheduling.                                                                                                                                  | `[ linux ]`                                                                                               |
| `daemonset.affinity`                                    | Specifies node affinities. Overrides `daemonset.arch` and `daemonset.os` values.                                                                                                         | `{}`                                                                                                      |
| `daemonset.annotations`                                 | Specifies the custom annotations for daemonset.                                                                                                                                          | `{}`                                                                                                      |
| `daemonset.labels`                                      | Specifies the custom labels for daemonset as a multi-line templated string map or as YAML.                                                                                               |                                                                                                           |
| `daemonset.probes.initialDelay`                         | Specifies the initial delay for liveness and readiness probes daemonset.                                                                                                                 | `{}`                                                                                                      |
| `daemonset.kmodule.env`                                 | Sets the environment variables for the kernel module image builder. Provide as map of `VAR: val`                                                                                         | `{}`                                                                                                      |
| `slim.enabled`                                          | Uses the slim based Sysdig Agent image.                                                                                                                                                  | `true`                                                                                                    |
| `slim.image.repository`                                 | Specifies the slim agent image repository.                                                                                                                                               | `sysdig/agent-slim`                                                                                       |
| `slim.kmoduleImage.repository`                          | Specifies the repository to pull the kernel module image builder from.                                                                                                                   | `sysdig/agent-kmodule`                                                                                    |
| `slim.kmoduleImage.digest`                              | Specifies the image digest to pull.                                                                                                                                                      | ` `                                                                                                       |
| `slim.resources.requests.cpu`                           | Specifies the CPU requested for building the kernel module.                                                                                                                              | `1000m`                                                                                                   |
| `slim.resources.requests.memory`                        | Specifies the memory requested for building the kernel module.                                                                                                                           | `348Mi`                                                                                                   |
| `slim.resources.limits.cpu`                             | Specifies the CPU limit for building the kernel module                                                                                                                                   | `1000m`                                                                                                   |
| `slim.resources.limits.memory`                          | Specifies the memory limit for building the kernel module.                                                                                                                               | `512Mi`                                                                                                   |
| `ebpf.enabled`                                          | Enables eBPF support for Sysdig instead of `sysdig-probe` kernel module.                                                                                                                 | `false`                                                                                                   |
| `ebpf.settings.mountEtcVolume`                          | Detects which kernel version is running in Google COS.                                                                                                                                   | `true`                                                                                                    |
| `clusterName`                                           | Sets a unique cluster name which is used to identify events with the `kubernetes.cluster.name` tag. Overrides `global.clusterConfig.name`.                                               | ` `                                                                                                       |
| `sysdig.accessKey`                                      | Your Sysdig Agent Access Key. Overrides `global.sysdig.accessKey`                                                                                                                        | Either `accessKey` or `existingAccessKeySecret` is required                                               |
| `sysdig.existingAccessKeySecret`                        | Specifies the name of a Kubernetes secret containing an `access-key ` entry. Overrides `global.sysdig.existingAccessKeySecret`                                                           | Either `accessKey` or `existingAccessKeySecret` is required                                               |
| `sysdig.disableCaptures`                                | Disables capture functionality. See https://docs.sysdig.com/en/disable-captures.html.                                                                                                    | `false`                                                                                                   |
| `sysdig.settings`                                       | Provides additional settings that are given  in the `dragent.yaml`file.                                                                                                                  | `{}`                                                                                                      |
| `logPriority`                                           | Sets both agent console and file logging priorities. Possible values are: `"info"`, `"debug"`. Mutually exclusive with `sysdig.settings.log`.                                            | ` `                                                                                                       |
| `secure.enabled`                                        | Enables Sysdig Secure.                                                                                                                                                                   | `true`                                                                                                    |
| `monitor.enabled`                                       | Enables Sysdig Monitor.                                                                                                                                                                  | `true`                                                                                                    |
| `auditLog.enabled`                                      | Enables Kubernetes audit log support for Sysdig Secure.                                                                                                                                  | `false`                                                                                                   |
| `auditLog.auditServerUrl`                               | Specifies the URL where Sysdig Agent listens for the Kubernetes audit log events.                                                                                                        | `0.0.0.0`                                                                                                 |
| `auditLog.auditServerPort`                              | Specifies the port where Sysdig Agent listens for the Kubernetes audit log events.                                                                                                       | `7765`                                                                                                    |
| `auditLog.dynamicBackend.enabled`                       | Deploys the Audit Sink where Sysdig listens for Kubernetes audit log events.                                                                                                             | `false`                                                                                                   |
| `tolerations`                                           | Specifies the tolerations for scheduling.                                                                                                                                                | <pre>node-role.kubernetes.io/master:NoSchedule,<br>node-role.kubernetes.io/control-plane:NoSchedule</pre> |                                                              |
| `leaderelection.enable`                                 | Enables the agent leader election algorithm.                                                                                                                                             | `false`                                                                                                   |
| `prometheus.file`                                       | Specifies the file to configure promscrape.                                                                                                                                              | `false`                                                                                                   |
| `prometheus.yaml`                                       | Configures the Prometheus metric collection. Performs relabelling and filtering.                                                                                                         | ` `                                                                                                       |
| `extraVolumes.volumes`                                  | Specifies the additional volumes to mount in the sysdig agent to pass new secrets or configmaps                                                                                          | `[]`                                                                                                      |
| `extraVolumes.mounts`                                   | Specifies the mount points for additional volumes                                                                                                                                        | `[]`                                                                                                      |
| `extraSecrets`                                          | Allows passing extra secrets that can be mounted via extraVolumes                                                                                                                        | `[]`                                                                                                      |
| `proxy.httpProxy`                                       | Sets `http_proxy` on the agent container. Overrides the proxy setting from `global.proxy`.                                                                                               | `""`                                                                                                      |
| `proxy.httpsProxy`                                      | Sets `https_proxy` on the agent container. Overrides the proxy setting from `global.proxy`.                                                                                              | `""`                                                                                                      |
| `proxy.noProxy`                                         | Sets `no_proxy` on the agent container. Overrides the proxy setting from `global.proxy`.                                                                                                 | `""`                                                                                                      |
