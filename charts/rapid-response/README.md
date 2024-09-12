# Chart: Rapid Response

## Overview

Rapid Response allows security teams to connect to a remote shell within your environment to troubleshoot and investigate an event using the commands they are already accustomed to, with the flexibility they need to run the security tools at their disposal, directly from the event alert. For more information on this feature, see [Rapid Response ](https://docs.sysdig.com/en/docs/sysdig-secure/investigate/rapid-response/).

Use the [sysdig-deploy](../sysdig-deploy/README.md) parent chart to deploy the Rapid Response. Do not deploy subcharts directly.

For installation instructions, see [Install Rapid Response](https://docs.sysdig.com/en/install-rapid-response-k8s/).

## Verify the integrity and origin
Sysdig Helm Charts are signed so users can verify the integrity and origin of each chart, the steps are as follows:

### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

### Verify the chart

To check the integrity and the origin of the charts, append the `--verify` flag to the `install`, `upgrade`, and `pull` helm commands.

## Configuration

You can use the Helm chart to update the default Rapid Response configurations by using either of the following:

- Using the key-value pair: `--set sysdig.settings.key = value`
- `values.yaml` file

### Using the Key-Value Pair

Specify each parameter using the `--set key=value[,key=value]` argument to the `helm install` command.

For example:

```bash
helm install --create-namespace -n rapid-response rapid-response \
    --set sysdig.accessKey=<YOUR-ACCESS-KEY>, \
    sysdig/rapid-response
```

### Using values.yaml

The `values.yaml` file specifies the values for the Rapid Response configuration parameters.  You can add the configuration to the `values.yaml` file, then use it in the `helm install` command.

```bash
helm install --create-namespace -n rapid-response rapid-response \
    -f values.yaml sysdig/rapid-response
```

## Configuration Parameters

The following table lists the configurable parameters of the Sysdig Rapid Response chart and their default values:

| Parameter                                  | Description                                                  | Default                                                      |
| ------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `global.image.pullSecrets`                 | Sets the global pull secrets.                                | <code>[]</code>                                              |
| `global.image.pullPolicy`                  | Sets the global pull policy.                                 | <code>`IfNotPresent`</code>                                  |
| `sysdig.accessKey`                         | Specifies your Sysdig Access Key.                            | Either `accessKey` or `existingAccessKeySecret` is required  |
| `sysdig.existingAccessKeySecret`           | An alternative to using the Sysdig Agent Access Key. Specify the name of a Kubernetes secret containing an `access-key` entry. | Either `accessKey` or `existingAccessKeySecre`t is required  |
| `rapidResponse.passphrase`                 | Specifies a passphrase to encrypt the traffic between the user and the host. | `Either passphrase or existingPassphraseSecret` is required  |
| `rapidResponse.existingPassphraseSecret`   | An alternative to using the passphrase. Specify the name of a Kubernetes secret containing a `passphrase` entry. | Either passphrase or `existingPassphraseSecret` is required. |
| `rapidResponse.existingServiceAccount`     | (Optional) Sets the ServiceAccount name to provide additional capabilities to Rapid Response pod. | ` `                                                          |
| `rapidResponse.image.registry`             | Specifies the Rapid Response image registry.                 | `quay.io`                                                    |
| `rapidResponse.image.repository`           | Specifies the  image repository to pull from.                | `sysdig/rapid-response-host-component`                       |
| `rapidResponse.image.tag`                  | Specifies the  image tag to pull.                            | `"0.4.8"`                                                    |
| `rapidResponse.image.pullPolicy`           | Specifies the image pull policy.                             | `""`                                                         |
| `rapidResponse.imagePullSecrets`           | Specifies the image pull secret.                             | ` `                                                          |
| `rapidResponse.apiEndpoint`                | Specifies the Rapid Response `apiEndpoint`.                  | ` `                                                          |
| `rapidResponse.proxy.httpProxy`            | Sets the HTTP Proxy address.                                 | ` `                                                          |
| `rapidResponse.proxy.httpsProxy`           | Sets the HTTPS Proxy address.                                | ` `                                                          |
| `rapidResponse.proxy.noProxy`              | Sets IPs/URLs that should not pass trough a Proxy Server.    | ` `                                                          |
| `rapidResponse.resources.requests.cpu`     | Specifies the Rapid Response CPU requests.                   | `150m`                                                       |
| `rapidResponse.resources.requests.memory`  | Specifies the Rapid Response memory requests.                | `256Mi`                                                      |
| `rapidResponse.resources.limits.cpu`       | Specifies the Rapid Response CPU limits.                     | `500m`                                                       |
| `rapidResponse.resources.limits.memory`    | Specifies the Rapid Response memory limits.                  | `500Mi`                                                      |
| `rapidResponse.extraVolumes.volumes`       | Specifies the volumes to be made available in the Rapid Response shell. | `[]`                                                         |
| `rapidResponse.extraVolumes.mounts`        | Specifies the mount paths for the volumes specified.         | `[]`                                                         |
| `rapidResponse.scc.create`                 | Creates OpenShift's Security Context constraint.             | `true`                                                       |
| `rapidResponse.securityContext.privileged` | Privileged flag. OCP 4.x and other Kubernetes distributions require this flag to access host filesystem. | `false`                                                      |
| `rapidResponse.serviceAccount.create`      | Creates serviceAccount.                                      | `true`                                                       |
| `rapidResponse.serviceAccount.name`        | Uses this value as serviceAccountName.                       | `rapid-response`                                             |
| `rapidResponse.skipTlsVerifyCertificate`   | **Deprecated** Set it to `true` for disabling the certificate verification. | `false` **Deprecated** <br>use `sslVerifyCertificate` instead |
| `rapidResponse.ssl.ca.certs`               | Adds a list of CA certificates to be used by Rapid Response. | `[]`                                                         |
| `rapidResponse.sslVerifyCertificate`       | Set it to `false` for disabling the certificate verification. | `true`                                                       |
| `rapidResponse.tolerations`                | Specifies the tolerations for scheduling.                    | `node-role.kubernetes.io/master:NoSchedule` <br> `node-role.kubernetes.io/control-plane:NoSchedule` |

## Additional Configurations

### Add Volumes to Rapid Response

Rapid response is an isolated container when used out of the box. In order to access other volumes this chart supports, specify them through `rapidResponse.extraVolumes.volumes` and `rapidResponse.extraVolumes.mounts`.

In this example, the host root is mounted under `/host`:

```
rapidResponse:
  extraVolumes:
    volumes:
      - name: host-root-vol
        hostPath:
          path: /

    mounts:
      - mountPath: /host
        name: host-root-vol
```

### Customize Rapid Response Image

Each team can have different necessities and constraints when accessing critical workloads. To support different scenarios, the Rapid Response image is built with a small footprint, so that everyone can customize it based on their criteria.

See [Custom Image Example](https://github.com/sysdiglabs/rapid-response-custom-image-example/) to learn how to use `kubectl` for a  basic customization.

Additionally, when you pull the image from a private repository, follow your registry guidelines and deploy the credentials on the cluster. Then, you will be able to use them by setting the `rapidResponse.imagePullSecrets` parameter value to the secret name to use.

### Use a Custom ServiceAccount

To use a ServiceAccount that is different from the default one,

1. Ensure that the ServiceAccount is already created.

2. Install or upgrade the chart with the `rapidResponse.existingServiceAccount` parameter.

   For example:

   ```bash
   helm install --create-namespace -n rapid-response rapid-response \
       --set sysdig.accessKey=<YOUR-ACCESS-KEY>, rapidResponse.existingServiceAccount=<YOUSERVICEACCOUNT> \
       sysdig/rapid-response
   ```

   It takes the name of a ServiceAccount to be used in pods.

 This configuration helps you perform specific operations on the Kubernetes control plane.
