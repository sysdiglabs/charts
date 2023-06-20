<!--


DO NOT MODIFY THIS FILE (README.md) MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Registry Scanner

Sysdig Registry Scanner scan your images registry on a Kubernetes Cluster .
<br/>This chart deploys the Sysdig Registry Scanner as a scheduled Cronjob in your Kubernetes cluster.

For more insight check Sysdig **Official Docs on Registry-Scanner** [feature](https://docs.sysdig.com/en/vuln-registry-scan) and [installation process guidelines](https://docs.sysdig.com/en/install-registry-scan)

<br/>

- [Installing the Chart](#installing-the-chart)
- [Uninstalling the Chart](#uninstalling-the-chart)
- [Configuration](#configuration)

<br/>

## Introduction

This chart deploys the Sysdig Registry Scanner on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


### Prerequisites

- Helm 3
- Kubernetes v1.16+
- Cluster Name (pick one to identify your Kubernetes Cluster)
- Sysdig Secure API Token

## Installing the Chart

Add Sysdig Helm charts repository:

```bash
$ helm repo add sysdig https://charts.sysdig.com
$ helm repo update
```

Deploy the registry scanner specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm upgrade --install registry-scanner \
    --version=1.0.14 \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.registryURL=<REGISTRY_URL> \
    --set config.registryUser=admin \
    --set config.registryPassword=<REGISTRY_PASSWORD> \
    sysdig/registry-scanner
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install registry-scanner -f values.yaml --version=1.0.14 sysdig/registry-scanner
```


By default the created CronJob, scheduled at the default time: 6:00 am.
For testing purpose you can launch a manual job:

```bash
$ kubectl create job --from=cronjob/registry-scanner registry-scanner-manual
```


## Uninstalling the Chart

To uninstall/delete

```bash
$ helm uninstall registry-scanner
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Sysdig Registry Scanner chart and their default values:

|                    Parameter                     |                                                                                                                 Description                                                                                                                 |                   Default                    |
|--------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------|
| cronjob.schedule                                 | Cronjob expression for registry scan scheduling (you can check https://crontab.guru/ for help)                                                                                                                                              | <code>"0 6 * * 6"</code>                     |
| cronjob.failedJobsHistoryLimit                   | Number of failed job history to keep on the cluster.                                                                                                                                                                                        | <code>5</code>                               |
| cronjob.successfulJobsHistoryLimit               | Number of successful job history to keep on the cluster.                                                                                                                                                                                    | <code>2</code>                               |
| cronjob.restartPolicy                            | Restart policy for a failed registry-scan execution.                                                                                                                                                                                        | <code>Never</code>                           |
| reportToPersistentVolumeClaim                    | Specify a volume claim to write the final JSON report there instead of standard output.                                                                                                                                                     | <code>""</code>                              |
| config.logging                                   | log level. use either trace,debug,info,error                                                                                                                                                                                                | <code>"info"</code>                          |
| config.registryURL                               | URL of the registry to scan.                                                                                                                                                                                                                | <code>""</code>                              |
| config.registryApiUrl                            | API URL of the registry to scan. This is required if your registry type is Artifactory.                                                                                                                                                     | <code>""</code>                              |
| config.registryUser                              | Username for registry authentication.                                                                                                                                                                                                       | <code>""</code>                              |
| config.registryPassword                          | Password for registry authentication.                                                                                                                                                                                                       | <code>""</code>                              |
| config.registryType                              | Mandatory.<br/>Registry Type. Supported types: artifactory, ecr, icr, acr, quay, harbor, and dockerv2.                                                                                                                                      | <code>""</code>                              |
| config.registryAccountId                         | AccountId - Only for ICR registry type.                                                                                                                                                                                                     | <code>""</code>                              |
| config.icrIamApi                                 | ICR IAM API - Only for ICR registry type.                                                                                                                                                                                                   | <code>""</code>                              |
| config.icrIamApiSkipTLS                          | Ignore TLS certificate for IAM API - Only for ICR registry type.                                                                                                                                                                            | <code>false</code>                           |
| config.aws.accessKeyId                           | AWS Credentials AccessKeyId.                                                                                                                                                                                                                | <code>""</code>                              |
| config.aws.secretAccessKey                       | AWS Credentials: SecretAccessKey.                                                                                                                                                                                                           | <code>""</code>                              |
| config.aws.region                                | For single account: region where the registry is located                                                                                                                                                                                    | <code>"us-east-1"</code>                     |
| config.aws.managementAccountRoleARN              | Management role arn to be used to impersonate over the member accounts                                                                                                                                                                      | <code></code>                                |
| config.aws.memberAccountsRoleName                | Member account role name (available in all member accounts) to dig into their registries                                                                                                                                                    | <code>"OrganizationAccountAccessRole"</code> |
| config.aws.allowListMemberAccountIDs             | Organization account ids in which to perform the registry scan. If not configured, the scan will be performed in all the member accounts of the organization.                                                                               | <code>[]</code>                              |
| config.aws.allowListRegions                      | For organizational: regions where the registries are located. If not configured, the scan will be performed in all available regions.                                                                                                       | <code>[]</code>                              |
| config.registrySkipTLS                           | Ignore registry TLS certificate errors (self-signed, etc.).                                                                                                                                                                                 | <code>false</code>                           |
| config.secureBaseURL                             | **required** <br/> Sysdig Secure Base URL                                                                                                                                                                                                   | <code>https://secure.sysdig.com</code>       |
| config.secureAPIToken                            | **required** <br/> API Token to access Sysdig Secure.                                                                                                                                                                                       | <code>""</code>                              |
| config.secureOnPrem                              | Sysdig Secure is on-prem installation (vs SaaS).                                                                                                                                                                                            | <code>false</code>                           |
| config.secureSkipTLS                             | Ignore Sysdig Secure TLS certificate errors.                                                                                                                                                                                                | <code>false</code>                           |
| config.maxWorkers                                | Max number of parallel job scan workers to spawn                                                                                                                                                                                            | <code>5</code>                               |
| config.filter.include                            | List of regular expressions.<br/>Images matching any of these expressions are *always* included when scanning.                                                                                                                              | <code>[]</code>                              |
| config.filter.exclude                            | List of regular expressions.<br/>Images matching any of these expressions are excluded when scanning.                                                                                                                                       | <code>[]</code>                              |
| config.filter.maxAgeDays                         | Based on its creation date, excludes images older than specified number of days.<br/>Maximum 365                                                                                                                                            | <code>90</code>                              |
| config.filter.maxTagsPerRepository               | Based on its creation date, newer ones take precedence, maximum number of tags to scan per repository.<br/>Maximum 50                                                                                                                       | <code>5</code>                               |
| config.filter.maxRepositoriesPerRegistry         | Number of repositories to scan per registry.<br/>Maximum Value 10000                                                                                                                                                                        | <code>500</code>                             |
| config.scan.inlineScanImage                      | Override the default image for the inline scanner job.                                                                                                                                                                                      | <code>""</code>                              |
| config.scan.securityContext                      | Security context for Inline Scanner container.                                                                                                                                                                                              | <code>{}</code>                              |
| config.scan.orchestrator.ttlSecondsAfterFinished | ttl for orchestrator job. unset with empty value                                                                                                                                                                                            | <code>3600</code>                            |
| config.scan.jobs.ttlSecondsAfterFinished         | ttl for scanner worker jobs                                                                                                                                                                                                                 | <code>600</code>                             |
| config.scan.jobs.resources.requests.memory       | Resource request memory for scanner job                                                                                                                                                                                                     | <code>500Mi</code>                           |
| config.scan.jobs.resources.requests.cpu          | Resource request CPU for scanner job                                                                                                                                                                                                        | <code>500m</code>                            |
| config.scan.jobs.resources.limits.memory         | Resource limit memory for scanner job                                                                                                                                                                                                       | <code>2Gi</code>                             |
| config.scan.jobs.temporaryVolumeSizeLimit        | Size limit for the emptyDir volume used by the scanner job.<br/> This volume is used to store both the vulnerability database and the image to scan.                                                                                        | <code>2Gi</code>                             |
| ssl.ca.certs                                     | For outbound connections <br/>List of PEM-encoded x509 certificate authority.                                                                                                                                                               | <code>[]</code>                              |
| customLabels                                     | Additional labels to add to CronJob and Scanning Jobs. Custom labels to be added to kubernetes manifests of all resources created.                                                                                                          | <code>{}</code>                              |
| proxy.httpProxy                                  | URL of the proxy for HTTP connections, or empty if not using proxy (sets the http_proxy environment variable).                                                                                                                              | <code></code>                                |
| proxy.httpsProxy                                 | URL of the proxy for HTTPS connections, or empty if not using proxy (sets the https_proxy environment variable).                                                                                                                            | <code></code>                                |
| proxy.noProxy                                    | Comma-separated list of domain extensions proxy should not be used for. Include in noProxy the internal IP of the kubeapi server, and you probably need to add your registry if it is inside the cluster                                    | <code></code>                                |
| image.registry                                   | Sysdig Registry Scanner image registry.                                                                                                                                                                                                     | <code>quay.io</code>                         |
| image.repository                                 | Sysdig Registry Scanner image repository                                                                                                                                                                                                    | <code>sysdig/registry-scanner</code>         |
| image.tag                                        | Registry Scanner image tag. If empty, default to appVersion in Chart.yaml.                                                                                                                                                                  | <code></code>                                |
| image.pullPolicy                                 | PullPolicy for Registry Scanner image.                                                                                                                                                                                                      | <code>Always</code>                          |
| serviceAccount.create                            | Specifies whether a service account should be created                                                                                                                                                                                       | <code>true</code>                            |
| serviceAccount.annotations                       | Extra annotations to add to the service account                                                                                                                                                                                             | <code>{}</code>                              |
| serviceAccount.name                              | The name of the service account to use. If not set and create is true, a name is generated using the fullname template                                                                                                                      | <code>""</code>                              |
| imagePullSecrets                                 | The image pull secrets.                                                                                                                                                                                                                     | <code>[]</code>                              |
| nameOverride                                     | Chart name override                                                                                                                                                                                                                         | <code>""</code>                              |
| fullnameOverride                                 | Chart fullname override                                                                                                                                                                                                                     | <code>""</code>                              |
| existingSecretName                               | Specify the name of a Kubernetes secret containing 'secureAPIToken', 'registryUser', and 'registryPassword' entries or if you are using ecr as registryType, add also 'accessKeyId', 'secretAccessKey' and 'region' entries.                | <code>""</code>                              |
| podAnnotations                                   | Registry scanner pod annotations                                                                                                                                                                                                            | <code>{}</code>                              |
| podSecurityContext                               | Security context for Registry Scanner pod                                                                                                                                                                                                   | <code>{}</code>                              |
| securityContext                                  | Security context for Registry Scanner container                                                                                                                                                                                             | <code>{}</code>                              |
| resources                                        | Resource limits for main registry scanner orchestrator.<br/>For scanner job resources use `config.scan.jobs.resources`                                                                                                                      | <code>{}</code>                              |
| nodeSelector                                     | Configure nodeSelector for scheduling the registry scanner pod.                                                                                                                                                                             | <code>{}</code>                              |
| tolerations                                      | Configure tolerations for scheduling the registry scanner pod.                                                                                                                                                                              | <code>[]</code>                              |
| affinity                                         | Configure affinity for scheduling the registry scanner pod.                                                                                                                                                                                 | <code>{}</code>                              |
| scanOnStart.enabled                              | true/false on whether to start the post-install scanner job, in addition to the cronjob. <br/>beware that concurrencyPolicy does not work on jobs (only cronjobs). <br/>always check if there is any scanning running and if so, remove it. | <code>false</code>                           |
| scanOnStart.jobName                              | Name of the job created for the post-install scanner job                                                                                                                                                                                    | <code>"registry-scanner-start-test"</code>   |
| scanOnStart.asPostInstallHook                    | true/false on whether to launch the job as a post-install helm hook. <br/>mainly for testing purpose                                                                                                                                        | <code>false</code>                           |
| extraEnvVars                                     | Extra environment variables to be set                                                                                                                                                                                                       | <code>[]</code>                              |



## Other Options

### I still want to use legacy scanning engine

Chart version `1.*` relies on new Vulnerability Management scanning engine.
<br/>If you still use the legacy scanning engine and want to keep running that version, pin the Helm chart version with  `--version=0.1.39`

### On-Prem deployment

Use the following command to deploy in an on-prem:

```bash
$ helm upgrade --install registry-scanner \
    --version=1.0.14 \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.secureSkipTLS=true \
    --set config.registryURL=<REGISTRY_URL> \
    --set config.registryUser=admin \
    --set config.registryPassword=<REGISTRY_PASSWORD> \
    sysdig/registry-scanner
```

Use `config.secureSkipTLS=true` if you are using self signed certificates.
