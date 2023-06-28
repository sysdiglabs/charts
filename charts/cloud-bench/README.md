# Cloud Bench

This chart deploys the Sysdig Cloud Bench on your Kubernetes cluster.

>  ⚠️ **Deprecated Module**<br/>
> This agent-based version of cloud-bench has been deprecated in favour of an agentless implementation.
> See for more instructions for its installation at [Sysdig Secure for cloud - CSPM/Compliance with CIS AWS Benchmarks](https://docs.sysdig.com/en/docs/installation/sysdig-secure-for-cloud/#cspmcompliance-with-cis-aws-benchmarks)

## Installing the Chart

Add Sysdig Helm charts repository and deploy the chart:

```
$ helm repo add sysdig https://charts.sysdig.com

$ helm install --create-namespace -n cloud-bench cloud-bench -f values.yaml sysdig/cloud-bench
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

The following table lists the configurable parameters of the Sysdig Cloud Bench
chart and their default values:

| Parameter                    | Description                                                                                                     | Default                                                                                      |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `replicaCount`               | Amount of replicas for Cloud Bench                                                                              | `1`                                                                                          |
| `image.repository`           | The image repository to pull from                                                                               | `sysdiglabs/cloud-bench`                                                                     |
| `image.pullPolicy`           | The image pull policy                                                                                           | `IfNotPresent`                                                                               |
| `image.tag`                  | The image tag                                                                                                   | `latest`                                                                                     |
| `imagePullSecrets`           | The image pull secrets                                                                                          | `[]`                                                                                         |
| `nameOverride`               | Chart name override                                                                                             | ` `                                                                                          |
| `fullnameOverride`           | Chart full name override                                                                                        | ` `                                                                                          |
| `serviceAccount.create`      | Create the service account                                                                                      | `true`                                                                                       |
| `serviceAccount.annotations` | Extra annotations for serviceAccount                                                                            | `{}`                                                                                         |
| `serviceAccount.name`        | Use this value as serviceAccount Name                                                                           | ` `                                                                                          |
| `podAnnotations`             | Dictionary of additional pod annotations                                                                        | `{prometheus.io/scrape: "true", prometheus.io/path: "/metrics", prometheus.io/port: "7000"}` |
| `podSecurityContext`         | Configure deployment PSP's                                                                                      | `{}`                                                                                         |
| `securityContext`            | Configure securityContext                                                                                       | `{}`                                                                                         |
| `service.type`               | Use this type as service                                                                                        | `ClusterIP`                                                                                  |
| `service.port`               | Configure port for the service                                                                                  | `80`                                                                                         |
| `tolerations`                | Tolerations for scheduling                                                                                      | `[]`                                                                                         |
| `affinity`                   | Configure affinity rules                                                                                        | `{}`                                                                                         |
| `aws.access_key_id`          | AWS Credentials AccessKeyID                                                                                     | ` `                                                                                          |
| `aws.secret_access_key`      | AWS Credentials: SecretAccessKey                                                                                | ` `                                                                                          |
| `aws.region`                 | AWS Region                                                                                                      | ` `                                                                                          |
| `sysdig.secureApiToken`      | API Token to access Sysdig Secure                                                                               | ` `                                                                                          |
| `existingSecretName`         | Provide an existing secret name (see details in values.yaml) instead of creating a new one from provided values | ` `                                                                                          |
| `secureURL`                  | Sysdig Secure URL                                                                                               | `https://secure.sysdig.com`                                                                  |
| `logLevel`                   | Log Level                                                                                                       | `debug`                                                                                      |
| `schedule`                   | Schedule                                                                                                        | `24h`                                                                                        |
| `bechmarkType`               | Benchmark Type                                                                                                  | `aws`                                                                                        |
| `outputDir`                  | Output dir                                                                                                      | `/tmp/cloud-custodian`                                                                       |
| `policyFile`                 | Policy fil                                                                                                      | `/home/custodian/aws-benchmarks.yml`                                                         |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
    --set sysdig.secureApiToken=YOUR-KEY-HERE \
    sysdig/cloud-bench
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml sysdig/cloud-bench
```
