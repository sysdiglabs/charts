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

|                       Parameter                       |                                                                                       Description                                                                                       |              Default              |
|-------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|
| global.clusterConfig.name                             | Sets a unique name to the cluster. You can then use the cluster name to identify events using the `kubernetes.cluster.name` tag                                                         | <code>""</code>                   |
| global.sysdig.accessKey                               | Specify your Sysdig Agent Access Key                                                                                                                                                    | <code>""</code>                   |
| global.sysdig.accessKeySecret                         | An alternative to using the Sysdig Agent access key. Specify the name of a Kubernetes secret containing an `access-key` entry                                                           | <code>""</code>                   |
| global.sysdig.region                                  | The SaaS region for these agents. Possible values: `"us1"`, `"us2"`, `"us3"`, `"us4"`, `"eu1"`, `"au1"`, and `"custom"`                                                                 | <code>"us1"</code>                |
| global.gke.autopilot                                  | true here enables the deployment on gke autopilot clusters                                                                                                                              | <code>false</code>                |
| global.gke.ephemeralStorage                           | Specifies the amount of ephemeral storage to provide to the agent container in GKE Autopilot clusters                                                                                   | <code>"500Mi"</code>              |
| global.image.pullSecrets                              | Global pull secrets                                                                                                                                                                     | <code>[]</code>                   |
| global.image.pullPolicy                               | Global pull policy                                                                                                                                                                      | <code>IfNotPresent</code>         |
| namespace                                             | Overrides the global namespace setting and release namespace for components                                                                                                             | <code>""</code>                   |
| image.overrideValue                                   | This is a hack to support RELATED_IMAGE_<identifier> feature in Helm based Operators As long as I don't want to people to use this, I will keep it undocumented                         | <code>null</code>                 |
| image.registry                                        | Sysdig Agent image registry                                                                                                                                                             | <code>quay.io</code>              |
| image.repository                                      | Sets the image repository to pull the agent image from                                                                                                                                  | <code>sysdig/agent</code>         |
| image.tag                                             | Specifies the desired image tag                                                                                                                                                         | <code>12.18.0</code>              |
| image.pullPolicy                                      | Specifies the Image pull policy                                                                                                                                                         | <code>[]</code>                   |
| image.pullSecrets                                     | Specifies the image pull secrets                                                                                                                                                        | <code>[]</code>                   |
| resourceProfile                                       | Specify a predefined resource profile. Options are `small`, `medium`, or `large`.                                                                                                       | <code>small</code>                |
| resources.requests.cpu                                | Specifies the CPU requested to run per pod                                                                                                                                              | <code>""</code>                   |
| resources.requests.memory                             | Specifies the memory requested to run per pod                                                                                                                                           | <code>""</code>                   |
| resources.limits.cpu                                  | Specifies the CPU limit per pod                                                                                                                                                         | <code>""</code>                   |
| resources.limits.memory                               | Specifies the memory limit per pod                                                                                                                                                      | <code>""</code>                   |
| gke.autopilot                                         | true here enables the deployment on gke autopilot clusters                                                                                                                              | <code>false</code>                |
| gke.createPriorityClass                               | If true, required PriorityClass will be created to ensure that the agent pods are scheduled in GKE Autopilot. The parameter uses the name provided by the `priorityClassName` parameter | <code>false</code>                |
| gke.ephemeralStorage                                  | Specifies the amount of ephemeral storage to provide to the agent container in GKE Autopilot clusters                                                                                   | <code>"500Mi"</code>              |
| rbac.create                                           | true here enables creation of rbac resources                                                                                                                                            | <code>true</code>                 |
| scc.create                                            | true here enables creation of Security Context Constraints in Openshift                                                                                                                 | <code>true</code>                 |
| psp.create                                            | true here enables creation of Pod Security Policy to allow the agent run with the required permissions                                                                                  | <code>true</code>                 |
| serviceAccount.create                                 | Create and use serviceAccount resources                                                                                                                                                 | <code>true</code>                 |
| serviceAccount.name                                   | Use this value as serviceAccountName                                                                                                                                                    | <code>null</code>                 |
| daemonset.deploy                                      |                                                                                                                                                                                         | <code>true</code>                 |
| daemonset.updateStrategy.type                         | You can also customize maxUnavailable, maxSurge or minReadySeconds if you need it                                                                                                       | <code>RollingUpdate</code>        |
| daemonset.updateStrategy.rollingUpdate.maxSurge       | The maximum number of nodes with an existing available DaemonSet pod that can have an updated DaemonSet pod during an update                                                            | <code>""</code>                   |
| daemonset.updateStrategy.rollingUpdate.maxUnavailable | The maximum number of pods that can be unavailable during the update process                                                                                                            | <code>""</code>                   |
| daemonset.env                                         | # Extra environment variables that will be pass onto deployment pods                                                                                                                    | <code>{}</code>                   |
| daemonset.nodeSelector                                | Specifies the desired Node Selector.                                                                                                                                                    | <code>{}</code>                   |
| daemonset.affinity                                    | Specifies node affinities. Overrides daemonset.arch and daemonset.os values.                                                                                                            | <code>{}</code>                   |
| daemonset.annotations                                 | Allow the DaemonSet to set annotations                                                                                                                                                  | <code>{}</code>                   |
| daemonset.labels                                      | Allow the DaemonSet to set labels                                                                                                                                                       | <code>{}</code>                   |
| daemonset.probes.initialDelay                         | Specifies the initial delay for the daemonset readiness probe                                                                                                                           | <code>90</code>                   |
| daemonset.probes.periodDelay                          | Specifies the period delay for the daemonset readiness probe                                                                                                                            | <code>3</code>                    |
| daemonset.kmodule.env                                 | Sets the environment variables for the kernel module image builder container                                                                                                            | <code>{}</code>                   |
| proxy.httpProxy                                       | Sets `http_proxy` on the agent container. Overrides the proxy setting from `global.proxy`                                                                                               | <code>null</code>                 |
| proxy.httpsProxy                                      | Sets `https_proxy` on the agent container. Overrides the proxy setting from `global.proxy`                                                                                              | <code>null</code>                 |
| proxy.noProxy                                         | Sets `no_proxy` on the agent container. Overrides the proxy setting from `global.proxy`                                                                                                 | <code>null</code>                 |
| timezone                                              | Set daemonset timezone                                                                                                                                                                  | <code>null</code>                 |
| createPriorityClass                                   | Create the priorityClass defined below                                                                                                                                                  | <code>false</code>                |
| priorityClassName                                     | Set daemonset priorityClassName                                                                                                                                                         | <code>null</code>                 |
| priorityClassValue                                    | Set daemonset priorityClassValue                                                                                                                                                        | <code>10</code>                   |
| ebpf.enabled                                          | Enable eBPF support for Sysdig Agent                                                                                                                                                    | <code>false</code>                |
| ebpf.kind                                             | Define the kind of eBPF driver that will be used by the agent. Can be `legacy_ebpf` or `universal_ebpf`                                                                                 | <code>legacy_ebpf</code>          |
| slim.enabled                                          | Uses a slim version of the Sysdig Agent                                                                                                                                                 | <code>true</code>                 |
| slim.image.repository                                 | Specifies the slim agent image repository                                                                                                                                               | <code>sysdig/agent-slim</code>    |
| slim.kmoduleImage.repository                          | Specifies the repository to pull the kernel module image builder from                                                                                                                   | <code>sysdig/agent-kmodule</code> |
| slim.kmoduleImage.digest                              | Specifies the image digest to pull                                                                                                                                                      | <code>null</code>                 |
| slim.resources.requests.cpu                           | Specifies the CPU requested for building the kernel module                                                                                                                              | <code>250m</code>                 |
| slim.resources.requests.memory                        | Specifies the memory requested for building the kernel module                                                                                                                           | <code>348Mi</code>                |
| slim.resources.limits.cpu                             | Specifies the CPU limit for building the kernel module                                                                                                                                  | <code>1000m</code>                |
| slim.resources.limits.memory                          | Specifies the memory limit for building the kernel module                                                                                                                               | <code>512Mi</code>                |
| collectorSettings.collectorHost                       | Specifies the IP address or hostname of the collector.                                                                                                                                  | <code>null</code>                 |
| collectorSettings.collectorPort                       | Specifies the port number for the TCP connection of the collector service                                                                                                               | <code>null</code>                 |
| collectorSettings.ssl                                 | Specifies whether the collector accepts SSL                                                                                                                                             | <code>true</code>                 |
| collectorSettings.sslVerifyCertificate                | Set this parameter to `false` if you don't want to verify SSL certificate                                                                                                               | <code>null</code>                 |
| clusterName                                           | Setting a cluster name allows you to filter events from this cluster using kubernetes.cluster.name                                                                                      | <code>""</code>                   |
| sysdig.accessKey                                      | Required: You need your Sysdig Agent access key before running agents, either specifying 'accessKey' here, or using 'existingAccessKeySecret'                                           | <code>""</code>                   |
| sysdig.existingAccessKeySecret                        | Alternatively, specify the name of a Kubernetes secret containing an 'access-key' entry                                                                                                 | <code>""</code>                   |
| sysdig.disableCaptures                                | Disable capture functionality (see https://docs.sysdig.com/en/disable-captures.html)                                                                                                    | <code>false</code>                |
| sysdig.settings                                       | Advanced settings. Any option in here will be directly translated into dragent.yaml in the Configmap                                                                                    | <code>{}</code>                   |
| secure.enabled                                        | true here enables Sysdig Secure: container run-time security & forensics                                                                                                                | <code>true</code>                 |
| monitor.enabled                                       | true here enables Sysdig Monitor components                                                                                                                                             | <code>true</code>                 |
| auditLog.enabled                                      | true here activates the K8s Audit Log feature for Sysdig Secure                                                                                                                         | <code>true</code>                 |
| auditLog.auditServerUrl                               | Specifies the URL where Sysdig Agent listens for the Kubernetes audit log events                                                                                                        | <code>0.0.0.0</code>              |
| auditLog.auditServerPort                              | Specifies the port where Sysdig Agent listens for the Kubernetes audit log events                                                                                                       | <code>7765</code>                 |
| auditLog.dynamicBackend.enabled                       | true here configures an AuditSink who will receive the K8s audit logs                                                                                                                   | <code>false</code>                |
| prometheus.file                                       | Specifies the file to configure promscrape.                                                                                                                                             | <code>false</code>                |
| prometheus.yaml                                       | Configures the Prometheus metric collection. Performs relabelling and filtering                                                                                                         | <code>{}</code>                   |
| extraVolumes.volumes                                  | Specifies the additional volumes to mount in the Sysdig Agent to pass new secrets or configmaps                                                                                         | <code>[]</code>                   |
| extraVolumes.mounts                                   | Specifies the mount points for additional volumes                                                                                                                                       | <code>[]</code>                   |
| extraSecrets                                          | Allows passing extra secrets that can be mounted via extraVolumes                                                                                                                       | <code>[]</code>                   |
| leaderelection.enable                                 | Enables the agent leader election algorithm                                                                                                                                             | <code>false</code>                |
| localForwarder.enabled                                | Enables the Agent Local Forwarder                                                                                                                                                       | <code>false</code>                |
| localForwarder.integrations                           | List of configurations for how and where the Agent Local Forwarder should forward messages See https://docs.sysdig.com/en/docs/sysdig-secure/secure-events/event-forwarding/            | <code>[]</code>                   |
| logPriority                                           | Allow direct setting of Agent log priority levels for console and file logs (info|debug)                                                                                                | <code>null</code>                 |

