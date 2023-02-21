<!--


DO NOT MODIFY THIS FILE (README.md) MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Registry Scanner

Sysdig Registry Scanner scan your images registry on a Kubernetes Cluster.
<br/>This chart deploys the Sysdig Registry Scanner as a scheduled Cronjob in your Kubernetes cluster.

<br/>

- [Installing the Chart](#installing-the-chart)
- [Uninstalling the Chart](#uninstalling-the-chart)
- [Configuration](#configuration)
- [Supported vendor specific deployments](#supported-vendor-specific-deployments)

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
```

Deploy the registry scanner specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm upgrade --install registry-scanner \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.registryURL=<REGISTRY_URL> \
    --set config.registryUser=admin \
    --set config.registryPassword=<REGISTRY_PASSWORD> \
    sysdig/registry-scanner
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install registry-scanner -f values.yaml sysdig/registry-scanner
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

|              Parameter               |                                                                                                         Description                                                                                                          |                               Default                               |
|--------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| cronjob.schedule                     | Cronjob expression for registry scan scheduling (you can check https://crontab.guru/ for help)                                                                                                                               | <code>"0 6 * * 6"</code>                                            |
| cronjob.failedJobsHistoryLimit       | Number of failed job history to keep on the cluster.                                                                                                                                                                         | <code>5</code>                                                      |
| cronjob.successfulJobsHistoryLimit   | Number of successful job history to keep on the cluster.                                                                                                                                                                     | <code>2</code>                                                      |
| cronjob.restartPolicy                | Restart policy for a failed registry-scan execution.                                                                                                                                                                         | <code>Never</code>                                                  |
| reportToPersistentVolumeClaim        | Specify a volume claim to write the final JSON report there instead of standard output.                                                                                                                                      | <code>""</code>                                                     |
| config.logging                       | log level. use either trace,debug,info,error                                                                                                                                                                                 | <code>"info"</code>                                                 |
| config.registryURL                   | URL of the registry to scan.                                                                                                                                                                                                 | <code>""</code>                                                     |
| config.registryApiUrl                | API URL of the registry to scan. This is required if your registry type is Artifactory.                                                                                                                                      | <code>https://my-docker-registry.com/artifactory/api/docker/</code> |
| config.registryUser                  | Username for registry authentication.                                                                                                                                                                                        | <code>""</code>                                                     |
| config.registryPassword              | Password for registry authentication.                                                                                                                                                                                        | <code>""</code>                                                     |
| config.registryType                  | Registry Type. Optional. dockerv2 (default if not specified), icr, artifactory, ecr.                                                                                                                                         | <code>""</code>                                                     |
| config.registryAccountId             | AccountID - Only for ICR registry type.                                                                                                                                                                                      | <code>""</code>                                                     |
| config.icrIamApi                     | ICR IAM API - Only for ICR registry type.                                                                                                                                                                                    | <code>""</code>                                                     |
| config.icrIamApiSkipTLS              | Ignore TLS certificate for IAM API - Only for ICR registry type.                                                                                                                                                             | <code>false</code>                                                  |
| config.aws.accessKeyId               | AWS Credentials AccessKeyID.                                                                                                                                                                                                 | <code>""</code>                                                     |
| config.aws.secretAccessKey           | AWS Credentials: SecretAccessKey.                                                                                                                                                                                            | <code>""</code>                                                     |
| config.aws.region                    | AWS Region.                                                                                                                                                                                                                  | <code>"us-east-1"</code>                                            |
| config.aws.managementAccountRoleARN  | Management role arn to be used to impersonate over the member accounts                                                                                                                                                       | <code></code>                                                       |
| config.aws.memberAccountsRoleName    | Member account role name (available in all member accounts) to dig into their registries                                                                                                                                     | <code>"OrganizationAccountAccessRole"</code>                        |
| config.aws.allowListMemberAccountIDs | Organization account ids in which to perform the registry scan                                                                                                                                                               | <code>[]</code>                                                     |
| config.registrySkipTLS               | Ignore registry TLS certificate errors (self-signed, etc.).                                                                                                                                                                  | <code>false</code>                                                  |
| config.secureBaseURL                 | **required** <br/> Sysdig Secure Base URL                                                                                                                                                                                    | <code>https://secure.sysdig.com</code>                              |
| config.secureAPIToken                | **required** <br/> API Token to access Sysdig Secure.                                                                                                                                                                        | <code>""</code>                                                     |
| config.secureOnPrem                  | Sysdig Secure is on-prem installation (vs SaaS).                                                                                                                                                                             | <code>false</code>                                                  |
| config.secureSkipTLS                 | Ignore Sysdig Secure TLS certificate errors.                                                                                                                                                                                 | <code>false</code>                                                  |
| config.maxWorkers                    | Max number of parallel inline scanner workers to spawn in cluster.                                                                                                                                                           | <code>1</code>                                                      |
| config.filter.include                | List of regular expressions. Images matching any of these expressions are *always* included when scanning.                                                                                                                   | <code>[]</code>                                                     |
| config.filter.exclude                | List of regular expressions. Images matching any of these expressions are excluded when scanning.                                                                                                                            | <code>[]</code>                                                     |
| config.filter.maxAgeDays             | Exclude images with creation date older than specified number of days.                                                                                                                                                       | <code></code>                                                       |
| config.filter.maxTagsPerRepository   | Only scan a maximum number of tags per repository, excluding older images by creation date.                                                                                                                                  | <code></code>                                                       |
| config.scan.inlineScanImage          | Override the default (if not specified) `quay.io/sysdig/secure-inline-scan:2` image for the inline scanner job.                                                                                                              | <code>""</code>                                                     |
| config.scan.securityContext          | Security context for Inline Scanner container.                                                                                                                                                                               | <code>{}</code>                                                     |
| config.scan.newVmScanner             | true/false whether to activate the beta image scanning (experimental and unsupported)                                                                                                                                        | <code>false</code>                                                  |
| ssl.ca.certs                         | For outbound connections <br/>List of PEM-encoded x509 certificate authority.                                                                                                                                                | <code>{}</code>                                                     |
| customLabels                         | Additional labels to add to CronJob and Scanning Jobs. Custom labels to be added to kubernetes manifests of all resources created.                                                                                           | <code>{}</code>                                                     |
| proxy.httpProxy                      | URL of the proxy for HTTP connections, or empty if not using proxy (sets the http_proxy environment variable).                                                                                                               | <code></code>                                                       |
| proxy.httpsProxy                     | URL of the proxy for HTTPS connections, or empty if not using proxy (sets the https_proxy environment variable).                                                                                                             | <code></code>                                                       |
| proxy.noProxy                        | Comma-separated list of domain extensions proxy should not be used for. Include in noProxy the internal IP of the kubeapi server, and you probably need to add your registry if it is inside the cluster                     | <code></code>                                                       |
| image.registry                       | Sysdig Registry Scanner image registry.                                                                                                                                                                                      | <code>quay.io</code>                                                |
| image.repository                     | Sysdig Registry Scanner image repository                                                                                                                                                                                     | <code>sysdig/registry-scanner</code>                                |
| image.tag                            | Registry Scanner image tag. If empty, default to appVersion in Chart.yaml.                                                                                                                                                   | <code></code>                                                       |
| image.pullPolicy                     | PullPolicy for Registry Scanner image.                                                                                                                                                                                       | <code>Always</code>                                                 |
| serviceAccount.create                | Specifies whether a service account should be created                                                                                                                                                                        | <code>true</code>                                                   |
| serviceAccount.annotations           | Extra annotations to add to the service account                                                                                                                                                                              | <code>{}</code>                                                     |
| serviceAccount.name                  | The name of the service account to use. If not set and create is true, a name is generated using the fullname template                                                                                                       | <code>""</code>                                                     |
| imagePullSecrets                     | The image pull secrets.                                                                                                                                                                                                      | <code>[]</code>                                                     |
| nameOverride                         | Chart name override                                                                                                                                                                                                          | <code>""</code>                                                     |
| fullnameOverride                     | Chart fullname override                                                                                                                                                                                                      | <code>""</code>                                                     |
| existingSecretName                   | Specify the name of a Kubernetes secret containing 'secureAPIToken', 'registryUser', and 'registryPassword' entries or if you are using ecr as registryType, add also 'accessKeyId', 'secretAccessKey' and 'region' entries. | <code>""</code>                                                     |
| podAnnotations                       | Registry scanner pod annotations                                                                                                                                                                                             | <code>{}</code>                                                     |
| podSecurityContext                   | Security context for Registry Scanner pod                                                                                                                                                                                    | <code>{}</code>                                                     |
| securityContext                      | Security context for Registry Scanner container                                                                                                                                                                              | <code>{}</code>                                                     |
| resources                            | Resource limits for registry scanner container.                                                                                                                                                                              | <code>{}</code>                                                     |
| nodeSelector                         | Configure nodeSelector for scheduling the registry scanner pod.                                                                                                                                                              | <code>{}</code>                                                     |
| tolerations                          | Configure tolerations for scheduling the registry scanner pod.                                                                                                                                                               | <code>[]</code>                                                     |
| affinity                             | Configure affinity for scheduling the registry scanner pod.                                                                                                                                                                  | <code>{}</code>                                                     |



### On-Prem deployment

Use the following command to deploy in an on-prem:

```bash
$ helm upgrade --install registry-scanner \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.secureSkipTLS=true \
    --set config.registryURL=<REGISTRY_URL> \
    --set config.registryUser=admin \
    --set config.registryPassword=<REGISTRY_PASSWORD> \
    sysdig/registry-scanner
```

Use `config.secureSkipTLS=true` if you are using self signed certificates.

## Supported vendor specific deployments

### AWS ECR

```bash
$ helm upgrade --install registry-scanner \
    --set config.scan.newVmScanner=true \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.registryType=ecr \
    --set config.aws.accessKeyId=<AWS_ACCESS_KEY_ID> \
    --set config.aws.secretAccessKey=<AWS_SECRET_ACCESS_KEY> \
    --set config.aws.region=<AWS_REGION> \
    --set config.registryURL=<AWS_ECR_URL> \
    sysdig/registry-scanner
```

### AWS ECR Organizational

```bash
$ helm upgrade --install registry-scanner \
    --set config.scan.newVmScanner=true \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.registryType=ecr \
    --set config.aws.accessKeyId=<AWS_ACCESS_KEY_ID> \
    --set config.aws.secretAccessKey=<AWS_SECRET_ACCESS_KEY> \
    --set config.aws.region=<AWS_REGION> \
    --set config.aws.managementAccountRoleARN=<AWS_MANAGEMENT_ACCOUNT_ARN> \
    --set config.aws.memberAccountsRoleName=<AWS_MEMBER_ACCOUNTS_ROLE_NAME> \
    --set config.aws.allowListMemberAccountIDs=<ALLOW_LIST_MEMBER_ACCOUNT_IDS> \
    sysdig/registry-scanner
```

### JFrog Artifactory - OnPrem

- JFROG_ARTIFACTORY_URL: JFrog Artifactory url. ex.: artifactory.internal.mycompany.com

```bash
$ helm upgrade --install registry-scanner \
    --set config.scan.newVmScanner=true \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.registryType=artifactory \
    --set config.registryURL=<JFROG_ARTIFACTORY_REGISTRY_URL> \
    --set config.registryUser=<JFROG_ARTIFACTORY_USER> \
    --set config.registryPassword=<JFROG_ARTIFACTORY_PASSWORD> \
    sysdig/registry-scanner
```

### JFrog Artifactory - SaaS

- JFROG_ARTIFACTORY_REGISTRY_URL: JFrog Artifactory Cloud registry URL. ex.: https://myaccount.jfrog.io/some-registry
- JFROG_ARTIFACTORY_REGISTRY_API_DOCKER_URL: JFrog Artifactory Cloud registry docker API endpoint. ex.: https://myaccount.jfrog.io/artifactory/api/docker/some-registry

```bash
$ helm upgrade --install registry-scanner \
    --set config.scan.newVmScanner=true \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.registryType=artifactory \
    --set config.registryURL=<JFROG_ARTIFACTORY_REGISTRY_URL> \
    --set config.registryApiUrl=<JFROG_ARTIFACTORY_REGISTRY_API_DOCKER_URL> \
    --set config.registryUser=<JFROG_ARTIFACTORY_USER> \
    --set config.registryPassword=<JFROG_ARTIFACTORY_PASSWORD> \
    sysdig/registry-scanner
```

