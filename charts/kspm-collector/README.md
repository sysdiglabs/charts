# Chart: KSPM Collector

## Overview

The KSPM Collector collects Kubernetes resource manifests and sends them to be evaluated against Sysdig compliance policies. The scan results are displayed on the [Compliance UI](https://docs.sysdig.com/en/docs/sysdig-secure/posture/compliance/) in Sysdig Secure.

Use the [sysdig-deploy](../sysdig-deploy/README.md) parent chart to deploy the KSPM collector. Do not deploy subcharts directly.

For installation instructions, see [Install Agent Components on Kubernetes](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-agent-components/kubernetes/).

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

The following table lists the configurable parameters of the Sysdig KSPM Collector chart and their default values.

| Parameter                                  | Description                                                                                                                                       | Default                                                     |
|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| `global.proxy.httpProxy`                   | Sets `HTTP_PROXY` on the KSPM collector containers.                                                                                               | `""`                                                        |
| `global.proxy.httpsProxy`                  | Sets `HTTPS_PROXY` on the KSPM collector containers.                                                                                              | `""`                                                        |
| `global.proxy.noProxy`                     | Sets `NO_PROXY` on the KSPM collector containers.                                                                                                 | `""`                                                        |
| `global.sslVerifyCertificate`              | Sets `NATS_INSECURE` environment variable on the KSPM collector containers.                                                                       |                                                             |
| `global.kspm.deploy`                       | Enables Sysdig KSPM node analyzer & KSPM collector.                                                                                               | `true`                                                      |
| `global.image.pullSecrets`                 | Specifies the global pull secrets.                                                                                                                | <code>[]</code>                                             |
| `global.image.pullPolicy`                  | Specifies the global pull policy.                                                                                                                 | <code>`Always`</code>                                       |
| `global.sysdig.tags`                       | The list of custom tags to be assigned to the components.                                                                                         | `{}`                                                        |
| `sysdig.accessKey`                         | Specifies your Sysdig Access Key.                                                                                                                 | ` ` Either accessKey or existingAccessKeySecret is required |
| `sysdig.existingAccessKeySecret`           | Specifies the name of a Kubernetes secret containing an `access-key` entry.  Alternative to using Sysdig Access Key.                              | ` ` Either accessKey or existingAccessKeySecret is required |
| `rbac.create`                              | If sets to true,  RBAC resources will be created and used.                                                                                        | `true`                                                      |
| `serviceAccount.create`                    | Creates serviceAccount.                                                                                                                           | `true`                                                      |
| `serviceAccount.name`                      | The value you specify will be used as `serviceAccountName`.                                                                                       | `kspm-collector`                                            |
| `clusterName`                              | Sets a unique cluster name. This name will be used to identify events using the `kubernetes.cluster.name` tag.                                    | ` `                                                         |
| `image.registry`                           | Specifies the KSPM collector image registry.                                                                                                      | `quay.io`                                                   |
| `image.repository`                         | Specifies the image repository to pull from.                                                                                                      | `sysdig/kspm-collector`                                     |
| `image.tag`                                | Specifies the image tag to pull from the image repository.                                                                                        | `1.39.3`                                                    |
| `image.digest`                             | Specifies the image digest to pull from the image repository.                                                                                     | ` `                                                         |
| `image.pullPolicy`                         | Specifies theImage pull policy.                                                                                                                   | `""`                                                        |
| `imagePullSecrets`                         | Specifies the Image pull secret.                                                                                                                  | `[]`                                                        |
| `replicas`                                 | Specifies the KSPM collector deployment replicas.                                                                                                 | `1`                                                         |
| `namespaces.included`                      | Specifies the namespaces to include in the KSPM collector scans. If left empty, all the namesapces will be scanned.                               | ``                                                          |
| `namespaces.excluded`                      | Specifies the namespaces to exclude in the KSPM collector scans.                                                                                  | ``                                                          |
| `nodeSelector`                             | Specifies the Node Selector.                                                                                                                      | `{}`                                                        |
| `workloads.included`                       | Specifies the workloads to include in the KSPM collector scans. If left empty, all the workloads will be scanned.                                 | ``                                                          |
| `workloads.excluded`                       | Specifies the workloads to exclude in the KSPM collector scans.  If left empty, all the workloads will be scanned.                                | ``                                                          |
| `healthIntervalMin`                        | Specifies the minutes interval for KSPM collector health status messages.                                                                         | `5`                                                         |
| `resources.requests.cpu`                   | Specifies the KSPM collector CPU requests.                                                                                                        | `150m`                                                      |
| `resources.requests.memory`                | Specifies the KSPM collector memory requests.                                                                                                     | `256Mi`                                                     |
| `resources.limits.cpu`                     | Specifies the KSPM collector CPU limits.                                                                                                          | `500m`                                                      |
| `resources.limits.memory`                  | Specifies the KSPM collector memory limits                                                                                                        | `1536Mi`                                                    |
| `priorityClassName`                        | Specifies the name of an existing PriorityClass for the KSPM collector to use.                                                                    | `{}`                                                        |
| `apiEndpoint`                              | Specifies the API end point of the KSPM collector.                                                                                                | `""`                                                        |
| `httpProxy`                                | Specifies the proxy configuration variables.                                                                                                      |                                                             |
| `httpsProxy`                               | Specifies the proxy configuration variables.                                                                                                      |                                                             |
| `noProxy`                                  | Specifies the proxy configuration variables.                                                                                                      |                                                             |
| `natsMaxReconnect`                         | Sets `natsMaxReconnect ` configuration variables. Set to '-1' for unlimited reconnect attempts to NATS, or leave empty for default (60 attempts). | `0`                                                         |
| `natsMaxReconnectFailures`                 | Sets `natsMaxReconnectFailures ` configuration variables. Set to '-1' to disable or leave empty for default (60 attempts).                        | `60`                                                        |
| `sslVerifyCertificate`                     | Sets `NATS_INSECURE` env variable on the KSPM collector containers.                                                                               |                                                             |
| `arch`                                     | Specifies the allowed architectures for scheduling.                                                                                               | `[ amd64, arm64 ]`                                          |
| `os`                                       | Specifies the allowed operating systems for scheduling.                                                                                           | `[ linux ]`                                                 |
| `affinity`                                 | Specifies the node affinities. Overrides `arch` and `os` values.                                                                                  | `{}`                                                        |
| `labels`                                   | Specifies the KSPM collector specific labels as a multi-line templated string map or as YAML.                                                     | `{}`                                                        |
| `annotations`                              | Specifies the deployment annotations as a multi-line templated string map or as YAML.                                                             | `{}`                                                        |
| `podAnnotations`                           | Specifies the pod annotations as a multi-line templated string map or as YAML.                                                                    | `{}`                                                        |
| `port`                                     | Specifies the KSPM collector port for health checks.                                                                                              | `8080`                                                      |
| `psp.create`                               | Creates Pod Security Policy to allow the KSPM collector running in PSP-enabled clusters.                                                          | `true`                                                      |
| `readinessProbe.enabled`                   | Specifies whether KSPM collector readinessProbe is enabled or not.                                                                                | `true`                                                      |
| `livenessProbe.enabled`                    | Specifies whether KSPM collector livenessProbe is enabled or not.                                                                                 | `true`                                                      |
| `scc.create`                               | Creates OpenShift's Security Context constraint.                                                                                                  | `true`                                                      |
| `securityContext.runAsNonRoot`             | Makes KSPM collector run as a non-root container.                                                                                                 | `true`                                                      |
| `securityContext.runAsUser`                | The user ID you specify will be used to run the KSPM collector.                                                                                   | `10001`                                                     |
| `securityContext.runAsGroup`               | The group ID you specify will be used to run the KSPM collector.                                                                                  | `10001`                                                     |
| `securityContext.readOnlyRootFilesystem`   | Changes the root file system of the KSPM collector to read only                                                                                   | `true`                                                      |
| `securityContext.allowPrivilegeEscalation` | Allows KSPM collector apps to gain priviledges stronger than their parent process.                                                                | `false`                                                     |
| `securityContext.capabilities.drop`        | Specifies the Linux capabilities to be taken from KSPM collector.                                                                                 | `['all']`                                                   |
| `tolerations`                              | Specifies the tolerations for scheduling.                                                                                                         | `kubernetes.io/arch=arm64:NoSchedule`                       |
