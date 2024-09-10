<!--


DO NOT MODIFY THIS FILE (README.md) MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Chart: Registry Scanner

## Overview

Sysdig Registry Scanner scans your images registry on a Kubernetes cluster .
This chart deploys the Sysdig Registry Scanner as a scheduled Cronjob in your Kubernetes cluster and allows you to integrate Sysdig Secure with different image registries.

Registry scanning provides an extra layer of defense between pipeline and runtime by checking:

- Newly discovered vulnerabilities in the software before being deployed.
- Third-party software that might  have been installed without going through pipeline scanning.


Follow the instructions in [Install Registry Scanner](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-registry-scanner/#installation) to deploy the Helm chart.  They include specific use cases for:

- JFrog Artifactory
- AWS ECR
- Harbor
- Quay IO
- IBM ICR
- Azure ACR
- Google GAR
- Google GCR
- OpenShift Internal Registry

Once installed, you can view the scan results in the [Vulnerabilities UI](https://docs.sysdig.com/en/docs/sysdig-secure/vulnerabilities/registry/) of Sysdig Secure.


### Prerequisites

- Helm 3.6
- Kubernetes v1.16+
- Unique name to identify your Kubernetes cluster
- Sysdig Secure API Token

## Configuration Parameters

The following table lists the configurable parameters of the Sysdig Registry Scanner chart and their default values:

|                    Parameter                     |                                                                                                                Description                                                                                                                 |                   Default                    |
|--------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------|
| cronjob.schedule                                 | The cronjob expression for registry scan scheduling. See https://crontab.guru/ for help.                                                                                                                                                   | <code>"0 6 * * 6"</code>                     |
| cronjob.failedJobsHistoryLimit                   | The number of failed job history to keep on the cluster.                                                                                                                                                                                   | <code>5</code>                               |
| cronjob.successfulJobsHistoryLimit               | The number of successful job history to keep on the cluster.                                                                                                                                                                               | <code>2</code>                               |
| cronjob.restartPolicy                            | The restart policy for a failed registry scan execution.                                                                                                                                                                                   | <code>Never</code>                           |
| cronjob.timeZone                                 | Timezone settings for the cronjob. Value default will be null to guarantee we only set the timezone if the user provides it.                                                                                                               | <code>""</code>                              |
| reportToPersistentVolumeClaim                    | Specify a volume claim to write the final JSON report there instead of standard output.                                                                                                                                                    | <code>""</code>                              |
| config.logging                                   | The log level. Use one of the following: trace, debug, info, error.                                                                                                                                                                        | <code>"info"</code>                          |
| config.registryURL                               | The URL of the registry to scan.                                                                                                                                                                                                           | <code>""</code>                              |
| config.registryApiUrl                            | The API URL of the registry to scan. This is required if your registry type is Artifactory.                                                                                                                                                | <code>""</code>                              |
| config.registryUser                              | The username for registry authentication.                                                                                                                                                                                                  | <code>""</code>                              |
| config.registryPassword                          | The password for registry authentication.                                                                                                                                                                                                  | <code>""</code>                              |
| config.registryType                              | Mandatory.<br/>The registry Type. Supported types: artifactory, ecr, icr, acr, quay, harbor, gar, gcr, nexus, ocp and dockerv2.                                                                                                            | <code>""</code>                              |
| config.registryAccountId                         | The account ID. Applicable only for ICR registry type.                                                                                                                                                                                     | <code>""</code>                              |
| config.icrIamApi                                 | The ICR IAM API. Applicable only for ICR registry type.                                                                                                                                                                                    | <code>""</code>                              |
| config.icrIamApiSkipTLS                          | Ignore TLS certificate for IAM API. Applicable only for ICR registry type.                                                                                                                                                                 | <code>false</code>                           |
| config.aws.accessKeyId                           | The AWS credentials: `AccessKeyId`.                                                                                                                                                                                                        | <code>""</code>                              |
| config.aws.secretAccessKey                       | The AWS credentials: `SecretAccessKey`.                                                                                                                                                                                                    | <code>""</code>                              |
| config.aws.region                                | For single account. It is the region where the registry is located.                                                                                                                                                                        | <code>"us-east-1"</code>                     |
| config.aws.managementAccountRoleARN              | The management role ARN to be used to impersonate the member accounts.                                                                                                                                                                     | <code></code>                                |
| config.aws.memberAccountsRoleName                | The member account role name (available in all member accounts) to dig into their registries.                                                                                                                                              | <code>"OrganizationAccountAccessRole"</code> |
| config.aws.allowListMemberAccountIDs             | The organization account IDs in which the registry scan is performed. If not configured, the scan will be performed in all the member accounts of the organization.                                                                        | <code>[]</code>                              |
| config.aws.allowListRegions                      | For organizational accounts. It is the AWS regions where the registries are located. If not configured, the scan will be performed in all available regions.                                                                               | <code>[]</code>                              |
| config.registrySkipTLS                           | Ignore registry TLS certificate errors (self-signed, etc.).                                                                                                                                                                                | <code>false</code>                           |
| config.registryMaxRetries                        | Max number of retries to call the registtry APIs in case of failure or 409.                                                                                                                                                                | <code>10</code>                              |
| config.registryMaxRetryWait                      | Max wait time between retries.                                                                                                                                                                                                             | <code>10m</code>                             |
| config.registryMinRetryWait                      | Min wait time between retries.                                                                                                                                                                                                             | <code>5s</code>                              |
| config.secureBaseURL                             | **required** <br/> The Sysdig Secure Base URL.                                                                                                                                                                                             | <code>https://secure.sysdig.com</code>       |
| config.secureAPIToken                            | **required** <br/> The API Token to access Sysdig Secure.                                                                                                                                                                                  | <code>""</code>                              |
| config.secureOnPrem                              | Specify that Sysdig Secure installation is on-prem.                                                                                                                                                                                        | <code>false</code>                           |
| config.secureSkipTLS                             | Ignore Sysdig Secure TLS certificate errors.                                                                                                                                                                                               | <code>false</code>                           |
| config.maxWorkers                                | The maximum number of parallel job scan workers to spawn.                                                                                                                                                                                  | <code>5</code>                               |
| config.filter.include                            | The list of regular expressions.<br/>Images matching any of these expressions are *always* included when scanning.                                                                                                                         | <code>[]</code>                              |
| config.filter.exclude                            | The list of regular expressions.<br/>Images matching any of these expressions are excluded when scanning.                                                                                                                                  | <code>[]</code>                              |
| config.filter.maxAgeDays                         | Based on its creation date, excludes images older than the specified number of days.<br/>The maximum is 365 days.                                                                                                                          | <code>90</code>                              |
| config.filter.maxTagsPerRepository               | Based on its creation date, newer ones take precedence, the maximum number of tags to scan per repository.<br/>The maximum is 50.                                                                                                          | <code>5</code>                               |
| config.filter.maxRepositoriesPerRegistry         | The number of repositories to scan per registry.<br/>The maximum is 10000.                                                                                                                                                                 | <code>500</code>                             |
| config.scan.inlineScanImage                      | Override the default image for the inline scanner job.                                                                                                                                                                                     | <code>""</code>                              |
| config.scan.securityContext                      | The security context for the Inline Scanner container.                                                                                                                                                                                     | <code>{}</code>                              |
| config.scan.orchestrator.ttlSecondsAfterFinished | The Time to Live (ttl) value for the orchestrator job. Provide an empty value to accept the default.                                                                                                                                       | <code>3600</code>                            |
| config.scan.jobs.ttlSecondsAfterFinished         | The ttl value for scanner worker jobs.                                                                                                                                                                                                     | <code>600</code>                             |
| config.scan.jobs.resources.requests.memory       | The memory request for the scanner job.                                                                                                                                                                                                    | <code>500Mi</code>                           |
| config.scan.jobs.resources.requests.cpu          | The CPU request for the scanner job.                                                                                                                                                                                                       | <code>500m</code>                            |
| config.scan.jobs.resources.limits.memory         | The memory limit for the scanner job.                                                                                                                                                                                                      | <code>2Gi</code>                             |
| config.scan.jobs.temporaryVolumeSizeLimit        | The size limit for the emptyDir volume used by the scanner job.<br/> This volume is used to store both the vulnerability database and the image to scan.                                                                                   | <code>2Gi</code>                             |
| config.scan.jobs.nodeSelector                    | NodeSelector for child jobs. If only .Values.nodeSelector is specified, child jobs will inherit the same nodeSelector as the main pod                                                                                                      | <code>{}</code>                              |
| config.scan.disablePlatformScanning              | Force the scan to happen on the client component rather than relying on backend scanning                                                                                                                                                   | <code>false</code>                           |
| config.parallelGoRoutines                        | Number of goroutines running in parallel in metadata phase for ECR Org setup.                                                                                                                                                              | <code>100</code>                             |
| ssl.ca.certs                                     | For outbound connections. <br/>List of PEM-encoded x509 certificate authority.                                                                                                                                                             | <code>[]</code>                              |
| customLabels                                     | The additional labels to add to CronJob and Scanning Jobs. The custom labels to be added to kubernetes manifests of all the resources created.                                                                                             | <code>{}</code>                              |
| proxy.httpProxy                                  | The URL of the proxy for HTTP connections. Leave it empty if not using proxy, which sets the `http_proxy` environment variable.                                                                                                            | <code></code>                                |
| proxy.httpsProxy                                 | The URL of the proxy for HTTPS connections. Leave it empty if not using proxy, which sets the `https_proxy` environment variable.                                                                                                          | <code></code>                                |
| proxy.noProxy                                    | The comma-separated list of domain extensions proxy should not be used for. Include the internal IP of the Kube API server in noProxy configuration. You probably need to add your registry if it is inside the cluster.                   | <code></code>                                |
| image.registry                                   | The Sysdig Registry Scanner image registry.                                                                                                                                                                                                | <code>quay.io</code>                         |
| image.repository                                 | The Sysdig Registry Scanner image repository.                                                                                                                                                                                              | <code>sysdig/registry-scanner</code>         |
| image.tag                                        | The Registry Scanner image tag. If empty, default to appVersion in `Chart.yaml`.                                                                                                                                                           | <code></code>                                |
| image.pullPolicy                                 | The PullPolicy for Registry Scanner image.                                                                                                                                                                                                 | <code>Always</code>                          |
| serviceAccount.create                            | Specifies whether a service account should be created.                                                                                                                                                                                     | <code>true</code>                            |
| serviceAccount.annotations                       | The additional annotations to add to the service account.                                                                                                                                                                                  | <code>{}</code>                              |
| serviceAccount.name                              | The name of the service account to use. If the value is not set and create is set to `true`, a name is generated using the fullname template.                                                                                              | <code>""</code>                              |
| imagePullSecrets                                 | The image pull secrets.                                                                                                                                                                                                                    | <code>[]</code>                              |
| nameOverride                                     | The chart name override                                                                                                                                                                                                                    | <code>""</code>                              |
| fullnameOverride                                 | The chart fullname override                                                                                                                                                                                                                | <code>""</code>                              |
| existingSecretName                               | Specify the name of a Kubernetes secret containing 'secureAPIToken', 'registryUser', and 'registryPassword' entries. If you are using `ecr` as `registryType`, ensure that you add 'accessKeyId', 'secretAccessKey', and 'region' entries. | <code>""</code>                              |
| podAnnotations                                   | Pod annotations for the Registry scanner.                                                                                                                                                                                                  | <code>{}</code>                              |
| securityContext                                  | Security context for Registry Scanner container.                                                                                                                                                                                           | <code>{}</code>                              |
| resources                                        | Resource limits for the main registry scanner orchestrator.<br/>For scanner job resources, use `config.scan.jobs.resources`.                                                                                                               | <code>{}</code>                              |
| scanOnStart.enabled                              | Specify whether to start the post-install scanner job, in addition to the cronjob. <br/>Beware that `concurrencyPolicy` does not work on jobs (only cronjobs). <br/>Always check for active scanning and if so, remove it.                 | <code>false</code>                           |
| scanOnStart.jobName                              | The name of the job created for the post-install scanner job                                                                                                                                                                               | <code>"registry-scanner-start-test"</code>   |
| scanOnStart.asPostInstallHook                    | Specify whether to launch the job as a post-install helm hook. <br/>Used for testing purpose.                                                                                                                                              | <code>false</code>                           |
| extraEnvVars                                     | The additional environment variables to be set.                                                                                                                                                                                            | <code>[]</code>                              |
| memProfileToPersistentVolumeClaim                | Write memory profile dumps to Persistent Volume Claim (provide PVC name)                                                                                                                                                                   | <code>""</code>                              |

## On-Prem Deployment

If you are using a Sysdig on-prem version greater than 6.2, you need to configure legacy VM engine while setting up registry scanner.

Use the following command to deploy:

```
helm upgrade --install registry-scanner \
   --namespace sysdig-agent \
   --create-namespace \
   --version=1.4.0 \
   --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
   --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
   --set config.secureSkipTLS=true \
   --set config.registryURL=<REGISTRY_URL> \
   --set config.registryUser=admin \
   --set config.registryPassword=<REGISTRY_PASSWORD> \
  sysdig/registry-scanner
```

Use `config.secureSkipTLS=true` if you are using self-signed certificates.
