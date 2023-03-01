<!--


DO NOT MODIFY THIS FILE (README.md) MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Registry Scanner

{{ .Project.Name }} scan your images registry on a Kubernetes Cluster.
<br/>{{ .Project.Description }}

<br/>

- [Installing the Chart](#installing-the-chart)
- [Uninstalling the Chart](#uninstalling-the-chart)
- [Configuration](#configuration)
- [Supported vendor specific deployments](#supported-vendor-specific-deployments)

<br/>

## Introduction

This chart deploys {{ .Project.App }} on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


### Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}

## Installing the Chart

Add Sysdig Helm charts repository:

```bash
$ helm repo add {{ .Repository.Name }} {{ .Repository.URL }}
```

Deploy the registry scanner specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm upgrade --install {{ .Chart.Name }} \
    --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
    --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
    --set config.registryURL=<REGISTRY_URL> \
    --set config.registryUser=admin \
    --set config.registryPassword=<REGISTRY_PASSWORD> \
    sysdig/{{ .Chart.Name }}
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install {{ .Chart.Name }} -f values.yaml sysdig/{{ .Chart.Name }}
```


By default the created CronJob, scheduled at the default time: 6:00 am.
For testing purpose you can launch a manual job:

```bash
$ kubectl create job --from=cronjob/{{ .Chart.Name }} registry-scanner-manual
```


## Uninstalling the Chart

To uninstall/delete

```bash
$ helm uninstall {{ .Chart.Name }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

{{ if .Chart.Values -}}

## Configuration

The following table lists the configurable parameters of the Sysdig Registry Scanner chart and their default values:

{{ .Chart.Values }}

{{- end }}


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
