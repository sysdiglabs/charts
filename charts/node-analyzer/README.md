# Chart: Node Analyzer

The Node Analyzer (NA) provides a method for deploying the components for three different Sysdig Secure features:

The Node Analyzer is deployed by default unless you set the value `nodeAnalyzer.deploy` to `false`.

The Node Analyzer daemonset contains three containers, each providing a specific functionality. This daemonset replaces
the (deprecated) Node Image Analyzer daemonset.

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installing the Chart](#installing-the-chart)
- [Uninstalling the Chart](#uninstalling-the-chart)
- [Configuration](#configuration)
- [Support](#support)

## Introduction

This chart adds the Sysdig Node Analyzer to all nodes in your cluster via a DaemonSet.

## Prerequisites

- Kubernetes 1.9+ with Beta APIs enabled

## Installing the Chart

First of all you need to add the Sysdig Helm Charts repository:

```bash
$ helm repo add sysdig https://charts.sysdig.com/
```

To install the chart with the release name `node-analyzer`, run:

```bash
$ helm install --namespace nodeanalyzer node-analyzer --set sysdig.accessKey=YOUR-KEY-HERE --set sysdig.settings.collector=COLLECTOR_URL sysdig/node-analyzer --set nodeAnalyzer.apiEndpoint=API_ENDPOINT
```

To find the values:

- YOUR-KEY-HERE: This is the sysdig access key.
- COLLECTOR_URL: This value is region-dependent in SaaS and is auto-completed on the Get Started page in the UI. (It is
  a custom value in on-prem installations.)
- API_ENDPOINT: This is the base URL (region-dependent) for Sysdig Secure and is auto-completed on the Get Started page.
  E.g. secure.sysdig.com, us2.app.sysdig.com, eu1.app.sysdig.com.

After a few seconds, you should see hosts and containers appearing in Sysdig Monitor and Sysdig Secure.

> **Tip**: List all releases using `helm list`

See
the [Node Analyzer installation documentation](https://docs.sysdig.com/en/node-analyzer--multi-feature-installation.html)
for details about installation, and
[Running Node Analyzer Behind a Proxy](https://docs.sysdig.com/en/node-analyzer--multi-feature-installation.html#UUID-35c14c46-b327-c2a8-ed9c-82a2af995218_section-idm51621039128136)
for proxy settings.

## Uninstalling the Chart

To uninstall/delete the `sysdig-agent` deployment:

```bash
$ helm delete --namespace nodeanalyzer node-analyzer
```

> **Tip**: Use `helm delete --namespace nodeanalyzer --purge node-analyzer` to completely remove the release from Helm internal storage

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Sysdig Node Analyzer chart and their default values.

| Parameter                                                            | Description                                                                              | Default                                                                        |
|----------------------------------------------------------------------|------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| `global.sysdig.region`                                               | Region name for Sysdig. Valid options are `us1`, `us2`, `us3`, `us4`, `eu1`, and `au1`.  | `us1`                                                                          |
| `global.proxy.httpProxy`                                             | Sets `HTTP_PROXY` on the Node Analyzer containers                                        | `""`                                                                           |
| `global.proxy.httpsProxy`                                            | Sets `HTTPS_PROXY` on the Node Analyzer containers                                       | `""`                                                                           |
| `global.proxy.noProxy`                                               | Sets `NO_PROXY` on the Node Analyzer containers                                          | `""`                                                                           |
| `image.registry`                                                     | Sysdig Agent image registry                                                              | `quay.io`                                                                      |
| `image.pullPolicy`                                                   | The Image pull policy                                                                    | `IfNotPresent`                                                                 |
| `image.pullSecrets`                                                  | Image pull secrets                                                                       | `nil`                                                                          |
| `gke.autopilot`                                                      | If true, overrides the agent configuration to run on GKE Autopilot clusters              | `false`                                                                        |
| `rbac.create`                                                        | If true, create & use RBAC resources                                                     | `true`                                                                         |
| `scc.create`                                                         | Create OpenShift's Security Context Constraint                                           | `true`                                                                         |
| `psp.create`                                                         | Create Pod Security Policy to allow the agent running in clusters with PSP enabled       | `true`                                                                         |
| `clusterName`                                                        | Set a cluster name to identify events using *kubernetes.cluster.name* tag                | ` `                                                                            |
| `sysdig.accessKey`                                                   | Your Sysdig Agent Access Key                                                             | ` ` Either accessKey or existingAccessKeySecret is required                    |
| `sysdig.existingAccessKeySecret`                                     | Alternatively, specify the name of a Kubernetes secret containing an 'access-key' entry  | ` ` Either accessKey or existingAccessKeySecret is required                    |
| `secure.enabled`                                                     | Enable Sysdig Secure                                                                     | `true`                                                                         |
| `nodeAnalyzer.deploy`                                                | Deploy the Node Analyzer                                                                 | `true`                                                                         |
| `nodeAnalyzer.apiEndpoint`                                           | Sysdig secure API endpoint, without protocol (i.e. `secure.sysdig.com`)                  | ` `                                                                            |
| `nodeAnalyzer.sslVerifyCertificate`                                  | Can be set to false to allow insecure connections to the Sysdig backend, such as On-Prem |                                                                                |
| `nodeAnalyzer.debug`                                                 | Can be set to true to show debug logging, useful for troubleshooting                     |                                                                                |
| `nodeAnalyzer.labels`                                                | NodeAnalyzer specific labels (as a multi-line templated string map or as YAML)           |                                                                                |
| `nodeAnalyzer.priorityClassName`                                     | Priority class name variable                                                             |                                                                                |
| `nodeAnalyzer.httpProxy`                                             | Proxy configuration variables                                                            |                                                                                |
| `nodeAnalyzer.httpsProxy`                                            | Proxy configuration variables                                                            |                                                                                |
| `nodeAnalyzer.noProxy`                                               | Proxy configuration variables                                                            |                                                                                |
| `nodeAnalyzer.pullSecrets`                                           | Image pull secrets for the Node Analyzer containers                                      | `nil`                                                                          |
| `nodeAnalyzer.imageAnalyzer.image.repository`                        | The image repository to pull the Node Image Analyzer from                                | `sysdig/node-image-analyzer`                                                   |
| `nodeAnalyzer.imageAnalyzer.image.tag`                               | The image tag to pull the Node Image Analyzer                                            | `0.1.16`                                                                       |
| `nodeAnalyzer.imageAnalyzer.image.digest`                            | The image digest to pull                                                                 | ` `                                                                            |
| `nodeAnalyzer.imageAnalyzer.image.pullPolicy`                        | The Image pull policy for the Node Image Analyzer                                        | `IfNotPresent`                                                                 |
| `nodeAnalyzer.imageAnalyzer.dockerSocketPath`                        | The Docker socket path                                                                   |                                                                                |
| `nodeAnalyzer.imageAnalyzer.criSocketPath`                           | The socket path to a CRI compatible runtime, such as CRI-O                               |                                                                                |
| `nodeAnalyzer.imageAnalyzer.containerdSocketPath`                    | The socket path to a CRI-Containerd daemon                                               |                                                                                |
| `nodeAnalyzer.imageAnalyzer.extraVolumes.volumes`                    | Additional volumes to mount in the Node Image Analyzer (i.e. for docker socket)          | `[]`                                                                           |
| `nodeAnalyzer.imageAnalyzer.extraVolumes.mounts`                     | Mount points for additional volumes                                                      | `[]`                                                                           |
| `nodeAnalyzer.imageAnalyzer.resources.requests.cpu`                  | Node Image Analyzer CPU requests per node                                                | `150m`                                                                         |
| `nodeAnalyzer.imageAnalyzer.resources.requests.memory`               | Node Image Analyzer Memory requests per node                                             | `512Mi`                                                                        |
| `nodeAnalyzer.imageAnalyzer.resources.limits.cpu`                    | Node Image Analyzer CPU limit per node                                                   | `500m`                                                                         |
| `nodeAnalyzer.imageAnalyzer.resources.limits.memory`                 | Node Image Analyzer Memory limit per node                                                | `1536Mi`                                                                       |
| `nodeAnalyzer.hostAnalyzer.image.repository`                         | The image repository to pull the Host Analyzer from                                      | `sysdig/host-analyzer`                                                         |
| `nodeAnalyzer.hostAnalyzer.image.tag`                                | The image tag to pull the Host Analyzer                                                  | `0.1.6`                                                                        |
| `nodeAnalyzer.hostAnalyzer.image.digest`                             | The image digest to pull                                                                 | ` `                                                                            |
| `nodeAnalyzer.hostAnalyzer.image.pullPolicy`                         | The Image pull policy for the Host Analyzer                                              | `IfNotPresent`                                                                 |
| `nodeAnalyzer.hostAnalyzer.schedule`                                 | The scanning schedule specification for the host analyzer expressed as a crontab         | `@dailydefault`                                                                |
| `nodeAnalyzer.hostAnalyzer.dirsToScan`                               | The list of directories to inspect during the scan                                       | `/etc,/var/lib/dpkg,/usr/local,/usr/lib/sysimage/rpm,/var/lib/rpm,/lib/apk/db` |
| `nodeAnalyzer.hostAnalyzer.maxSendAttempts`                          | The number of times the analysis collector is allowed to retry sending results           | `3`                                                                            |
| `nodeAnalyzer.hostAnalyzer.resources.requests.cpu`                   | Host Analyzer CPU requests per node                                                      | `150m`                                                                         |
| `nodeAnalyzer.hostAnalyzer.resources.requests.memory`                | Host Analyzer Memory requests per node                                                   | `512Mi`                                                                        |
| `nodeAnalyzer.hostAnalyzer.resources.limits.cpu`                     | Host Analyzer CPU limit per node                                                         | `500m`                                                                         |
| `nodeAnalyzer.hostAnalyzer.resources.limits.memory`                  | Host Analyzer Memory limit per node                                                      | `1536Mi`                                                                       |
| `nodeAnalyzer.benchmarkRunner.image.repository`                      | The image repository to pull the Benchmark Runner from                                   | `sysdig/compliance-benchmark-runner`                                           |
| `nodeAnalyzer.benchmarkRunner.image.tag`                             | The image tag to pull the Benchmark Runner                                               | `1.0.17.0`                                                                     |
| `nodeAnalyzer.benchmarkRunner.image.digest`                          | The image digest to pull                                                                 | ` `                                                                            |
| `nodeAnalyzer.benchmarkRunner.image.pullPolicy`                      | The Image pull policy for the Benchmark Runner                                           | `IfNotPresent`                                                                 |
| `nodeAnalyzer.benchmarkRunner.includeSensitivePermissions`           | Grant the service account elevated permissions to run CIS Benchmark for OS4              | `false`                                                                        |
| `nodeAnalyzer.benchmarkRunner.resources.requests.cpu`                | Benchmark Runner CPU requests per node                                                   | `150m`                                                                         |
| `nodeAnalyzer.benchmarkRunner.resources.requests.memory`             | Benchmark Runner Memory requests per node                                                | `128Mi`                                                                        |
| `nodeAnalyzer.benchmarkRunner.resources.limits.cpu`                  | Benchmark Runner CPU limit per node                                                      | `500m`                                                                         |
| `nodeAnalyzer.benchmarkRunner.resources.limits.memory`               | Benchmark Runner Memory limit per node                                                   | `256Mi`                                                                        |
| `nodeAnalyzer.runtimeScanner.deploy`                                 | Deploy the Runtime Scanner                                                               | `false`                                                                        |
| `nodeAnalyzer.runtimeScanner.image.repository`                       | The image repository to pull the Runtime Scanner from                                    | `sysdig/eveclient-api`                                                         |
| `nodeAnalyzer.runtimeScanner.image.tag`                              | The image tag to pull the Runtime Scanner                                                | `0.1.0`                                                                        |
| `nodeAnalyzer.runtimeScanner.image.digest`                           | The image digest to pull                                                                 | ` `                                                                            |
| `nodeAnalyzer.runtimeScanner.image.pullPolicy`                       | The image pull policy for the Runtime Scanner                                            | `IfNotPresent`                                                                 |
| `nodeAnalyzer.runtimeScanner.resources.requests.cpu`                 | Runtime Scanner CPU requests per node                                                    | `250m`                                                                         |
| `nodeAnalyzer.runtimeScanner.resources.requests.memory`              | Runtime Scanner Memory requests per node                                                 | `512Mi`                                                                        |
| `nodeAnalyzer.runtimeScanner.resources.requests.ephemeral-storage`   | Runtime Scanner Storage requests per node                                                | `2Gi`                                                                          |
| `nodeAnalyzer.runtimeScanner.resources.limits.cpu`                   | Runtime Scanner CPU limit per node                                                       | `500m`                                                                         |
| `nodeAnalyzer.runtimeScanner.resources.limits.memory`                | Runtime Scanner Memory limit per node                                                    | `1536Mi`                                                                       |
| `nodeAnalyzer.runtimeScanner.resources.limits.ephemeral-storage`     | Runtime Scanner Storage limit per node                                                   | `4Gi`                                                                          |
| `nodeAnalyzer.runtimeScanner.settings.eveEnabled`                    | Enables Sysdig Eve                                                                       | `false`                                                                        |
| `nodeAnalyzer.runtimeScanner.eveConnector.deploy`                    | Enables Sysdig Eve Connector for third-party integrations                                | `false`                                                                        |
| `nodeAnalyzer.runtimeScanner.eveConnector.resources.requests.cpu`    | Eve Connector CPU requests per node                                                      | `100m`                                                                         |
| `nodeAnalyzer.runtimeScanner.eveConnector.resources.requests.memory` | Eve Connector Memory requests per node                                                   | `128Mi`                                                                        |
| `nodeAnalyzer.runtimeScanner.eveConnector.resources.limits.cpu`      | Eve Connector CPU limits per node                                                        | `1000m`                                                                        |
| `nodeAnalyzer.runtimeScanner.eveConnector.resources.limits.memory`   | Eve Connector Memory limits per node                                                     | `512Mi`                                                                        |
| `nodeAnalyzer.runtimeScanner.eveConnector.settings.replicas`         | Eve Connector deployment replicas                                                        | `1`                                                                            |
| `nodeAnalyzer.nodeSelector`                                          | Node Selector                                                                            | `{}`                                                                           |
| `nodeAnalyzer.affinity`                                              | Node affinities                                                                          | `schedule on amd64 and linux`                                                  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --namespace nodeanalyzer node-analyzer \
    --set sysdig.accessKey=YOUR-KEY-HERE, \
    sysdig/node-analyzer
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For
example,

```bash
$ helm install --namespace nodeanalyzer node-analyzer -f values.yaml sysdig/node-analyzer
```

> **Tip**: You can use the default [values.yaml](values.yaml)
## Chart Components

### Node Image Analyzer

See
the [Image Analyzer Configmap Options](https://docs.sysdig.com/en/node-analyzer--multi-feature-installation.html#UUID-35c14c46-b327-c2a8-ed9c-82a2af995218_section-idm514589352153208)
for details about the available options, and
the [Node Image Analyzer documentation](https://docs.sysdig.com/en/scan-running-images.html) for details about the Node
Image Analyzer feature.

The node image analyzer (NIA) provides the capability to scan images as soon as they start running on hosts where the
analyzer is installed. It is typically installed alongside the Sysdig agent container.

On container start-up, the analyzer scans all pre-existing running images present in the node. Additionally, it will
scan any new image that enters a running state in the node. It will scan each image once, then forward the results to
the Sysdig Secure scanning backend. Image metadata and the full scan report is then available in the Sysdig Secure UI.

### Host Analyzer

See
the [Host Scanning Configuration Options](https://docs.sysdig.com/en/node-analyzer--multi-feature-installation.html#UUID-35c14c46-b327-c2a8-ed9c-82a2af995218_UUID-6666385b-c550-0660-f563-956f3a4fe093)
for details about installation options, and
the [Host Scanning documentation](https://docs.sysdig.com/en/host-scanning.html) for details about the Host Scanning
feature.

The host analyzer provides the capability to scan packages installed on the host operating system to identify potential
vulnerabilities. It is typically installed as part of the Node Analyzer which in turn is installed alongside the Sysdig
Agent.

The host analyzer works by inspecting the files on the host root filesystem looking for installed packages and sending
them to the Sysdig backend. It performs this operation by default once a day and its schedule can be configured as
described below. Likewise, the list of directories to be examined during each scan can be configured.

### Benchmark Runner

See the [Benchmarks documentation](https://docs.sysdig.com/en/benchmarks.html) for details on the Benchmark feature. The
Benchmark Runner provides the capability to run CIS inspired benchmarks against your infrastructure. Benchmark tasks are
configured in the UI, and the runner automatically runs these benchmarks on the configured scope and schedule.
Note: if `nodeAnalyzer.benchmarkRunner.includeSensitivePermissions` is set to `false`, the service account will not have
the full set of permissions needed to execute `oc` commands, which most checks in `CIS Benchmark for OS4` require.

## Support

For getting support from the Sysdig team, you should refer to the official
[Sysdig Support page](https://sysdig.com/support).

In addition to this, you can browse the documentation for the different components of the Sysdig Platform:

* [Sysdig Monitor](https://app.sysdigcloud.com)
* [Sysdig Secure](https://secure.sysdig.com)
* [Platform Documentation](https://docs.sysdig.com/en/sysdig-platform.html)
* [Monitor Documentation](https://docs.sysdig.com/en/sysdig-monitor.html)
* [Secure Documentation](https://docs.sysdig.com/en/sysdig-secure.html)
