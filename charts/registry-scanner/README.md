# Registry scanner

This chart deploys the Sysdig Registry Scanner as a scheduled Cronjob in your Kubernetes cluster.

## Installing the Chart

Add Sysdig Helm charts repository:

```
$ helm repo add sysdig https://charts.sysdig.com
```

Deploy the registry scanner specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm upgrade --install registry-scanner \
    --set config.secureBaseURL=SECURE_URL \
    --set config.secureAPIToken=YOUR-KEY-HERE \
    --set config.registryURL=REGISTRY-URL \
    --set config.registryUser=admin \
    --set config.registryPassword=REGISTRY-PASSWORD-HERE \
    sysdig/registry-scanner
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release-name -f values.yaml sysdig/registry-scanner
```


By default the created CronJob, scheduled at the default time: 6:00 am.
For testing purpose you can launch a manual job:

```
kubectl create job --from=cronjob/registry-scanner registry-scanner-manual
```


## Uninstalling the Chart

To uninstall/delete

```console
$ helm uninstall sysdig/registry-scanner -n registry-scanner
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


## Configuration

The following table lists the configurable parameters of the Sysdig Registry Scanner chart and their default values:

| Parameter                            | Description                                                                                                            | Default                         |
|--------------------------------------|------------------------------------------------------------------------------------------------------------------------|---------------------------------|
| `cronjob.schedule`                   | Cronjob expression for registry scan scheduling                                                                        | `"0 6 * * *"`                   |
| `cronjob.failedJobsHistoryLimit`     | Number of failed job history to keep on the cluster                                                                    | `5`                             |
| `cronjob.successfulJobsHistoryLimit` | Number of successful job history to keep on the cluster                                                                | `2`                             |
| `cronjob.restartPolicy`              | Restart policy for a failed registry-scan execution                                                                    | `Never`                         |
| `reportToPersistentVolumeClaim`      | Write the report JSON to the root of the specified persistentVolumeClaim                                               | ` `                             |
| `config.registryURL`                 | URL of the registry to scan                                                                                            | `http://my-docker-registry.com` |
| `config.registryApiUrl`              | API URL of the registry to scan. This is required if your registry type is Artifactory                                 | ` `                             |
| `config.registryUser`                | Username for registry authentication                                                                                   | ` `                             |
| `config.registryPassword`            | Password for registry authentication                                                                                   | ` `                             |
| `config.registryType`                | Registry Type. Optional. dockerv2 (default if not specified), icr                                               | ` `                             |
| `config.registryAccountId`           | AccountID - Only for ICR registry type                                                                                 | ` `                             |
| `config.icrIamApi`                   | IAM API Endpoint - Only for ICR registry type                                                                          | ` `                             |
| `config.icrIamApiSkipTLS`            | Ignore TLS certificate for IAM API - Only for ICR registry type                                                        | `false`                         |
| `config.registrySkipTLS`             | Ignore registry TLS certificate errors (self-signed, etc.)                                                             | `false`                         |
| `config.secureBaseURL`               | Sysdig Secure Base URL                                                                                                 | `https://secure.sysdig.com`     |
| `config.secureAPIToken`              | API Token to access Sysdig Secure                                                                                      | ` `                             |
| `config.secureOnPrem`                | Sysdig Secure is on-prem installation (vs SaaS)                                                                        | `false`                         |
| `config.secureSkipTLS`               | Ignore Sysdig Secure TLS certificate errors                                                                            | `false`                         |
| `config.maxWorkers`                  | Max number of parallel inline scanner workers to spawn in cluster                                                      | `1`                             |
| `config.filter.include`              | List of regular expressions. Images matching any of these expressions are *always* included when scanning.             | `[]`                            |
| `config.filter.exclude`              | List of regular expressions. Images matching any of these expressions are excluded when scanning.                      | `[]`                            |
| `config.filter.maxAgeDays`           | Exclude images with creation date older than specified number of days.                                                 | ` `                             |
| `config.filter.maxTagsPerRepository` | Only scan a maximum number of tags per repository, excluding older images by creation date                             | ` `                             |
| `config.scan.inlineScanImage`        | Override the default (if not specified) `quay.io/sysdig/secure-inline-scan:2` image for the inline scanner job         | ` `                             |
| `config.scan.securityContext`        | Security context for Inline Scanner container                                                                          | `{} `                           |
| `config.scan.newVmScanner`           | true/false whether to activate the beta image scanning (experimental and unsupported)                                  | `false`                         |
| `customLabels`                       | Custom labels to be added to kubernetes manifests of all resources created                                             | `{} `                           |
| `proxy.httpProxy`                    | URL of the proxy for HTTP connections, or empty if not using proxy (sets the http_proxy environment variable)          | ` `                             |
| `proxy.httpsProxy`                   | URL of the proxy for HTTPS connections, or empty if not using proxy (sets the https_proxy environment variable)        | ` `                             |
| `proxy.noProxy`                      | Comma-separated list of domain extensions proxy should not be used for. Include the internal IP of the kubeapi server. | ` `                             |
| `image.registry`                     | Registry Scanner image registry                                                                                        | `quay.io`                       |
| `image.repository`                   | Registry Scanner image repository                                                                                      | `sysdig/registry-scanner`       |
| `image.tag`                          | Registry Scanner image tag. If empty, default to appVersion in Chart.yaml                                              | ``                              |
| `image.pullPolicy`                   | PullPolicy for Registry Scanner image                                                                                  | `Always`                        |
| `serviceAccount.scanner.create`      | Create the service account                                                                                             | `true`                          |
| `serviceAccount.scanner.annotations` | Extra annotations for serviceAccount                                                                                   | `{}`                            |
| `serviceAccount.scanner.name`        | Use this value as serviceAccount Name                                                                                  | ` `                             |
| `imagePullSecrets`                   | The image pull secrets                                                                                                 | `[]`                            |
| `nameOverride`                       | Chart name override                                                                                                    | ` `                             |
| `fullnameOverride`                   | Chart full name override                                                                                               | ` `                             |
| `existingSecretName`                 | Name of a Kubernetes secret containing 'secureAPIToken', 'registryUser', and 'registryPassword' entries                | ` `                             |
| `podAnnotations`                     | Registry scanner pod annotations                                                                                       | `{}`                            |
| `podSecurityContext`                 | Security context for Registry Scanner pod                                                                              | `{}`                            |
| `securityContext`                    | Security context for Registry Scanner container                                                                        | `{}`                            |
| `resources`                          | Resource limits for registry scanner container                                                                         | `{}`                            |
| `nodeSelector`                       | Configure nodeSelector for scheduling                                                                                  | `{}`                            |
| `tolerations`                        | Tolerations for scheduling                                                                                             | `[]`                            |
| `affinity`                           | Configure affinity rules                                                                                               | `{}`                            |



### On-Prem deployment

Use the following command to deploy in an on-prem:

```
$ helm upgrade --install registry-scanner \
    --set config.secureBaseURL=SECURE_URL \
    --set config.secureAPIToken=YOUR-KEY-HERE \
    --set config.secureSkipTLS=true \
    --set config.registryURL=REGISTRY-URL \
    --set config.registryUser=admin \
    --set config.registryPassword=REGISTRY-PASSWORD-HERE \
    sysdig/registry-scanner
```

Use `config.secureSkipTLS=true` if you are using self signed certificates.
