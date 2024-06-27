<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Cluster Shield

[Sysdig Cluster Shield](https://docs.sysdig.com/en/docs/installation/cluster-shield).
<br/>This chart deploys the Sysdig Cluster Shield in your Kubernetes cluster.

## TL;DR;

```
$ helm repo add sysdig https://charts.sysdig.com
$ helm repo update
$ helm upgrade --install sysdig-sysdig-cluster-shield sysdig/cluster-shield \
    --create-namespace -n sysdig-agent --version=1.0.3  \
    --set global.clusterConfig.name=CLUSTER_NAME \
    --set global.sysdig.region=SYSDIG_REGION \
    --set global.sysdig.accessKey=YOUR-KEY-HERE
```

- [Configuration](#configuration)
- [Usages](#usages)
- [Confirm Working Status](#confirm-working-status)
- [Troubleshooting](#troubleshooting)

<br/><br/>

## Introduction

This chart deploys the Sysdig Cluster Shield as a Deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


### Prerequisites

- Helm 3.6
- Sysdig AccessKey
- Sysdig Secure API Token
- Sysdig Secure API URL
- Sysdig Secure Collector


###  Installing the Chart

To install the chart  create a `values.yaml` file. Set your values and decide which features you would like to enable.
```yaml
cluster_shield:
    cluster_config:
        name: <your-cluster-name>
    features:
        admission_control:
            enabled: true
        audit:
            enabled: true
        container_vulnerability_management:
            enabled: true
        posture:
            enabled: true
    sysdig_endpoint:
        api_url: <your-api-url>
        secure_api_token: <your-secure-api-token>
        access_key: <your-access-key>
```

Then, to install it with the release name `sysdig-cluster-shield`, run:

```console
$ helm upgrade --install --atomic --create-namespace \
    -n sysdig-agent \
    -f values.yaml \
    sysdig-cluster-shield \
    sysdig/cluster-shield
```

The command deploys the Sysdig Cluster Shield on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

### Uninstalling the Chart

To uninstall/delete the `sysdig-cluster-shield`:

```console
$ helm uninstall sysdig-cluster-shield -n sysdig-agent
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `cluster-shield` chart and their default values.

|                                         Parameter                                         |                                      Description                                      |                      Default                      |
|-------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|---------------------------------------------------|
| global.clusterConfig.name                                                                 | name to identify this cluster for events and metrics                                  | <code>""</code>                                   |
| global.proxy.httpProxy                                                                    |                                                                                       | <code></code>                                     |
| global.proxy.httpsProxy                                                                   |                                                                                       | <code></code>                                     |
| global.proxy.noProxy                                                                      |                                                                                       | <code>127.0.0.1,localhost,.local,.internal</code> |
| global.image.pullSecrets                                                                  |                                                                                       | <code>[]</code>                                   |
| global.image.pullPolicy                                                                   |                                                                                       | <code>IfNotPresent</code>                         |
| global.sysdig.accessKeySecret                                                             |                                                                                       | <code></code>                                     |
| global.sysdig.accessKey                                                                   |                                                                                       | <code></code>                                     |
| global.sysdig.apiHost                                                                     |                                                                                       | <code></code>                                     |
| global.sysdig.region                                                                      |                                                                                       | <code>"custom"</code>                             |
| global.sysdig.secureAPITokenSecret                                                        |                                                                                       | <code></code>                                     |
| global.sysdig.secureAPIToken                                                              |                                                                                       | <code></code>                                     |
| global.imageRegistry                                                                      |                                                                                       | <code></code>                                     |
| global.sslVerifyCertificate                                                               |                                                                                       | <code></code>                                     |
| global.ssl.ca.certs                                                                       | A PEM-encoded x509 certificate. This can also be a bundle with multiple certificates. | <code>[]</code>                                   |
| global.ssl.ca.keyName                                                                     | Filename that is used when creating the secret. Required if certs is provided.        | <code>null</code>                                 |
| global.ssl.ca.existingCaSecret                                                            | Provide the name of an existing Secret that contains the CA required                  | <code>null</code>                                 |
| global.ssl.ca.existingCaSecretKeyName                                                     | Provide the filename that is defined inside the existing Secret                       | <code>null</code>                                 |
| global.ssl.ca.existingCaConfigMap                                                         | Provide the name of an existing ConfigMap that contains the CA required               | <code>null</code>                                 |
| global.ssl.ca.existingCaConfigMapKeyName                                                  | Provide the filename that is defined inside the existing ConfigMap                    | <code>null</code>                                 |
| cluster_shield.cluster_config.name                                                        |                                                                                       | <code></code>                                     |
| cluster_shield.log_level                                                                  |                                                                                       | <code>warn</code>                                 |
| cluster_shield.monitoring_port                                                            |                                                                                       | <code>8080</code>                                 |
| cluster_shield.sysdig_endpoint.access_key                                                 |                                                                                       | <code></code>                                     |
| cluster_shield.sysdig_endpoint.api_url                                                    |                                                                                       | <code></code>                                     |
| cluster_shield.sysdig_endpoint.secure_api_token                                           |                                                                                       | <code></code>                                     |
| cluster_shield.sysdig_endpoint.region                                                     |                                                                                       | <code></code>                                     |
| cluster_shield.kubernetes.root_namespace                                                  |                                                                                       | <code>kube-system</code>                          |
| cluster_shield.features.admission_control.enabled                                         |                                                                                       | <code>false</code>                                |
| cluster_shield.features.admission_control.deny_on_error                                   |                                                                                       | <code>false</code>                                |
| cluster_shield.features.admission_control.dry_run                                         |                                                                                       | <code>true</code>                                 |
| cluster_shield.features.admission_control.timeout                                         |                                                                                       | <code>5</code>                                    |
| cluster_shield.features.admission_control.http_port                                       |                                                                                       | <code>8443</code>                                 |
| cluster_shield.features.admission_control.container_vulnerability_management.enabled      |                                                                                       | <code>false</code>                                |
| cluster_shield.features.audit.enabled                                                     |                                                                                       | <code>false</code>                                |
| cluster_shield.features.audit.http_port                                                   |                                                                                       | <code>6443</code>                                 |
| cluster_shield.features.audit.timeout                                                     |                                                                                       | <code>5</code>                                    |
| cluster_shield.features.posture.enabled                                                   |                                                                                       | <code>false</code>                                |
| cluster_shield.features.container_vulnerability_management.enabled                        |                                                                                       | <code>false</code>                                |
| cluster_shield.features.container_vulnerability_management.in_use.enabled                 |                                                                                       | <code>true</code>                                 |
| cluster_shield.features.container_vulnerability_management.in_use.integration_enabled     |                                                                                       | <code>false</code>                                |
| cluster_shield.features.container_vulnerability_management.local_cluster.enabled          |                                                                                       | <code>true</code>                                 |
| cluster_shield.features.container_vulnerability_management.local_cluster.registry_secrets |                                                                                       | <code>[]</code>                                   |
| cluster_shield.features.container_vulnerability_management.platform_services_enabled      |                                                                                       | <code>true</code>                                 |
| cluster_shield.features.container_vulnerability_management.registry_ssl.verify            |                                                                                       | <code>true</code>                                 |
| cluster_shield.features.container_vulnerability_management.remote_clusters.enabled        |                                                                                       | <code>false</code>                                |
| cluster_shield.features.kubernetes_metadata.enabled                                       |                                                                                       | <code>false</code>                                |
| ca.certs                                                                                  | A PEM-encoded x509 certificate. This can also be a bundle with multiple certificates. | <code>[]</code>                                   |
| ca.keyName                                                                                | Filename that is used when creating the secret. Required if certs is provided.        | <code>null</code>                                 |
| ca.existingCaSecret                                                                       | Provide the name of an existing Secret that contains the CA required                  | <code>null</code>                                 |
| ca.existingCaSecretKeyName                                                                | Provide the filename that is defined inside the existing Secret                       | <code>null</code>                                 |
| ca.existingCaConfigMap                                                                    | Provide the name of an existing ConfigMap that contains the CA required               | <code>null</code>                                 |
| ca.existingCaConfigMapKeyName                                                             | Provide the filename that is defined inside the existing ConfigMap                    | <code>null</code>                                 |
| run_command                                                                               |                                                                                       | <code>"run-all-namespaced"</code>                 |
| image.repository                                                                          |                                                                                       | <code>quay.io/sysdig/cluster-shield</code>        |
| image.pullPolicy                                                                          |                                                                                       | <code></code>                                     |
| proxy.httpProxy                                                                           |                                                                                       | <code></code>                                     |
| proxy.httpsProxy                                                                          |                                                                                       | <code></code>                                     |
| proxy.noProxy                                                                             |                                                                                       | <code></code>                                     |
| imagePullSecrets                                                                          |                                                                                       | <code>[]</code>                                   |
| probes.liveness.initialDelaySeconds                                                       |                                                                                       | <code>5</code>                                    |
| probes.liveness.periodSeconds                                                             |                                                                                       | <code>5</code>                                    |
| probes.readiness.initialDelaySeconds                                                      |                                                                                       | <code>10</code>                                   |
| probes.readiness.periodSeconds                                                            |                                                                                       | <code>5</code>                                    |
| podAnnotations                                                                            |                                                                                       | <code>{}</code>                                   |
| podLabels                                                                                 |                                                                                       | <code>{}</code>                                   |
| service.type                                                                              |                                                                                       | <code>ClusterIP</code>                            |
| service.monitoring_port                                                                   |                                                                                       | <code></code>                                     |
| service.admission_control_port                                                            |                                                                                       | <code></code>                                     |
| service.audit_port                                                                        |                                                                                       | <code></code>                                     |
| serviceAccount.name                                                                       |                                                                                       | <code></code>                                     |
| serviceAccount.create                                                                     |                                                                                       | <code>true</code>                                 |
| serviceAccount.labels                                                                     |                                                                                       | <code>{}</code>                                   |
| serviceAccount.annotations                                                                |                                                                                       | <code>{}</code>                                   |
| resources                                                                                 |                                                                                       | <code>{}</code>                                   |
| priorityClassName                                                                         |                                                                                       | <code></code>                                     |
| createPriorityClass                                                                       |                                                                                       | <code>false</code>                                |
| priorityClassValue                                                                        |                                                                                       | <code>10</code>                                   |
| nodeSelector                                                                              |                                                                                       | <code>{}</code>                                   |
| tolerations                                                                               |                                                                                       | <code>[]</code>                                   |
| affinity                                                                                  |                                                                                       | <code>{}</code>                                   |
| replicaCount                                                                              |                                                                                       | <code>2</code>                                    |
| updateStrategy.type                                                                       |                                                                                       | <code>RollingUpdate</code>                        |
| updateStrategy.rollingUpdate                                                              |                                                                                       | <code>{}</code>                                   |
| onPremCompatibilityVersion                                                                |                                                                                       | <code></code>                                     |


## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
make test
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.
