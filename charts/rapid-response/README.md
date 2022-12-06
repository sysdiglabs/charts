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

## Configuration

The following table lists the configurable parameters of the Sysdig Rapid Response chart and their default values:

| Parameter                                 | Description                                                                             | Default                                                       |
|-------------------------------------------|-----------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `sysdig.accessKey`                        | Your Sysdig Access Key                                                                  | ` ` Either accessKey or existingAccessKeySecret is required   |
| `sysdig.existingAccessKeySecret`          | Alternatively, specify the name of a Kubernetes secret containing an 'access-key' entry | ` ` Either accessKey or existingAccessKeySecret is required   |
| `rapidResponse.passphrase`                | A passphrase used to encrypt all traffic between the user and host                      | ` ` Either passphrase or existingPassphraseSecret is required |
| `rapidResponse.existingPassphraseSecret`  | Alternatively, specify the name of a Kubernetes secret containing an 'passphrase' entry | ` ` Either passphrase or existingPassphraseSecret is required |
| `rapidResponse.image.registry`            | Rapid Response image registry                                                           | `quay.io`                                                     |
| `rapidResponse.image.repository`          | The image repository to pull from                                                       | `sysdig/rapid-response-host-component`                        |
| `rapidResponse.image.tag`                 | The image tag to pull                                                                   | `0.3.6`                                                       |
| `rapidResponse.image.pullPolicy`          | The Image pull policy                                                                   | `IfNotPresent`                                                |
| `rapidResponse.imagePullSecrets`          | The Image pull secret                                                                   | ` `                                                           |
| `rapidResponse.apiEndpoint`               | Rapid Response apiEndpoint                                                              | ` `                                                           |
| `rapidResponse.proxy.httpProxy`           | Set HTTP Proxy address                                                                  | ` `                                                           |
| `rapidResponse.proxy.httpsProxy`          | Set HTTPS Proxy address                                                                 | ` `                                                           |
| `rapidResponse.proxy.noProxy`             | Set IPs/URLs that should not pass trough a Proxy server                                 | ` `                                                           |
| `rapidResponse.resources.requests.cpu`    | Rapid Response CPU requests                                                             | `150m`                                                        |
| `rapidResponse.resources.requests.memory` | Rapid Response Memory requests                                                          | `256Mi`                                                       |
| `rapidResponse.resources.limits.cpu`      | Rapid Response CPU limits                                                               | `500m`                                                        |
| `rapidResponse.resources.limits.memory`   | Rapid Response Memory limits                                                            | `500Mi`                                                       |
| `rapidResponse.skipTlsVerifyCertificate`  | ** Deprecated ** Set it to `true` for disabling the certificate verification            | `false` ** Deprecated ** use `sslVerifyCertificate` instead   |
| `rapidResponse.ssl.ca.certs`              | Add a list of CA certificates that need to be used by Rapid Response                    | `[]`                                                          |
| `rapidResponse.sslVerifyCertificate`      | Set it to `false` for disabling the certificate verification                            | `true`                                                        |
| `rapidResponse.tolerations`               | The tolerations for scheduling	                                                      | `node-role.kubernetes.io/master:NoSchedule`                   |
|                                                                                                                                       `node-role.kubernetes.io/control-plane:NoSchedule`            |


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

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
helm unittest --helm3 .
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.
