# Sysdig Deploy

Use the `sysdig-deploy` Helm chart to install Sysdig Secure and Sysdig Monitor in a Kubernetes environment.

## Prerequisites

Helm v3.6 or above

## Overview

This chart deploys the following Sysdig components into your Kubernetes cluster:

- [Sysdig Admission Controller](https://github.com/sysdiglabs/charts/tree/main/charts/admission-controller)
- [Sysdig Agent](https://github.com/sysdiglabs/charts/tree/main/charts/agent)
- [Sysdig Benchmark Runner (on-premises only)](https://github.com/sysdiglabs/charts/tree/main/charts/node-analyzer#benchmark-runner)
- [Sysdig Host Analyzer (on-premises only)](https://github.com/sysdiglabs/charts/tree/main/charts/node-analyzer#host-analyzer-legacy)
- [Sysdig Host Scanner](https://github.com/sysdiglabs/charts/tree/main/charts/node-analyzer#host-scanner)
- [Sysdig KSPM Analyzer](https://github.com/sysdiglabs/charts/tree/main/charts/node-analyzer#kspm-analyzer-preview)
- [Sysdig KSPM Collector](https://github.com/sysdiglabs/charts/tree/main/charts/kspm-collector)
- [Sysdig Image Analyzer (on-premises only)](https://github.com/sysdiglabs/charts/tree/main/charts/node-analyzer#node-image-analyzer)
- [Sysdig Rapid Response](https://github.com/sysdiglabs/charts/tree/main/charts/rapid-response)
- [Sysdig Runtime Scanner](https://github.com/sysdiglabs/charts/tree/main/charts/node-analyzer#runtime-scanner)

To deploy `sysdig-deploy`, follow the installation instructions given on the Sysdig Documentation website:

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


## Configuration

For the configuration values of the each sub-component, see the respective chart readme. To apply a specific configuration of a sub-component, prefix the configuration parameter with the name of the sub-chart.

You can update the configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Example: Admission Controller

See the `admission-controller` [README](https://github.com/sysdiglabs/charts/tree/main/charts/admission-controller/README.md) for the configuration values of the `admission-controller`. To override the Sysdig URL variable for the Admission Controller chart:

#### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command.

```bash
helm install sysdig sysdig/sysdig-deploy \
    --set global.sysdig.accessKey=ACCESS_KEY \
    --set global.sysdig.secureAPIToken=SECURE_API_TOKEN \
    --set global.clusterConfig.name=CLUSTER_NAME \
    --set admissionController.enabled=true
```

#### Using values.yaml

The `values.yaml` file specifies the values for the configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

1. Add the following to the `values.yaml` file:

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

2. Run the following:

   ```console
   helm install --namespace sysdig-agent sysdig-agent -f values.yaml sysdig/sysdig-deploy
   ```

### Example: NodeAnalyzer

See the `node-analyzer` subchart [README](https://github.com/sysdiglabs/charts/tree/main/charts/node-analyzer/README.md) for the configuration values of the `nodeAnalyzer`. To override the API endpoint variable:

#### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command

```bash
helm install sysdig sysdig/sysdig-deploy \
    --set global.sysdig.accessKey=ACCESS_KEY \
    --set agent.collectorSettings.collectorHost=COLLECTOR_ENDPOINT \
    --set nodeAnalyzer.nodeAnalyzer.apiEndpoint=API_ENDPOINT
```

#### Using values.yaml

The `values.yaml` file specifies the values for the configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

1. Add the following to the `values.yaml` file:

   ```yaml
   global:
     sysdig:
        accessKey: <ACCESS_KEY>
        region: <SAAS_REGION>

   nodeAnalyzer:
      secure:
        vulnerabilityManagement:
          newEngineOnly: true
      nodeAnalyzer:
        benchmarkRunner:
          deploy: false
        hostScanner:
          deploy: true
   ```

2. Run the following:

   ```console
   helm install --namespace sysdig-agent sysdig-agent -f values.yaml sysdig/sysdig-deploy
   ```

## Configuration Parameters

The following table lists the configurable parameters of the sysdig-deploy chart and their default values. The `sysdig-deploy` chart itself only has select parameters that are used by multiple subcharts, and those are used to enable or disable selected subcharts. For additional configuration values see the READMEs of the individual subcharts.

| Parameter                               | Description                                                                                                             | Default   |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | --------- |
| `global.clusterConfig.name`             | Unique identifier for this cluster.                                                                                    | `""`      |
| `global.sysdig.accessKey`               | Sysdig Agent Access Key.                                                                                                | `""`      |
| `global.sysdig.accessKeySecret`         | The name of a Kubernetes secret containing an `access-key` entry.                                                     | `""`      |
| `global.sysdig.secureAPIToken`          | The API Token to access Sysdig Secure.                                                                                  | `""`      |
| `global.sysdig.secureAPITokenSecret`    | The name of a Kubernetes secret containing API Token to access Sysdig Secure.                                           | `""`      |
| `global.sysdig.region`                  | The SaaS region for these agents. Possible values: `"us1"`, `"us2"`, `"us3"`, `"us4"`, `"eu1"`, `"au1"`, `"me2"`, and `"custom"`. See [SaaS Regions and IP Ranges](https://docs.sysdig.com/en/docs/administration/saas-regions-and-ip-ranges/) for more information  | `"us1"`   |
| `global.sysdig.tags`                    | Sets the global tags which can override agent tags.                                                                     | `{}`      |
| `global.imageRegistry`                  | The container image registry.                                                                                          | ``        |
| `global.image.pullSecrets`                  | The global pull secrets.                                                                                          | `[]`        |
| `global.image.pullPolicy`                  | The global pull policy.                                                                                          | `"`        |
| `global.proxy.httpProxy`                | Sets `http_proxy` on the agent container.                                                                              | `""`      |
| `global.proxy.httpsProxy`               | Sets `https_proxy` on the agent container.                                                                             | `""`      |
| `global.proxy.noProxy`                  | Sets `no_proxy` on the agent container.                                                                                | `""`      |
| `global.kspm.deploy`                    | Enables Sysdig KSPM node analyzer and  KSPM collector.                                                                  | `false`   |
| `global.agentConfigmapName`             | Sets a ConfigMap name that is used to mount the agent ConfigMap to fetch the cluster name and agent tags.          | `"sysdig-agent"`      |
| `global.gke.autopilot`                  | If set to `true`, the configuration to values for GKE Autopilot clusters will be overridden.                | `false`   |
| `admissionController`                   | The configurations specific to the Sysdig Admission Controller.                              | `{}`      |
| `admissionController.enabled`           | Enable the admission controller component in this chart.                                                                | `false`   |
| `agent`                                 | The configuration specific to the Sysdig Agent.                                                              | `{}`      |
| `agent.enabled`                         | Enable the agent component in this chart.                                                                               | `true`    |
| `nodeAnalyzer`                          | The configuration specific to the Sysdig Node Analyzer.                                             | `{}`      |
| `nodeAnalyzer.enabled`                  | Enable the `nodeAnalyzer` component in this chart.                                                                      | `true`    |
| `nodeAnalyzer.secure.enabled`           | Enable Sysdig Secure.                                                                                                   | `true`    |
| `nodeAnalyzer.secure.vulnerabilityManagement.newEngineOnly` | Enable only the new vulnerability management engine.                                                | `false`   |
| `nodeAnalyzer.nodeAnalyzer.apiEndpoint` | The API endpoint for `nodeAnalyzer`..                                                               | `""`      |
| `nodeAnalyzer.nodeAnalyzer.benchmarkRunner.deploy` | Deploy the Benchmark Runner Scanner.                                                                         | `true`   |
| `nodeAnalyzer.nodeAnalyzer.runtimeScanner.deploy` | Deploy the Runtime Scanner.                                                                                   | `false`   |
| `kspmCollector`                         | The configuration specific to the Sysdig KSPM Collector.     | `{}`      |
| `kspmCollector.apiEndpoint`             | The API endpoint for `kspmCollector`.                                                                       | `""`      |
| `rapidResponse`                         | The configuration specific to Sysdig Rapid Response.                                 | `{}`      |
| `rapidResponse.enabled`                 | Enable Rapid Response component in this chart.                                                                          | `false`      |
| `clusterShield`                         | The configuration specific to Sysdig Cluster Shield.                                 | `{}`      |
| `clusterShield.enabled`                 | Enable Cluster Shield component in this chart.                                                                          | `false`      |

## Upgrading

1. Refresh the `sysdig` helm repo to get the latest chart.

   ```console
   helm repo update
   ```

2. Get the currently deployed values and save them to `values.sysdig.yaml`.

   ```console
   helm get values -n sysdig-agent sysdig-agent -o yaml > values.sysdig.yaml
   ```

3. Upgrade to the latest version of the chart:

   ```console
   helm upgrade -n sysdig-agent sysdig-agent sysdig/sysdig-deploy -f values.sysdig.yaml
   ```

## Pod Security Policy & Pod Security Admission

- Some Sysdig components pods require privileged access in order to run. For example,  `agent`, `admission-controller`(scanner), `node-analyzer`. Sysdig ships a Pod Security Policy by default on every installation.
However, [Pod Security Policy](https://kubernetes.io/docs/concepts/security/pod-security-policy) has been deprecated since Kubernetes v1.21 and removed since Kubernetes v1.25.
Therefore,  Sysdig introduced a [check](https://github.com/sysdiglabs/charts/blob/607573107af04dd070fd7204f094d886415796db/charts/agent/templates/psp.yaml#L1) in order to deploy the policy for the Kubernetes version detected by helm is < `1.25`.

- As a replacement for Pod Security Policy, Kubernetes provides a new mechanism, [Pod Security Admission](https://kubernetes.io/docs/concepts/security/pod-security-admission/). In a cluster using the Pod Security Admission controller, enforcing a lower than priviliged [level](https://kubernetes.io/docs/concepts/security/pod-security-admission/#pod-security-levels) will prevent the pods from working as intended, in order to avoid such issue the correct labels must be set in the namespace where the pods run.

For example, adding the following labels to the namespace that is running the Agent pods:

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

This procedure cannot be done by the helm chart itself during the installation due to helm limitations

## Verify the Integrity and Origin

Sysdig Helm Charts are signed so you can verify the integrity and origin of each chart. To verify the chart:

### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

### Verify the Chart

To check the integrity and the origin of the charts you can now append the `--verify` flag to the `install`, `upgrade`, and `pull` helm commands.
