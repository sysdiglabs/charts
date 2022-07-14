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

The following table lists the configurable parameters of the Sysdig KSPM Collector chart and their default values:

| Parameter                                | Description                                                                             | Default                                                       |
|------------------------------------------|-----------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `sysdig.accessKey`                       | Your Sysdig Access Key                                                                  | ` ` Either accessKey or existingAccessKeySecret is required   |
| `sysdig.existingAccessKeySecret`         | Alternatively, specify the name of a Kubernetes secret containing an 'access-key' entry | ` ` Either accessKey or existingAccessKeySecret is required   |
| `rapidResponse.passphrase`               | A passphrase used to encrypt all traffic between the user and host                      | ` ` Either passphrase or existingPassphraseSecret is required |
| `rapidResponse.existingPassphraseSecret` | Alternatively, specify the name of a Kubernetes secret containing an 'passphrase' entry | ` ` Either passphrase or existingPassphraseSecret is required |
| `image.registry`                         | Rapid Response image registry                                                           | `quay.io`                                                     |
| `image.repository`                       | The image repository to pull from                                                       | `sysdig/rapid-response-host-component`                        |
| `image.tag`                              | The image tag to pull                                                                   | `0.3.3`                                                       |
| `image.digest`                           | The image digest to pull                                                                | ` `                                                           |
| `image.pullPolicy`                       | The Image pull policy                                                                   | `Always`                                                      |
| `resources.requests.cpu`                 | Rapid Response CPU requests                                                             | `150m`                                                        |
| `resources.requests.memory`              | Rapid Response Memory requests                                                          | `256Mi`                                                       |
| `resources.limits.cpu`                   | Rapid Response CPU limits                                                               | `500m`                                                        |
| `resources.limits.memory`                | Rapid Response Memory limits                                                            | `1536Mi`                                                      |
| `apiEndpoint`                            | Rapid Response apiEndpoint                                                              | `""`                                                          |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --create-namespace -n rapid-response rapid-response \
    --set sysdig.accessKey=YOUR-KEY-HERE, \
    sysdig/rapid-response
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For
example,

```bash
$ helm install --namespace kspmcollector kspm-collector -f values.yaml sysdig/kspm-collector
```