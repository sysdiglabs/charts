# Chart: Harbor Scanner Adapter for Sysdig Secure

This chart deploys the [Harbor Scanner Adapter](https://github.com/sysdiglabs/harbor-scanner-sysdig-secure) for Sysdig Secure on your Kubernetes cluster.

## Prerequisites

- Helm 3
- [Sysdig Secure API Token](https://docs.sysdig.com/en/docs/administration/administration-settings/user-profile-and-password/retrieve-the-sysdig-api-token/)

## Installation

To install the chart:

```console
helm repo add sysdig https://charts.sysdig.com
helm repo update
helm install harbor-scanner-sysdig-secure --namespace harbor-scanner-sysdig-secure --create-namespace -f values.yaml sysdig/harbor-scanner-sysdig-secure
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

```console
helm install harborscanner-release \
    --set sysdig.secure.apiToken=<SECURE-API-TOKEN> \
    sysdig/harbor-scanner-sysdig-secure
```

### Using values.yaml

The `values.yaml` file specifies the values for the configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

```console
$ helm install harborscanner-release -f values.yaml sysdig/harbor-scanner-sysdig-secure
```

## Configuration Parameters

The following table lists the configurable parameters of the Harbor Scanner
Sysdig Secure chart and their default values:

| Parameter                                    | Description                                                  | Default                                   |
| -------------------------------------------- | ------------------------------------------------------------ | ----------------------------------------- |
| `customEntryPoint`                           | Overrides the container entrypoint.                          | `[]`                                      |
| `replicaCount`                               | Specifies the number of replicas for the Scanner Adapter.    | `1`                                       |
| `image.repository`                           | Specifies the image repository to pull the image from.       | `sysdiglabs/harbor-scanner-sysdig-secure` |
| `image.tag`                                  | Specifies the image tag to pull.                             | `{{ Chart.AppVersion }}`                  |
| `image.pullPolicy`                           | Specifies the image pull policy.                             | `IfNotPresent`                            |
| `imagePullSecrets`                           | Specifies the image pull secrets.                            | `[]`                                      |
| `nameOverride`                               | Specifies the chart name override.                           | ` `                                       |
| `fullnameOverride`                           | Specifies the chart full name override                       | ` `                                       |
| `serviceAccount.create`                      | Creates the service account.                                 | `true`                                    |
| `serviceAccount.annotations`                 | Specifies the extra annotations for serviceAccount.          | `{}`                                      |
| `serviceAccount.name`                        | Specifies the serviceAccount name.                           | ` `                                       |
| `rbac.create`                                | Creates and uses RBAC resources.                             | `true`                                    |
| `podAnnotations`                             | Specifies the custom pod annotations.                        | `{}`                                      |
| `podSecurityContext`                         | Enables deployment PSPs.                                     | `{}`                                      |
| `securityContext`                            | Enables securityContext.                                     | `{}`                                      |
| `service.type`                               | Specifies the service type.                                  | `ClusterIP`                               |
| `service.port`                               | Specifies the port for the service.                          | `5000`                                    |
| `nodeSelector`                               | Specifies the nodeSelector for scheduling.                   | `{}`                                      |
| `tolerations`                                | Specifies the tolerations for scheduling.                    | `[]`                                      |
| `affinity`                                   | Enables affinity rules                                       | `{}`                                      |
| `sysdig.secure.apiToken`                     | Specifies the API Token to access Sysdig Secure. This value is **mandatory**. | ` `                                       |
| `sysdig.secure.existingSecureAPITokenSecret` | Specifies the existing secret name with API Token to access Sysdig Secure <br/>Alternatively, you can specify the name of a Kubernetes secret containing `sysdig_secure_api_token` entry. <br/><br/>If both are not configured, you must  provide the deployment with the `SECURE_API_TOKEN` environment variables. | ` `                                       |
| `sysdig.secure.url`                          | Specifies the Sysdig Secure endpoint.                        | `https://secure.sysdig.com`               |
| `sysdig.secure.verifySSL`                    | Verifies whether SSL certificate when connecting to Sysdig Secure endpoint. | `true`                                    |
| `proxy.httpProxy`                            | Specifies the URL of the proxy for HTTP connections. Leave empty if not using proxy. It sets the `http_proxy` environment variable. | ` `                                       |
| `proxy.httpsProxy`                           | Specifies the URL of the proxy for HTTPS connections. Leave empty if not using proxy.  It sets the `https_proxy` environment variable. | ` `                                       |
| `proxy.noProxy`                              | Specifies the comma-separated list of domain extensions proxy should not be used for. Includes the internal IP of the kube API server. | ` `                                       |
| `cliScanning.enabled`                     | Enables the CLI Scanning feature.                         | `true`                                    |
| `cliScanning.image`                       | Specifies the pullstring for the CLI Scanner Image.                         | `alpine:latest`                                    |
| `asyncMode.enabled`                          | Enables the Async-Mode feature.                              | `false`                                   |
