# Sysdig Deploy

Use the sysdig-deploy Helm chart to install Sysdig Secure and/or Sysdig Monitor in a Kubernetes environment.

## Introduction

This chart deploys various Sysdig components into your Kubernetes cluster.

Currently included components:
- [Sysdig Agent](https://github.com/sysdiglabs/charts/tree/master/charts/agent)
- [Sysdig KSPM Collector](https://github.com/sysdiglabs/charts/tree/master/charts/kspm-collector)
- [Sysdig Host Scanner](https://github.com/sysdiglabs/charts/tree/master/charts/node-analyzer#host-scanner)
- [Sysdig Rapid Response](https://github.com/sysdiglabs/charts/tree/master/charts/rapid-response)
- [Sysdig Admission Controller](https://github.com/sysdiglabs/charts/tree/master/charts/admission-controller)

## Prerequisites

- Kubernetes 1.9+ with Beta APIs enabled
- Helm v3.6+

## Installation


> **_NOTE:_** Below are the legacy instructions for installing the `sysdig-deploy` chart.
> For more detailed installation instructions go here:
> * [Sysdig Monitor only](https://docs.sysdig.com/en/install-kubernetes-monitor)
> * [Sysdig Secure, or Sysdig Secure and Sysdig Monitor](https://docs.sysdig.com/en/install-kubernetes-secure)


1. Add the Sysdig Helm repo:

   ```bash
   helm repo add sysdig https://charts.sysdig.com/
   ```

2. Collect the following values:

   - ACCESS_KEY: This is your Sysdig access key
   - SAAS_REGION: The Sysdig SAAS region the agents will connect to. Use one of the following values:
     - `"us1"`
     - `"us2"`
     - `"us3"`
     - `"us4"`
     - `"eu1"`
     - `"au1"`
     - `"custom"`: For on-prem installations, use `custom` and override the endpoints for each component. For more information, see [Configuration](#configuration).
   - CLUSTER_NAME: An identifier for your cluster

3. Create a namespace for the Sysdig agent:

   ```bash
   kubectl create ns sysdig-agent
   ```

4. Do one of the following:

    - Using the release name `sysdig-agent`, run the following snippet to install the release into the namespace `sysdig-agent`:

      ```bash
      helm install sysdig-agent --namespace sysdig-agent \
      --set global.sysdig.accessKey=<ACCESS_KEY> \
      --set global.sysdig.region=<SAAS_REGION> \
      --set nodeAnalyzer.secure.vulnerabilityManagement.newEngineOnly=true \
      --set global.kspm.deploy=true \
      --set nodeAnalyzer.nodeAnalyzer.benchmarkRunner.deploy=false \
      --set global.clusterConfig.name=<CLUSTER_NAME> \
      sysdig/sysdig-deploy
        ```

      **GKE Autopilot**: GKE Autopilot environments require an additional configuration parameter, `agent.gke.autopilot=true`, to install the Sysdig agent:

      ```bash
      helm install sysdig-agent --namespace sysdig-agent \
      --set global.sysdig.accessKey=<ACCESS_KEY> \
      --set global.sysdig.region=<SAAS_REGION> \
      --set nodeAnalyzer.secure.vulnerabilityManagement.newEngineOnly=true \
      --set global.kspm.deploy=true \
      --set nodeAnalyzer.nodeAnalyzer.benchmarkRunner.deploy=false \
      --set global.clusterConfig.name=<CLUSTER_NAME> \
      --set agent.gke.autopilot=true \
      sysdig/sysdig-deploy
      ```


    - Install with a values file.

      To do so, create a new file `values.sysdig.yaml`:

       ```yaml
       global:
         sysdig:
           accessKey: ACCESS_KEY
           region: SAAS_REGION
         clusterConfig:
           name: CLUSTER_NAME
       ```

       and install it with:

       ```bash
       helm install -n sysdig-agent sysdig sysdig/sysdig-deploy -f values.sysdig.yaml
       ```



## Migrating from `sysdig` chart

To easily migrate from the previous `sysdig` chart to the new unified `sysdig-deploy` chart, use the [migration helper script](https://raw.githubusercontent.com/sysdiglabs/charts/master/charts/sysdig-deploy/scripts/migrate_values.py) from this repo. This script will help re-map your existing values from the `sysdig` chart, allowing you to deploy this chart with the exact same configuration.

*Note*: unlike the previous chart, this chart only supports Helm 3. If you have not already done so, please upgrade your Helm version to 3.x to use this chart.

Requirements:
- Python 3.x
- PyYAML

Save the user-values from the currently deployed version of the `sysdig` chart:

```bash
helm get values -n sysdig-agent sysdig-agent -o yaml > values.old.yaml
```

Note: the migration script has a dependency on `pyyaml`, which can be installed with

```bash
pip install pyyaml
```

Run the migration script and redirect the output to a new file. For example, if the old values were saved to `values.old.yaml`:

```bash
python scripts/migrate_values.py values.old.yaml > values.new.yaml
```

Now the `sysdig` chart can be removed and replaced with the `sysdig-deploy` chart.

```bash
helm delete -n sysdig-agent sysdig-agent

helm repo update
helm install -n sysdig-agent sysdig sysdig/sysdig-deploy -f values.new.yaml
```

### Differences between `sysdig` and `sysdig-deploy`

There are several differences in the agent and node-analyzer components in the new chart compared to the old one. The majority of the differences are in the metadata names and labels.

- `helm.sh/chart: sysdig-<version>` -> `helm.sh.chart: nodeAnalyzer-<version>` or `helm.sh.chart: agent-<version>`
- label `app.kubernetes.io/name: agent` for the agent daemonset and pods
- label `app.kubernetes.io/name: nodeanalyzer` for the nodeAnalyzer daemonset and pods
- new configmap and secret for nodeAnalyzer named `<release-name>-nodeanalyzer`
- label `app: sysdig-agent` is no longer on nodeAnalyzer components

## Upgrading

Refresh the `sysdig` helm repo to get the latest chart.

```bash
helm repo update
```

Get the currently deployed values and save them to `values.sysdig.yaml`.

```bash
helm get values -n sysdig-agent sysdig-agent -o yaml > values.sysdig.yaml
```

Upgrade to the latest version of the chart:

```bash
helm upgrade -n sysdig-agent sysdig-agent sysdig/sysdig-deploy -f values.sysdig.yaml
```

## Configuration


The following table lists the configurable parameters of the sysdig-deploy chart and their default values. The sysdig-deploy chart itself only has select parameters that are used by multiple subcharts, and those are used to enable/disable selected subcharts. If you need additional configuration values, those are available in the various READMEs of the individual subcharts ([admission-controller](https://charts.sysdig.com/charts/admission-controller/), [agent](https://charts.sysdig.com/charts/agent/), [node-analyzer](https://charts.sysdig.com/charts/node-analyzer/), [kspm-collector](https://charts.sysdig.com/charts/kspm-collector/) and [rapid-response](https://charts.sysdig.com/charts/rapid-response/)).

| Parameter                               | Description                                                                                                             | Default   |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | --------- |
| `global.clusterConfig.name`             | Identifier for this cluster                                                                                             | `""`      |
| `global.sysdig.accessKey`               | Sysdig Agent Access Key                                                                                                 | `""`      |
| `global.sysdig.accessKeySecret`         | The name of a Kubernetes secret containing an 'access-key' entry                                                        | `""`      |
| `global.sysdig.secureAPIToken`          | API Token to access Sysdig Secure                                                                                       | `""`      |
| `global.sysdig.secureAPITokenSecret`    | The name of a Kubernetes secret containing API Token to access Sysdig Secure                                            | `""`      |
| `global.sysdig.region`                  | The SaaS region for these agents. Possible values: `"us1"`, `"us2"`, `"us3"`, `"us4"`, `"eu1"`, `"au1"`, and `"custom"`. See [Regions and IP Ranges](https://docs.sysdig.com/en/docs/administration/saas-regions-and-ip-ranges/) for more information  | `"us1"`   |
| `global.sysdig.tags`                    | Sets the global tags which can override agent tags                                                                      | `{}`      |
| `global.imageRegistry`                  | Container image registry                                                                                                | ``        |
| `global.proxy.httpProxy`                | Sets `http_proxy` on the Agent container                                                                                | `""`      |
| `global.proxy.httpsProxy`               | Sets `https_proxy` on the Agent container                                                                               | `""`      |
| `global.proxy.noProxy`                  | Sets `no_proxy` on the Agent container                                                                                  | `""`      |
| `global.kspm.deploy`                    | Enables Sysdig KSPM node analyzer & KSPM collector                                                                      | `false`   |
| `global.agentConfigmapName`             | Sets a configmap name that is used to mount the agent configmap to fetch the cluster name and agent tags                | `"sysdig-agent"`      |
| `global.gke.autopilot`                  | If true, overrides the configuration to values for GKE Autopilot clusters                                               | `false`   |
| `admissionController`                   | Config specific to the [Sysdig AdmissionController](#admissioncontroller)                                               | `{}`      |
| `admissionController.enabled`           | Enable the admission controller component in this chart                                                                 | `false`   |
| `agent`                                 | Config specific to the [Sysdig Agent](#agent)                                                                           | `{}`      |
| `agent.enabled`                         | Enable the agent component in this chart                                                                                | `true`    |
| `nodeAnalyzer`                          | Config specific to the [Sysdig nodeAnalyzer](#nodeanalyzer)                                                             | `{}`      |
| `nodeAnalyzer.enabled`                  | Enable the nodeAnalyzer component in this chart                                                                         | `true`    |
| `nodeAnalyzer.secure.enabled`           | Enable Sysdig Secure                                                                                                    | `true`    |
| `nodeAnalyzer.secure.vulnerabilityManagement.newEngineOnly` | Enable only the new vulnerability management engine                                                 | `false`   |
| `nodeAnalyzer.nodeAnalyzer.apiEndpoint` | nodeAnalyzer apiEndpoint                                                                                                | `""`      |
| `nodeAnalyzer.nodeAnalyzer.benchmarkRunner.deploy` | Deploy the Benchmark Runner Scanner                                                                          | `true`   |
| `nodeAnalyzer.nodeAnalyzer.runtimeScanner.deploy` | Deploy the Runtime Scanner                                                                                    | `false`   |
| `kspmCollector`                         | Config specific to the [Sysdig KSPM Collector](#kspm-collector)                                                         | `{}`      |
| `kspmCollector.apiEndpoint`             | kspmCollector apiEndpoint                                                                                               | `""`      |
| `rapidResponse`                         | Config specific to [Sysdig Rapid Response](#rapid-response)                                                             | `{}`      |
| `rapidResponse.enabled`                 | Enable Rapid Response component in this chart                                                                           | `""`      |

## AdmissionController

For configuration values of the `admission-controller`, see the `admission-controller` subchart [README](https://github.com/sysdiglabs/charts/tree/master/charts/admission-controller/README.md). Prefix all the specific configurations with `admissionController.` to apply them to the chart.

Example: override sysdig url variable for admissionController chart

As a command line parameter:
```bash
helm install sysdig sysdig/sysdig-deploy \
    --set global.sysdig.accessKey=ACCESS_KEY \
    --set global.sysdig.secureAPIToken=SECURE_API_TOKEN \
    --set global.clusterConfig.name=CLUSTER_NAME \
    --set admissionController.enabled=true \
    --set admissionController.sysdig.url=SECURE_URL
```

As a values file:
```yaml
global:
  clusterConfig:
    name: CLUSTER_NAME
  sysdig:
    accessKey: ACCESS_KEY
    secureAPIToken: SECURE_API_TOKEN
admissionController:
  enabled: true
  sysdig:
    url: URL
```

## Agent

For configuration values of the `agent`, see the Agent subchart [README](https://github.com/sysdiglabs/charts/tree/master/charts/agent/README.md). Prefix all the specific configurations with `agent.` to apply them to the chart.

Example: override proxy variable for Agent chart

As a command line parameter:
```bash
helm install sysdig sysdig/sysdig-deploy \
    --namespace sysdig-agent \
    --set global.sysdig.accessKey=ACCESS_KEY \
    --set global.sysdig.region=SAAS_REGION \
    --set global.clusterConfig.name=CLUSTER_NAME \
    --set global.proxy.httpProxy=PROXY_URL \
    --set agent.proxy.httpProxy=OVERRIDE_PROXY_URL
```

As a values file:
```yaml
global:
  sysdig:
    accessKey: ACCESS_KEY
    region: SAAS_REGION
  clusterConfig:
    name: CLUSTER_NAME
  proxy:
    httpProxy: PROXY_URL

agent:
  proxy:
    httpProxy: OVERRIDE_PROXY_URL
```

## NodeAnalyzer

For configuration values of the `node-analyzer`, see the `node-analyzer` subchart [README](https://github.com/sysdiglabs/charts/tree/master/charts/node-analyzer/README.md). Prefix all the specific configurations with `nodeAnalyzer.` to apply them to the chart.

Example: override apiEndpoint variable for nodeAnalyzer chart

As a command line parameter:
```bash
helm install sysdig sysdig/sysdig-deploy \
    --set global.sysdig.accessKey=ACCESS_KEY \
    --set agent.collectorSettings.collectorHost=COLLECTOR_ENDPOINT \
    --set nodeAnalyzer.nodeAnalyzer.apiEndpoint=API_ENDPOINT
```

As a values file:
```yaml
global:
  sysdig:
    accessKey: ACCESS_KEY

agent:
  enabled: false
  collectorSettings:
    collectorHost: COLLECTOR_ENDPOINT

nodeAnalyzer:
  nodeAnalyzer:
    apiEndpoint: API_ENDPOINT
```

## KSPM Collector

For configuration values of the `kspm-collector`, see the `kspm-collector` subchart [README](https://github.com/sysdiglabs/charts/tree/master/charts/kspm-collector/README.md). Prefix all the specific configurations with `kspmCollector.` to apply them to the chart.

Example: override apiEndpoint variable for kspmCollector chart

As a command line parameter:
```bash
helm install sysdig sysdig/sysdig-deploy \
    --set global.sysdig.accessKey=ACCESS_KEY \
    --set kspmCollector.apiEndpoint=API_ENDPOINT
```

As a values file:
```yaml
global:
  sysdig:
    accessKey: ACCESS_KEY

kspmCollector:
  apiEndpoint: API_ENDPOINT
```

## Rapid Response

For configuration values of `rapid-response`, see the `rapid-response` subchart [README](https://github.com/sysdiglabs/charts/tree/master/charts/rapid-response/README.md). Prefix all the specific configurations with `rapidResponse.` to apply them to the chart.

Example: Enable the Rapid Response component and define the passphrase for it

As a command line parameter:
```bash
helm install sysdig sysdig/sysdig-deploy \
    --set global.sysdig.accessKey=ACCESS_KEY \
    --set rapidResponse.enabled=true \
    --set rapidResponse.rapidResponse.passphrase=THIS_IS_A_SECRET_PASSPHRASE
```

As a values file:
```yaml
global:
  sysdig:
    accessKey: ACCESS_KEY

rapidResponse:
  enabled: true
  rapidResponse:
    passphrase: THIS_IS_A_SECRET_PASSPHRASE
```

## Pod Security Policy & Pod Security Admission

- Some Sysdig components pods require privileged access in order to run, (e.g. agent, admission-controller(scanner), node-analyzer).\
We used to ship a Pod Security Policy by default on every installation.\
However, Pod Security Policy has been deprecated since Kubernetes v1.21 and removed since Kubernetes v1.25, [link](https://kubernetes.io/docs/concepts/security/pod-security-policy/).\
Therefore we introduced a [check](https://github.com/sysdiglabs/charts/blob/607573107af04dd070fd7204f094d886415796db/charts/agent/templates/psp.yaml#L1)
in order to deploy the policy only if the k8s version detected by helm is < 1.25.

- As a replacement for Pod Security Policy, Kubernetes provides a new mechanism, [Pod Security Admission](https://kubernetes.io/docs/concepts/security/pod-security-admission/).\
In a cluster using Pod Security Admission controller, enforcing a lower than priviliged [level](https://kubernetes.io/docs/concepts/security/pod-security-admission/#pod-security-levels)\
will prevent the pods from working as intended, in order to avoid such issue the correct labels must be set in the namespace where the pods run.\
(This step cannot be done by the helm chart itself during the installation due to helm limitations)

For example, adding the following labels to the namespace that is running Agent pods:
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: sysdig-agent
  labels:
    pod-security.kubernetes.io/enforce: privileged
    pod-security.kubernetes.io/enforce-version: latest
    pod-security.kubernetes.io/audit: privileged
    pod-security.kubernetes.io/audit-version: latest
    pod-security.kubernetes.io/warn: privileged
    pod-security.kubernetes.io/warn-version: latest
```

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

Before running the tests make sure the chart dependencies are updated
```
helm dependency update
```

You can test the changes to your chart by running the test suites as follows:
```
helm unittest --helm3 .
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.
