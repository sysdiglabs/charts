# Rapid Response

See the [Rapid Response documentation](https://docs.sysdig.com/en/docs/sysdig-secure/investigate/rapid-response/) for details on the Rapid Response feature.
Rapid Response allows security teams to connect to a remote shell within your environment to start troubleshooting and investigating an event using the
commands they are already accustomed to, with the flexibility they need to run the security tools at their disposal, directly from the event alert.



## Installing the Chart

Add Sysdig Helm charts repository:

```
$ helm repo add sysdig https://charts.sysdig.com
```

Deploy Rapid Response

```
$ helm install --create-namespace -n rapid-response rapid-response -f values.yaml sysdig/rapid-response
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

The following table lists the configurable parameters of the Sysdig Rapid Response chart and their default values:

| Parameter                                   | Description                                                                                                       | Default                                                                                             |
|---------------------------------------------|-------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| `global.image.pullSecrets`                                       | Global pull secrets.                                                                                                                                                                                                                                                                                                                                                                                                                                         | <code>[]</code>                                                                                                                                                                                    |
| `global.image.pullPolicy`                                       | Global pull policy.                                                                                                                                                                                                                                                                                                                                                                                                                                         | <code>`IfNotPresent`</code>
| `sysdig.accessKey`                          | Your Sysdig Access Key                                                                                            | ` ` Either accessKey or existingAccessKeySecret is required                                         |
| `sysdig.existingAccessKeySecret`            | Alternatively, specify the name of a Kubernetes secret containing an 'access-key' entry                           | ` ` Either accessKey or existingAccessKeySecret is required                                         |
| `rapidResponse.passphrase`                  | A passphrase used to encrypt all traffic between the user and host                                                | ` ` Either passphrase or existingPassphraseSecret is required                                       |
| `rapidResponse.existingPassphraseSecret`    | Alternatively, specify the name of a Kubernetes secret containing an 'passphrase' entry                           | ` ` Either passphrase or existingPassphraseSecret is required                                       |
| `rapidResponse.existingServiceAccount`      | ** Optional ** ServiceAccount name for provide additional capabilities to Rapid Response pod                      | ` `                                                                                                 |
| `rapidResponse.image.registry`              | Rapid Response image registry                                                                                     | `quay.io`                                                                                           |
| `rapidResponse.image.repository`            | The image repository to pull from                                                                                 | `sysdig/rapid-response-host-component`                                                              |
| `rapidResponse.image.tag`                   | The image tag to pull                                                                                             | `"0.3.9"`                                                                                           |
| `rapidResponse.image.pullPolicy`            | The Image pull policy                                                                                             | `""`                                                                                      |
| `rapidResponse.imagePullSecrets`            | The Image pull secret                                                                                             | ` `                                                                                                 |
| `rapidResponse.apiEndpoint`                 | Rapid Response apiEndpoint                                                                                        | ` `                                                                                                 |
| `rapidResponse.proxy.httpProxy`             | Set HTTP Proxy address                                                                                            | ` `                                                                                                 |
| `rapidResponse.proxy.httpsProxy`            | Set HTTPS Proxy address                                                                                           | ` `                                                                                                 |
| `rapidResponse.proxy.noProxy`               | Set IPs/URLs that should not pass trough a Proxy server                                                           | ` `                                                                                                 |
| `rapidResponse.resources.requests.cpu`      | Rapid Response CPU requests                                                                                       | `150m`                                                                                              |
| `rapidResponse.resources.requests.memory`   | Rapid Response Memory requests                                                                                    | `256Mi`                                                                                             |
| `rapidResponse.resources.limits.cpu`        | Rapid Response CPU limits                                                                                         | `500m`                                                                                              |
| `rapidResponse.resources.limits.memory`     | Rapid Response Memory limits                                                                                      | `500Mi`                                                                                             |
| `rapidResponse.extraVolumes.volumes`        | Use this to specify volumes to be made available in the Rapid Response shell                                      | `[]`                                                                                                |
| `rapidResponse.extraVolumes.mounts`         | Use this to specify mount paths for volumes specified                                                             | `[]`                                                                                                |
| `rapidResponse.scc.create`                  | Create OpenShift's Security Context Constraint | `true` |
| `rapidResponse.securityContext.privileged`  | Privileged flag. OCP 4.x and other Kubernetes distributions require this flag in order to access host filesystem. | `false`                                                                                             |
| `rapidResponse.serviceAccount.create`       | Create serviceAccount                                                                   | `true`                                                      |
| `rapidResponse.serviceAccount.name`         | Use this value as serviceAccountName                                                    | `rapid-response`                                            |
| `rapidResponse.skipTlsVerifyCertificate`    | **Deprecated** Set it to `true` for disabling the certificate verification                                        | `false` **Deprecated** use `sslVerifyCertificate` instead                                           |
| `rapidResponse.ssl.ca.certs`                | Add a list of CA certificates that need to be used by Rapid Response                                              | `[]`                                                                                                |
| `rapidResponse.sslVerifyCertificate`        | Set it to `false` for disabling the certificate verification                                                      | `true`                                                                                              |
| `rapidResponse.tolerations`                 | The tolerations for scheduling	                                                                                  | `node-role.kubernetes.io/master:NoSchedule` <br> `node-role.kubernetes.io/control-plane:NoSchedule` |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --create-namespace -n rapid-response rapid-response \
    --set sysdig.accessKey=YOUR-KEY-HERE, \
    sysdig/rapid-response
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For
example,

```bash
$ helm install --create-namespace -n rapid-response rapid-response \
    -f values.yaml sysdig/rapid-response
```

## Adding volumes to Rapid Response

Rapid response is an isolated container when used out of the box. In order to access other volumes this chart supports specifying them through `rapidResponse.extraVolumes.volumes` and `rapidResponse.extraVolumes.mounts`. In this example, the host root is mounted under `/host`:
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

## Customize Rapid Response image

As each team can have different necessities and constraints when accessing critical workloads. For this reason the Rapid Response image has a small footprint, so that everyone can customize it based on each own criteria.

A basic customization example in which `kubectl` is added can be found [here](https://github.com/sysdiglabs/rapid-response-custom-image-example/).

Along with this, you might need to pull such image from a private repository. In order to do that, follow your registry guidelines to deploy the credentials on the cluster. After that, you will be able to use them by setting the `rapidResponse.imagePullSecrets` parameter value to the secret name to use.

## Use a custom ServiceAccount

In some cases you might want to use a ServiceAccount different from the default one, in order to perform specific operations on the kubernetes control plane.

In such cases you can specify that with the `rapidResponse.existingServiceAccount` parameter. It takes the name of a ServiceAccount to be used in pods. The ServiceAccount must exist before the chart is installed/its configuration upgraded.

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
helm unittest --helm3 .
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.
