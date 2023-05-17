# Chart: Node Analyzer

The Node Analyzer (NA) provides a method for deploying the components for three different Sysdig Secure features:

The Node Analyzer is deployed by default unless you set the value `nodeAnalyzer.deploy` to `false`.

The Node Analyzer daemonset contains three containers, each providing a specific functionality. This daemonset replaces
the (deprecated) Node Image Analyzer daemonset.

## Table of Contents
- [Chart: Node Analyzer](#chart-node-analyzer)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Installing the Chart](#installing-the-chart)
  - [Uninstalling the Chart](#uninstalling-the-chart)
  - [Configuration](#configuration)
  - [Node Analyzer](#node-analyzer)
    - [Node Image Analyzer](#node-image-analyzer)
    - [Host Analyzer](#host-analyzer)
    - [Benchmark Runner](#benchmark-runner)
    - [KSPM Analyzer (Preview)](#kspm-analyzer-preview)
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
- COLLECTOR_URL: This value is region-dependent in SaaS and is auto-completed in install snippets in the UI. (It is
  a custom value in on-prem installations.)
- API_ENDPOINT: This is the base URL (region-dependent) for Sysdig Secure and is auto-completed in install snippets in the UI.
  E.g. secure.sysdig.com, us2.app.sysdig.com, eu1.app.sysdig.com.

After a few seconds, you should see hosts and containers appearing in Sysdig Monitor and Sysdig Secure.

> **Tip**: List all releases using `helm list`

See
the [Node Analyzer installation documentation](https://docs.sysdig.com/en/node-analyzer--multi-feature-installation.html)
for details about installation, and
[Running Node Analyzer Behind a Proxy](https://docs.sysdig.com/en/docs/installation/node-analyzer-multi-feature-installation/#host-scanning-configuration-options)
for proxy settings.

## Uninstalling the Chart

To uninstall/delete the `sysdig-agent` deployment:

```bash
$ helm delete --namespace nodeanalyzer node-analyzer
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Sysdig Node Analyzer chart and their default values.

| Parameter                                                            | Description                                                                              | Default                                                                                                                                                               |
|----------------------------------------------------------------------|------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `global.sysdig.region`                                               | Region name for Sysdig. Valid options: `us1`, `us2`, `us3`, `us4`, `eu1`, `au1`, `custom`.  | `us1`                                                                                                                                                                 |
| `global.sysdig.tags`                                                 | Map of custom tags to be assigned to client components.                             | `{}`                                                                                                                                                                  |
| `global.proxy.httpProxy`                                             | Sets `HTTP_PROXY` on the Node Analyzer containers                                        | `""`                                                                                                                                                                  |
| `global.proxy.httpsProxy`                                            | Sets `HTTPS_PROXY` on the Node Analyzer containers                                       | `""`                                                                                                                                                                  |
| `global.proxy.noProxy`                                               | Sets `NO_PROXY` on the Node Analyzer containers                                          | `""`                                                                                                                                                                  |
| `global.kspm.deploy`                                                 | Enables Sysdig KSPM node analyzer & KSPM collector                                       | `false`                                                                                                                                                               |
| `global.gke.autopilot`                                               | If true, overrides the agent configuration to run on GKE Autopilot clusters              | `false`                                                                                                                                                               |
| `image.registry`                                                     | Sysdig Agent image registry                                                              | `quay.io`                                                                                                                                                             |
| `gke.autopilot`                                                      | If true, overrides the agent configuration to run on GKE Autopilot clusters              | `false`                                                                                                                                                               |
| `rbac.create`                                                        | If true, create & use RBAC resources                                                     | `true`                                                                                                                                                                |
| `scc.create`                                                         | Create OpenShift's Security Context Constraint                                           | `true`                                                                                                                                                                |
| `psp.create`                                                         | Create Pod Security Policy to allow the agent running in clusters with PSP enabled       | `true`                                                                                                                                                                |
| `clusterName`                                                        | Set a cluster name to identify events using *kubernetes.cluster.name* tag                | ` `                                                                                                                                                                   |
| `namespace`                                                          | Overrides the global namespace setting and release namespace for components                | ` `                                                                                                                                                                   |
| `sysdig.accessKey`                                                   | Your Sysdig Agent Access Key                                                             | ` ` Either accessKey or existingAccessKeySecret is required                                                                                                           |
| `sysdig.existingAccessKeySecret`                                     | Alternatively, specify the name of a Kubernetes secret containing an 'access-key' entry  | ` ` Either accessKey or existingAccessKeySecret is required                                                                                                           |
| `secure.enabled`                                                     | Enable Sysdig Secure                                                                     | `true`                                                                                                                                                                |
| `secure.vulnerabilityManagement.newEngineOnly`                       | Enable only the new vulnerability management engine                                         | `false`                                                                                                                                                               |
| `daemonset.annotations`                                              | Custom annotations for the daemonset                                                     | `{}'                                                                                                                                                                 |
| `daemonset.labels`                                                   | NodeAnalyzer specific labels (as a multi-line templated string map or as YAML)           | `{}`
| `daemonset.updateStrategy.type`                | The updateStrategy for updating the daemonset                                                                                                           | RollingUpdate
| `daemonset.updateStrategy.rollingUpdate.maxUnavailable`                       | The maximum number of pods that can be unavailable during the update process             | 1
| `nodeAnalyzer.deploy`                                                | Deploy the Node Analyzer                                                                 | `true`                                                                                                                                                                |
| `nodeAnalyzer.apiEndpoint`                                           | Sysdig secure API endpoint, without protocol (i.e. `secure.sysdig.com`)                  | ` `                                                                                                                                                                   |
| `nodeAnalyzer.sslVerifyCertificate`                                  | Can be set to false to allow insecure connections to the Sysdig backend, such as On-Prem |                                                                                                                                                                       |
| `nodeAnalyzer.debug`                                                 | Can be set to true to show debug logging, useful for troubleshooting                     |                                                                                                                                                                       |
| `nodeAnalyzer.priorityClassName`                                     | Priority class name variable                                                             |                                                                                                                                                                       |
| `nodeAnalyzer.httpProxy`                                             | Proxy configuration variables                                                            |                                                                                                                                                                       |
| `nodeAnalyzer.httpsProxy`                                            | Proxy configuration variables                                                            |                                                                                                                                                                       |
| `nodeAnalyzer.noProxy`                                               | Proxy configuration variables                                                            |                                                                                                                                                                       |
| `nodeAnalyzer.pullSecrets`                                           | Image pull secrets for the Node Analyzer containers                                      | `nil`                                                                                                                                                                 |
| `nodeAnalyzer.extraVolumes.volumes`                                  | Additional volumes to mount in the Node Analyzer (i.e. for docker socket)                | `[]`                                                                                                                                                                  |
| `nodeAnalyzer.imageAnalyzer.deploy`                                  | Deploy the Image Analyzer                                                                | `true`                                                                                                                                                                |
| `nodeAnalyzer.imageAnalyzer.image.repository`                        | The image repository to pull the Node Image Analyzer from                                | `sysdig/node-image-analyzer`                                                                                                                                          |
| `nodeAnalyzer.imageAnalyzer.image.tag`                               | The image tag to pull the Node Image Analyzer                                            | `0.1.25`                                                                                                                                                              |
| `nodeAnalyzer.imageAnalyzer.image.digest`                            | The image digest to pull                                                                 | ` `                                                                                                                                                                   |
| `nodeAnalyzer.imageAnalyzer.image.pullPolicy`                        | The Image pull policy for the Node Image Analyzer                                        | `IfNotPresent`                                                                                                                                                        |
| `nodeAnalyzer.imageAnalyzer.dockerSocketPath`                        | The Docker socket path                                                                   |                                                                                                                                                                       |
| `nodeAnalyzer.imageAnalyzer.criSocketPath`                           | The socket path to a CRI compatible runtime, such as CRI-O                               |                                                                                                                                                                       |
| `nodeAnalyzer.imageAnalyzer.containerdSocketPath`                    | The socket path to a CRI-Containerd daemon                                               |                                                                                                                                                                       |
| `nodeAnalyzer.imageAnalyzer.extraVolumes.volumes` (Deprecated)       | Additional volumes to mount in the Node Image Analyzer (i.e. for docker socket)          | `[]`                                                                                                                                                                  |
| `nodeAnalyzer.imageAnalyzer.extraVolumes.mounts`                     | Mount points for additional volumes                                                      | `[]`                                                                                                                                                                  |
| `nodeAnalyzer.imageAnalyzer.resources.requests.cpu`                  | Node Image Analyzer CPU requests per node                                                | `150m`                                                                                                                                                                |
| `nodeAnalyzer.imageAnalyzer.resources.requests.memory`               | Node Image Analyzer Memory requests per node                                             | `512Mi`                                                                                                                                                               |
| `nodeAnalyzer.imageAnalyzer.resources.limits.cpu`                    | Node Image Analyzer CPU limit per node                                                   | `500m`                                                                                                                                                                |
| `nodeAnalyzer.imageAnalyzer.resources.limits.memory`                 | Node Image Analyzer Memory limit per node                                                | `1536Mi`                                                                                                                                                              |
| `nodeAnalyzer.imageAnalyzer.env`                                     | Extra environment variables that will be passed onto pods                                | `{}`                                                                                                                                                                  |
| `nodeAnalyzer.hostAnalyzer.deploy`                                   | Deploy the Host Analyzer                                                                 | `true`                                                                                                                                                                |
| `nodeAnalyzer.hostAnalyzer.image.repository`                         | The image repository to pull the Host Analyzer from                                      | `sysdig/host-analyzer`                                                                                                                                                |
| `nodeAnalyzer.hostAnalyzer.image.tag`                                | The image tag to pull the Host Analyzer                                                  | `0.1.15`                                                                                                                                                              |
| `nodeAnalyzer.hostAnalyzer.image.digest`                             | The image digest to pull                                                                 | ` `                                                                                                                                                                   |
| `nodeAnalyzer.hostAnalyzer.image.pullPolicy`                         | The Image pull policy for the Host Analyzer                                              | `IfNotPresent`                                                                                                                                                        |
| `nodeAnalyzer.hostAnalyzer.schedule`                                 | The scanning schedule specification for the host analyzer expressed as a crontab         | `@dailydefault`                                                                                                                                                       |
| `nodeAnalyzer.hostAnalyzer.dirsToScan`                               | The list of directories to inspect during the scan                                       | `/etc,/var/lib/dpkg,/usr/local,/usr/lib/sysimage/rpm,/var/lib/rpm,/lib/apk/db`                                                                                        |
| `nodeAnalyzer.hostAnalyzer.maxSendAttempts`                          | The number of times the analysis collector is allowed to retry sending results           | `3`                                                                                                                                                                   |
| `nodeAnalyzer.hostAnalyzer.resources.requests.cpu`                   | Host Analyzer CPU requests per node                                                      | `150m`                                                                                                                                                                |
| `nodeAnalyzer.hostAnalyzer.resources.requests.memory`                | Host Analyzer Memory requests per node                                                   | `512Mi`                                                                                                                                                               |
| `nodeAnalyzer.hostAnalyzer.resources.limits.cpu`                     | Host Analyzer CPU limit per node                                                         | `500m`                                                                                                                                                                |
| `nodeAnalyzer.hostAnalyzer.resources.limits.memory`                  | Host Analyzer Memory limit per node                                                      | `1536Mi`                                                                                                                                                              |
| `nodeAnalyzer.hostAnalyzer.env`                                      | Extra environment variables that will be passed onto pods                                | `{}`                                                                                                                                                                  |
| `nodeAnalyzer.benchmarkRunner.deploy`                                | Deploy the Benchmark Runner                                                              | `true`                                                                                                                                                                |
| `nodeAnalyzer.benchmarkRunner.image.repository`                      | The image repository to pull the Benchmark Runner from                                   | `sysdig/compliance-benchmark-runner`                                                                                                                                  |
| `nodeAnalyzer.benchmarkRunner.image.tag`                             | The image tag to pull the Benchmark Runner                                               | `1.1.0.8`                                                                                                                                                             |
| `nodeAnalyzer.benchmarkRunner.image.digest`                          | The image digest to pull                                                                 | ` `                                                                                                                                                                   |
| `nodeAnalyzer.benchmarkRunner.image.pullPolicy`                      | The Image pull policy for the Benchmark Runner                                           | `IfNotPresent`                                                                                                                                                        |
| `nodeAnalyzer.benchmarkRunner.includeSensitivePermissions`           | Grant the service account elevated permissions to run CIS Benchmark for OS4              | `false`                                                                                                                                                               |
| `nodeAnalyzer.benchmarkRunner.resources.requests.cpu`                | Benchmark Runner CPU requests per node                                                   | `150m`                                                                                                                                                                |
| `nodeAnalyzer.benchmarkRunner.resources.requests.memory`             | Benchmark Runner Memory requests per node                                                | `128Mi`                                                                                                                                                               |
| `nodeAnalyzer.benchmarkRunner.resources.limits.cpu`                  | Benchmark Runner CPU limit per node                                                      | `500m`                                                                                                                                                                |
| `nodeAnalyzer.benchmarkRunner.resources.limits.memory`               | Benchmark Runner Memory limit per node                                                   | `256Mi`                                                                                                                                                               |
| `nodeAnalyzer.benchmarkRunner.env`                                   | Extra environment variables that will be passed onto pods                                | `{}`                                                                                                                                                                  |
| `nodeAnalyzer.hostScanner.deploy`                                    | Deploy the Host Scanner                                                                  | unset                                                                                                                                                                 |
| `nodeAnalyzer.hostScanner.dirsToScan`                                | The list of directories to inspect during the scan                                       | `/etc,/var/lib/dpkg,/var/lib/rpm,/lib/apk/db,/bin,/sbin,/usr/bin,/usr/sbin,/usr/share,/usr/local,/usr/lib,/usr/lib64,/var/lib/google,/var/lib/toolbox,/var/lib/cloud` |
| `nodeAnalyzer.hostScanner.additionalDirsToScan`                      | Optional comma-separated list of directories in addition to default ones                 | ` `                                                                                                                                                                   |
| `nodeAnalyzer.hostScanner.env`                                       | Extra environment variables that will be passed onto pods                                | `{}`                                                                                                                                                                  |
| `nodeAnalyzer.hostScanner.image.repository`                          | The image repository to pull the Host Scanner from                                       | `sysdig/vuln-host-scanner`                                                                                                                                            |
| `nodeAnalyzer.hostScanner.image.tag`                                 | The image tag to pull the Host Scanner                                                   | `0.3.9`                                                                                                                                                               |
| `nodeAnalyzer.hostScanner.image.digest`                              | The image digest to pull                                                                 | ` `                                                                                                                                                                   |
| `nodeAnalyzer.hostScanner.image.pullPolicy`                          | The image pull policy for the Host Scanner                                               | `IfNotPresent`                                                                                                                                                        |
| `nodeAnalyzer.hostScanner.resources.requests.cpu`                    | Host Scanner CPU requests per node                                                       | `150m`                                                                                                                                                                |
| `nodeAnalyzer.hostScanner.resources.requests.memory`                 | Host Scanner Memory requests per node                                                    | `512Mi`                                                                                                                                                               |
| `nodeAnalyzer.hostScanner.resources.requests.ephemeral-storage`      | Host Scanner Storage requests per node                                                   | `512Mi`                                                                                                                                                               |
| `nodeAnalyzer.hostScanner.resources.limits.cpu`                      | Host Scanner CPU limit per node                                                          | `500m`                                                                                                                                                                |
| `nodeAnalyzer.hostScanner.resources.limits.memory`                   | Host Scanner Memory limit per node                                                       | `1Gi`                                                                                                                                                                 |
| `nodeAnalyzer.hostScanner.resources.limits.ephemeral-storage`        | Host Scanner Storage limit per node                                                      | `1Gi`                                                                                                                                                                 |
| `nodeAnalyzer.hostScanner.probesPort`                                | Port where readiness and liveness probes are exposed                                     | `7001`                                                                                                                                                                |
| `nodeAnalyzer.runtimeScanner.deploy`                                 | Deploy the Runtime Scanner                                                               | `false`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.extraMounts`                            | Specify a container engine custom socket path (docker, containerd, CRI-O)                |                                                                                                                                                                       |
| `nodeAnalyzer.runtimeScanner.storageClassName`                       | Runtime Scanner storage class to use instead of emptyDir for ephemeral storage           | ``                                                                                                                                                                    |
| `nodeAnalyzer.runtimeScanner.image.repository`                       | The image repository to pull the Runtime Scanner from                                    | `sysdig/vuln-runtime-scanner`                                                                                                                                         |
| `nodeAnalyzer.runtimeScanner.image.tag`                              | The image tag to pull the Runtime Scanner                                                | `1.4.11`                                                                                                                                                              |
| `nodeAnalyzer.runtimeScanner.image.digest`                           | The image digest to pull                                                                 | ` `                                                                                                                                                                   |
| `nodeAnalyzer.runtimeScanner.image.pullPolicy`                       | The image pull policy for the Runtime Scanner                                            | `IfNotPresent`                                                                                                                                                        |
| `nodeAnalyzer.runtimeScanner.resources.requests.cpu`                 | Runtime Scanner CPU requests per node                                                    | `150m`                                                                                                                                                                |
| `nodeAnalyzer.runtimeScanner.resources.requests.memory`              | Runtime Scanner Memory requests per node                                                 | `512Mi`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.resources.requests.ephemeral-storage`   | Runtime Scanner Storage requests per node                                                | `2Gi`                                                                                                                                                                 |
| `nodeAnalyzer.runtimeScanner.resources.limits.cpu`                   | Runtime Scanner CPU limit per node                                                       | `1000m`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.resources.limits.memory`                | Runtime Scanner Memory limit per node                                                    | `2Gi`                                                                                                                                                                 |
| `nodeAnalyzer.runtimeScanner.resources.limits.ephemeral-storage`     | Runtime Scanner Storage limit per node                                                   | `4Gi`                                                                                                                                                                 |
| `nodeAnalyzer.runtimeScanner.env`                                    | Extra environment variables that will be passed onto pods                                | `{}`                                                                                                                                                                  |
| `nodeAnalyzer.runtimeScanner.settings.eveEnabled`                    | Enables Sysdig Eve                                                                       | `false`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.eveConnector.image.repository`          | The image repository to pull the Eve Connector from                                      | `sysdig/eveclient-api`                                                                                                                                                |
| `nodeAnalyzer.runtimeScanner.eveConnector.image.tag`                 | The image tag to pull the Eve Connector                                                  | `1.1.0`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.eveConnector.deploy`                    | Enables Sysdig Eve Connector for third-party integrations                                | `false`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.eveConnector.resources.requests.cpu`    | Eve Connector CPU requests per node                                                      | `100m`                                                                                                                                                                |
| `nodeAnalyzer.runtimeScanner.eveConnector.resources.requests.memory` | Eve Connector Memory requests per node                                                   | `128Mi`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.eveConnector.resources.limits.cpu`      | Eve Connector CPU limits per node                                                        | `1000m`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.eveConnector.resources.limits.memory`   | Eve Connector Memory limits per node                                                     | `512Mi`                                                                                                                                                               |
| `nodeAnalyzer.runtimeScanner.eveConnector.settings.replicas`         | Eve Connector deployment replicas                                                        | `1`                                                                                                                                                                   |
| `nodeAnalyzer.tolerations`                                           | The tolerations for scheduling                                                           | `node-role.kubernetes.io/master:NoSchedule`                                                                                                                           |
|                                                                                                                                                                   `node-role.kubernetes.io/control-plane:NoSchedule`                             |
| `nodeAnalyzer.kspmAnalyzer.debug`                                    | Can be set to true to show KSPM node analyzer debug logging, useful for troubleshooting  | `false`                                                                                                                                                               |
| `nodeAnalyzer.kspmAnalyzer.image.repository`                         | The image repository to pull the  KSPM node analyzer from                                | `sysdig/kspm-analyzer`                                                                                                                                                |
| `nodeAnalyzer.kspmAnalyzer.image.tag`                                | The image tag to pull the  KSPM node analyzer                                            | `1.22.0`                                                                                                                                                              |
| `nodeAnalyzer.kspmAnalyzer.image.digest`                             | The image digest to pull                                                                 | ` `                                                                                                                                                                   |
| `nodeAnalyzer.kspmAnalyzer.image.pullPolicy`                         | The image pull policy for the  KSPM node analyzer                                        | `IfNotPresent`                                                                                                                                                        |
| `nodeAnalyzer.kspmAnalyzer.resources.requests.cpu`                   | KSPM node analyzer CPU requests per node                                                 | `150m`                                                                                                                                                                |
| `nodeAnalyzer.kspmAnalyzer.resources.requests.memory`                | KSPM node analyzer memory requests per node                                              | `256Mi`                                                                                                                                                               |
| `nodeAnalyzer.kspmAnalyzer.resources.limits.cpu`                     | KSPM node analyzer CPU limits per node                                                   | `500m`                                                                                                                                                                |
| `nodeAnalyzer.kspmAnalyzer.resources.limits.memory`                  | KSPM node analyzer memory limits per node                                                | `1536Mi`                                                                                                                                                              |
| `nodeAnalyzer.kspmAnalyzer.port`                                     | KSPM node analyzer port for health checks and results API                                | `12000`                                                                                                                                                               |
| `nodeAnalyzer.kspmAnalyzer.readinessProbe.enabled`                   | KSPM node analyzer readinessProbe enablement                                             | `true`                                                                                                                                                            |
| `nodeAnalyzer.kspmAnalyzer.livenessProbe.enabled`                    | KSPM node analyzer livenessProbe enablement                                              | `true`                                                                                                                                                                   |
| `nodeAnalyzer.kspmAnalyzer.env`                                      | Extra environment variables that will be passed onto pods                                | `{}`                                                                                                                                                                  |
| `nodeAnalyzer.nodeSelector`                                          | Node Selector                                                                            | `{}`                                                                                                                                                                  |
| `nodeAnalyzer.affinity`                                              | Node affinities                                                                          | `schedule on amd64 and linux`                                                                                                                                         |

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
### Node Analyzer

The Node Analyzer is deployed by default unless you set the value `nodeAnalyzer.deploy` to `false`.

The Node Analyzer daemonset contains five containers, each providing a specific functionality. This daemonset replaces
the (deprecated) Node Image Analyzer daemonset.

See the [Node Analyzer installation documentation](https://docs.sysdig.com/en/node-analyzer--multi-feature-installation.html)
for details about installation, and
[Running Node Analyzer Behind a Proxy](https://docs.sysdig.com/en/docs/installation/node-analyzer-multi-feature-installation/#running-node-analyzer-behind-a-proxy)
for proxy settings.

### Runtime Scanner

See the [Vulnerability -> Runtime documentation](https://docs.sysdig.com/en/docs/sysdig-secure/vulnerabilities/runtime/#why-runtime-scanning) for details about Runtime vulnerability management feature.

The Runtime scanner will automatically observe and report on all the Runtime workloads, keeping a close-to-real time view of images and workloads executing on the different Kubernetes scopes of your infrastructure.
Perform periodic re-scans, guaranteeing that the vulnerabilities associated with the Runtime workloads and images are up-to-date with the latest vulnerabilities feed databases. It will automatically match a newly reported vulnerability to your runtime workloads without requiring any additional user interaction.

### Host Scanner

See the [Vulnerability -> Runtime, Host scanning documentation](https://docs.sysdig.com/en/docs/sysdig-secure/vulnerabilities/runtime/#host-scanning) for details about Runtime vulnerability management feature for Hosts.

The Host scanner will automatically analyze the software packages installed, and show the scan results in the Runtime view page.
Perform periodic re-scans, guaranteeing that the vulnerabilities associated with the software packages installed are up-to-date with the latest vulnerabilities feed databases. It will automatically match a newly reported vulnerability to your hosts without requiring any additional user interaction.

### Node Image Analyzer (Legacy)

See the [Image Analyzer Configmap Options](https://docs.sysdig.com/en/docs/installation/node-analyzer-multi-feature-installation/#image-analyzer-configmap-options)
for details about the available options, and
the [Node Image Analyzer documentation](https://docs.sysdig.com/en/scan-running-images.html) for details about the Node
Image Analyzer feature.

The node image analyzer (NIA) provides the capability to scan images as soon as they start running on hosts where the
analyzer is installed. It is typically installed alongside the Sysdig agent container.

On container start-up, the analyzer scans all pre-existing running images present in the node. Additionally, it will
scan any new image that enters a running state in the node. It will scan each image once, then forward the results to
the Sysdig Secure scanning backend. Image metadata and the full scan report is then available in the Sysdig Secure UI.

### Host Analyzer (Legacy)

See the [Host Scanning Configuration Options](https://docs.sysdig.com/en/docs/installation/node-analyzer-multi-feature-installation/#host-scanning-configuration-options)
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

### KSPM Analyzer (Preview)

See the [Actionable Compliance documentation](https://docs.sysdig.com/en/docs/sysdig-secure/posture/compliance/actionable-compliance/) for details on the Actionable Compliance feature. The
KSPM Analyzer analyzes your host's configuration and sends the output to be evaluated against compliance policies.
The scan results are displayed in Sysdig Secure's Actionable Compliance screens.

The agent listens to port 12000 by default. To override it, you can set the nodeAnalyzer.kspmAnalyzer.port variable.

For example:

```bash
$ helm install --namespace sysdig-agent sysdig-agent \
    --set sysdig.accessKey=YOUR-KEY-HERE \
    --set nodeAnalyzer.apiEndpoint=42.32.196.18 \
    --set global.kspm.deploy=true \
    --set nodeAnalyzer.kspmAnalyzer.port=8888 \
    sysdig/sysdig
```

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
helm unittest --helm3 .
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.

## Support

For getting support from the Sysdig team, you should refer to the official
[Sysdig Support page](https://sysdig.com/support).

In addition to this, you can browse the documentation for the different components of the Sysdig Platform:

* [Sysdig Monitor](https://app.sysdigcloud.com)
* [Sysdig Secure](https://secure.sysdig.com)
* [Platform Documentation](https://docs.sysdig.com/en/sysdig-platform.html)
* [Monitor Documentation](https://docs.sysdig.com/en/sysdig-monitor.html)
* [Secure Documentation](https://docs.sysdig.com/en/sysdig-secure.html)
