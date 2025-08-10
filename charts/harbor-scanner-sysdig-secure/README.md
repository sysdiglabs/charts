<!--
TODO: Correct content is now in README.md, being refactories. We will copy back to README.tpl once finished

DO NOT MODIFY README.md MANUALLY!! CHANGE README.tpl instead!!

README.md IS AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Harbor Scanner Adapter for Sysdig Secure

This chart deploys the [Harbor Scanner Adapter](https://github.com/sysdiglabs/harbor-scanner-sysdig-secure) for Sysdig Secure on your Kubernetes cluster.

## Prerequisites

- Helm 3
- [Sysdig Secure API Token](https://docs.sysdig.com/en/docs/administration/administration-settings/user-profile-and-password/retrieve-the-sysdig-api-token/)

## Installation

To install the chart:

```console
helm repo add sysdig https://charts.sysdig.com
helm repo update
helm install sysdig-harbor-scanner --namespace sysdig-harbor-scanner --create-namespace -f values.yaml sysdig/harbor-scanner-sysdig-secure
```

## Verify the integrity and origin
Sysdig Helm Charts are signed so users can verify the integrity and origin of each chart, the steps are as follows:

### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

### Verify the chart

To check the integrity and the origin of the charts you can now append the `--verify` flag to the `install`, `upgrade` and `pull` helm commands.

## Configuration

You can use the Helm chart to update the default agent configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install`command.

For example:

```bash
helm upgrade --install sysdig-harbor-scanner sysdig/harbor-scanner-sysdig-secure \
    --create-namespace -n sysdig-harbor-scanner --version=0.9.0  \
    --set sysdig.secure.apiToken=<SECURE-API-TOKEN>
```

### Using values.yaml

The `values.yaml` file specifies the values for the admission controller configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

For example:

```bash
helm upgrade --install sysdig-harbor-scanner sysdig/harbor-scanner-sysdig-secure \
     --create-namespace -n sysdig-harbor-scanner --version=0.9.0  \
    --values values.yaml

```

See the default [`values.yaml`](./values.yaml) file for more information.


## Configuration Parameters

The following table lists the configurable parameters of the `harbor-scanner-sysdig-secure` chart and their default values.

|                 Parameter                  |                                                                                                                                  Description                                                                                                                                   |                        Default                        |
|--------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------|
| replicaCount                               | Specifies the number of replicas for the Scanner Adapter.                                                                                                                                                                                                                      | <code>1</code>                                        |
| image.repository                           | Specifies the image repository to pull the image from.                                                                                                                                                                                                                         | <code>sysdiglabs/harbor-scanner-sysdig-secure</code>  |
| image.tag                                  | Specifies the image tag to pull.                                                                                                                                                                                                                                               | <code></code>                                         |
| image.pullPolicy                           | Specifies the image pull policy.                                                                                                                                                                                                                                               | <code>IfNotPresent</code>                             |
| imagePullSecrets                           | Specifies the image pull secrets.                                                                                                                                                                                                                                              | <code>[]</code>                                       |
| nameOverride                               | Specifies the chart name override.                                                                                                                                                                                                                                             | <code>""</code>                                       |
| fullnameOverride                           | Specifies the chart full name override                                                                                                                                                                                                                                         | <code>""</code>                                       |
| podAnnotations                             | Specifies the custom pod annotations.                                                                                                                                                                                                                                          | <code>{}</code>                                       |
| serviceAccount.create                      | Specifies whether a service account should be created                                                                                                                                                                                                                          | <code>true</code>                                     |
| serviceAccount.annotations                 | Annotations to add to the service account                                                                                                                                                                                                                                      | <code>{}</code>                                       |
| serviceAccount.name                        | The name of the service account to use. If not set and create is true, a name is generated using the fullname template                                                                                                                                                         | <code></code>                                         |
| rbac.create                                | Creates and uses RBAC resources.                                                                                                                                                                                                                                               | <code>true</code>                                     |
| podSecurityContext                         | Enables deployment PSPs.                                                                                                                                                                                                                                                       | <code>{}</code>                                       |
| securityContext                            | Enables securityContext.                                                                                                                                                                                                                                                       | <code>{}</code>                                       |
| service.type                               | Specifies the service type.                                                                                                                                                                                                                                                    | <code>ClusterIP</code>                                |
| service.port                               | Specifies the port for the service.                                                                                                                                                                                                                                            | <code>5000</code>                                     |
| resources                                  | Specifies the resources of the pod.                                                                                                                                                                                                                                            | <code>{}</code>                                       |
| nodeSelector                               | Specifies the nodeSelector for scheduling.                                                                                                                                                                                                                                     | <code>{}</code>                                       |
| tolerations                                | Specifies the tolerations for scheduling.                                                                                                                                                                                                                                      | <code>[]</code>                                       |
| affinity                                   | Enables affinity rules                                                                                                                                                                                                                                                         | <code>{}</code>                                       |
| customEntryPoint                           | Overrides the container entrypoint.                                                                                                                                                                                                                                            | <code>[]</code>                                       |
| sysdig.secure.apiToken                     | Specifies the API Token to access Sysdig Secure. This value is **required** if the `sysdig.secure.existingSecureAPITokenSecret` is not specified.                                                                                                                              | <code>""</code>                                       |
| sysdig.secure.existingSecureAPITokenSecret | Specifies the existing secret name with API Token to access Sysdig Secure. Specify the name of a Kubernetes secret containing an 'sysdig_secure_api_token' entry If both are not configured, you must provide the deployment with the `SECURE_API_TOKEN` environment variable. | <code>""</code>                                       |
| sysdig.secure.url                          | Sysdig backend URL. SaaS Regions API endpoints are listed [here](https://docs.sysdig.com/en/docs/administration/saas-regions-and-ip-ranges/)                                                                                                                                   | <code>"https://secure.sysdig.com"</code>              |
| sysdig.secure.verifySSL                    | Verifies whether SSL certificate when connecting to Sysdig Secure endpoint.                                                                                                                                                                                                    | <code>true</code>                                     |
| proxy.httpProxy                            | Specifies the URL of the proxy for HTTP connections. Leave empty if not using proxy. It sets the `http_proxy` environment variable.                                                                                                                                            | <code></code>                                         |
| proxy.httpsProxy                           | Specifies the URL of the proxy for HTTPS connections. Leave empty if not using proxy. It sets the `https_proxy` environment variable.                                                                                                                                          | <code></code>                                         |
| proxy.noProxy                              | Comma-separated list of domain extensions proxy should not be used for. Include in `noProxy` the internal IP of the kubeapi server, and you probably need to add your registry if it is inside the cluster                                                                     | <code></code>                                         |
| cliScanning.enabled                        | Enables the CLI Scanning feature.                                                                                                                                                                                                                                              | <code>true</code>                                     |
| cliScanning.image                          | Specifies the pullstring for the CLI Scanner Image.                                                                                                                                                                                                                            | <code>quay.io/sysdig/sysdig-cli-scanner:latest</code> |
| cliScanning.existingSecureAPITokenSecret   | Specifies the existing secret name with API Token to access Sysdig Secure                                                                                                                                                                                                      | <code>""</code>                                       |
| asyncMode.enabled                          | Enables the Async-Mode feature.                                                                                                                                                                                                                                                | <code>true</code>                                     |
