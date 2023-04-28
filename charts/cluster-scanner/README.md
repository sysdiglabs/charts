<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Cluster Scanner

[Sysdig Cluster Scanner](https://docs.sysdig.com/en/docs/sysdig-secure/scanning) features Runtime Image scanning on Kubernetes.
<br/>This chart deploys the Sysdig Cluster Scanner in your Kubernetes cluster.

## TL;DR;

```
$ helm repo add sysdig https://charts.sysdig.com
$ helm repo update
$ helm upgrade --install sysdig-cluster-scanner sysdig/cluster-scanner \
      --create-namespace -n sysdig --version=0.1.0  \
      --set global.clusterConfig=CLUSTER_NAME \
      --set global.sysdig.region=SYSDIG_REGION
```

- [Configuration](#configuration)
- [Usages](#usages)
- [Confirm Working Status](#confirm-working-status)
- [Troubleshooting](#troubleshooting)

<br/><br/>

## Introduction

This chart deploys the Sysdig Admission Controller on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


### Prerequisites

- Helm 3
- Sysdig AccessKey


###  Installing the Chart

To install the chart with the release name `cluster-scanner`:

```console
$ helm upgrade --install sysdig-cluster-scanner sysdig/cluster-scanner -n sysdig --version=0.1.0
```

The command deploys the Sysdig Admission Controller on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`


### Uninstalling the Chart

To uninstall/delete the `cluster-scanner`:

```console
$ helm uninstall sysdig-cluster-scanner -n sysdig
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `cluster-scanner` chart and their default values.

|                     Parameter                     |                                                                                                                                  Description                                                                                                                                  |                        Default                         |
|---------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
| global.clusterConfig.name                         |                                                                                                                                                                                                                                                                               | <code>""</code>                                        |
| global.sysdig.accessKey                           |                                                                                                                                                                                                                                                                               | <code>""</code>                                        |
| global.sysdig.region                              |                                                                                                                                                                                                                                                                               | <code>"us1"</code>                                     |
| global.sysdig.skipVerifyCertificate               | apiHost is used to manually set the Sysdig backend host when no region is suitable (e.g. on-premise installations) Must have the protocol (http:// or https://) apiHost: "" skipVerifyCertificate might be used in on-premise installations.                                  | <code>false</code>                                     |
| global.scannerMode                                |                                                                                                                                                                                                                                                                               | <code>"local" # or "multi"</code>                      |
| global.loggingLevel                               |                                                                                                                                                                                                                                                                               | <code>"INFO"</code>                                    |
| eveEnabled                                        |                                                                                                                                                                                                                                                                               | <code>false</code>                                     |
| eveIntegrationEnabled                             |                                                                                                                                                                                                                                                                               | <code>false</code>                                     |
| rootNamespace                                     |                                                                                                                                                                                                                                                                               | <code>"kube-system"</code>                             |
| replicaCount                                      |                                                                                                                                                                                                                                                                               | <code>2</code>                                         |
| runtimeStatusIntegrator.image.repository          |                                                                                                                                                                                                                                                                               | <code>quay.io/sysdig/runtime-status-integrator</code>  |
| runtimeStatusIntegrator.image.pullPolicy          |                                                                                                                                                                                                                                                                               | <code>IfNotPresent</code>                              |
| runtimeStatusIntegrator.image.tag                 |                                                                                                                                                                                                                                                                               | <code>"0.1.2-v4085794"</code>                          |
| runtimeStatusIntegrator.multiCluster              | Params to manage leader election Leader election is implemented leveraging the native capabilities of Kubernetes see: https://kubernetes.io/blog/2016/01/simple-leader-election-with-kubernetes/ leaderElectionLeaseNameOverride: "" leaderElectionLeaseNamespaceOverride: "" | <code></code>                                          |
| runtimeStatusIntegrator.localCluster              |                                                                                                                                                                                                                                                                               | <code></code>                                          |
| runtimeStatusIntegrator.ports.metrics             |                                                                                                                                                                                                                                                                               | <code>25000</code>                                     |
| runtimeStatusIntegrator.ports.probes              |                                                                                                                                                                                                                                                                               | <code>7000</code>                                      |
| runtimeStatusIntegrator.resources.limits.cpu      |                                                                                                                                                                                                                                                                               | <code>"1"</code>                                       |
| runtimeStatusIntegrator.resources.limits.memory   |                                                                                                                                                                                                                                                                               | <code>350Mi</code>                                     |
| runtimeStatusIntegrator.resources.requests.cpu    |                                                                                                                                                                                                                                                                               | <code>"350m"</code>                                    |
| runtimeStatusIntegrator.resources.requests.memory |                                                                                                                                                                                                                                                                               | <code>350Mi</code>                                     |
| runtimeStatusIntegrator.natsJS.user               |                                                                                                                                                                                                                                                                               | <code>"default-user"</code>                            |
| imageSbomExtractor.image.repository               |                                                                                                                                                                                                                                                                               | <code>quay.io/sysdig/image-sbom-extractor</code>       |
| imageSbomExtractor.image.pullPolicy               |                                                                                                                                                                                                                                                                               | <code>IfNotPresent</code>                              |
| imageSbomExtractor.image.tag                      |                                                                                                                                                                                                                                                                               | <code>"0.1.2-v91beb12"</code>                          |
| imageSbomExtractor.ports.metrics                  |                                                                                                                                                                                                                                                                               | <code>25001</code>                                     |
| imageSbomExtractor.ports.probes                   |                                                                                                                                                                                                                                                                               | <code>7001</code>                                      |
| imageSbomExtractor.resources.limits.cpu           |                                                                                                                                                                                                                                                                               | <code>"1"</code>                                       |
| imageSbomExtractor.resources.limits.memory        |                                                                                                                                                                                                                                                                               | <code>350Mi</code>                                     |
| imageSbomExtractor.resources.requests.cpu         |                                                                                                                                                                                                                                                                               | <code>"150m"</code>                                    |
| imageSbomExtractor.resources.requests.memory      |                                                                                                                                                                                                                                                                               | <code>350Mi</code>                                     |
| imageSbomExtractor.cache.type                     |                                                                                                                                                                                                                                                                               | <code>"local" # other possible value is "redis"</code> |
| imageSbomExtractor.cache.prefix                   |                                                                                                                                                                                                                                                                               | <code>"sysdig-cluster-scanner"</code>                  |
| imagePullSecrets                                  |                                                                                                                                                                                                                                                                               | <code>[]</code>                                        |
| nameOverride                                      |                                                                                                                                                                                                                                                                               | <code>""</code>                                        |
| fullnameOverride                                  |                                                                                                                                                                                                                                                                               | <code>""</code>                                        |
| serviceAccount.create                             | Specifies whether a service account should be created                                                                                                                                                                                                                         | <code>true</code>                                      |
| serviceAccount.annotations                        | Annotations to add to the service account                                                                                                                                                                                                                                     | <code>{}</code>                                        |
| serviceAccount.name                               | The name of the service account to use. If not set and create is true, a name is generated using the fullname template                                                                                                                                                        | <code>""</code>                                        |
| podAnnotations                                    |                                                                                                                                                                                                                                                                               | <code>{}</code>                                        |
| podSecurityContext                                |                                                                                                                                                                                                                                                                               | <code>{}</code>                                        |
| securityContext                                   |                                                                                                                                                                                                                                                                               | <code>{}</code>                                        |
| selectorLabels                                    |                                                                                                                                                                                                                                                                               | <code>{}</code>                                        |
| nodeSelector                                      |                                                                                                                                                                                                                                                                               | <code>{}</code>                                        |
| tolerations                                       |                                                                                                                                                                                                                                                                               | <code>[]</code>                                        |
| affinity                                          |                                                                                                                                                                                                                                                                               | <code>{}</code>                                        |


Specify each parameter using the **`--set key=value[,key=value]`** argument to `helm upgrade --install`. For example:

```console
$ helm upgrade --install sysdig-cluster-scanner sysdig/cluster-scanner \
    --create-namespace -n sysdig --version=0.1.0 \
    --set global.sysdig.region="us1"
```

**Alternatively, a YAML file** that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm upgrade --install sysdig-cluster-scanner sysdig/cluster-scanner \
    --create-namespace -n sysdig --version=0.1.0 \
    --values values.yaml
```

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
make test
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.

## Troubleshooting

### Q: I need to troubleshoot, any way to switch to `debug` verbose?
A: If you used helm to install, you can edit the helm `values.yaml` to set `global.loggingLevel=DEBUG`
<br/>Alternatively, you can edit the webhook configmap - add the `logging_level=DEBUG` key-value and restart the scanner
```
    $ kubectl edit configmap -n sysdig cluster-scanner
    $ kubectl rollout restart deployment -n sysdig cluster-scanner
```
