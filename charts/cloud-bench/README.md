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

## Configuration

The following table lists the configurable parameters of the Sysdig Cloud Bench
chart and their default values:

| Parameter                    | Description                                                                                                     | Default                                                                                      |
|------------------------------|-----------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| `affinity`                   | Configure affinity rules                                                                                        | `{}`                                                                                         |
| `aws.access_key_id`          | AWS Credentials AccessKeyID                                                                                     | ` `                                                                                          |
| `aws.region`                 | AWS Region                                                                                                      | ` `                                                                                          |
| `aws.secret_access_key`      | AWS Credentials: SecretAccessKey                                                                                | ` `                                                                                          |
| `bechmarkType`               | Benchmark Type                                                                                                  | `aws`                                                                                        |
| `existingSecretName`         | Provide an existing secret name (see details in values.yaml) instead of creating a new one from provided values | ` `                                                                                          |
| `fullnameOverride`           | Chart full name override                                                                                        | ` `                                                                                          |
| `image.pullPolicy`           | The image pull policy                                                                                           | `IfNotPresent`                                                                               |
| `imagePullSecrets`           | The image pull secrets                                                                                          | `[]`                                                                                         |
| `image.repository`           | The image repository to pull from                                                                               | `sysdiglabs/cloud-bench`                                                                     |
| `image.tag`                  | The image tag                                                                                                   | `latest`                                                                                     |
| `logLevel`                   | Log Level                                                                                                       | `debug`                                                                                      |
| `nameOverride`               | Chart name override                                                                                             | ` `                                                                                          |
| `outputDir`                  | Output dir                                                                                                      | `/tmp/cloud-custodian`                                                                       |
| `podAnnotations`             | Dictionary of additional pod annotations                                                                        | `{prometheus.io/scrape: "true", prometheus.io/path: "/metrics", prometheus.io/port: "7000"}` |
| `podSecurityContext`         | Configure deployment PSP's                                                                                      | `{}`                                                                                         |
| `policyFile`                 | Policy fil                                                                                                      | `/home/custodian/aws-benchmarks.yml`                                                         |
| `replicaCount`               | Amount of replicas for Cloud Bench                                                                              | `1`                                                                                          |
| `schedule`                   | Schedule                                                                                                        | `24h`                                                                                        |
| `secureURL`                  | Sysdig Secure URL                                                                                               | `https://secure.sysdig.com`                                                                  |
| `securityContext`            | Configure securityContext                                                                                       | `{}`                                                                                         |
| `serviceAccount.annotations` | Extra annotations for serviceAccount                                                                            | `{}`                                                                                         |
| `serviceAccount.create`      | Create the service account                                                                                      | `true`                                                                                       |
| `serviceAccount.name`        | Use this value as serviceAccount Name                                                                           | ` `                                                                                          |
| `service.port`               | Configure port for the service                                                                                  | `80`                                                                                         |
| `service.type`               | Use this type as service                                                                                        | `ClusterIP`                                                                                  |
| `sysdig.secureApiToken`      | API Token to access Sysdig Secure                                                                               | ` `                                                                                          |
| `tolerations`                | Tolerations for scheduling                                                                                      | `[]`                                                                                         |


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
