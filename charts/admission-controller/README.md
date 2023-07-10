<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Admission Controller

[Sysdig Admission Controller](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/admission-controller/) features ActivityAudit and ImageScanning on a Kubernetes Cluster.
<br/>This chart deploys the Sysdig Admission Controller in your Kubernetes cluster.

## TL;DR;

```
$ helm repo add sysdig https://charts.sysdig.com
$ helm repo update
$ helm upgrade --install sysdig-admission-controller sysdig/admission-controller \
      --create-namespace -n sysdig-admission-controller --version=0.11.2  \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```

- [Configuration](#configuration)
- [Usages](#usages)
- [Confirm Working Status](#confirm-working-status)
- [Troubleshooting](#troubleshooting)

<br/><br/>

## Introduction

This chart deploys the Sysdig Admission Controller on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.



### Prerequisites

- Helm 3
- Kubernetes v1.16+
- Cluster Name (pick one to identify your Kubernetes Cluster)
- Sysdig Secure API Token



###  Installing the Chart

To install the chart with the release name `admission-controller`:

```console
$ helm upgrade --install sysdig-admission-controller sysdig/admission-controller -n sysdig-admission-controller --version=0.11.2
```

The command deploys the Sysdig Admission Controller on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`



### Uninstalling the Chart

To uninstall/delete the `admission-controller`:

```console
$ helm uninstall sysdig-admission-controller -n sysdig-admission-controller
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `admission-controller` chart and their default values.

|                     Parameter                      |                                                                                                                                                                                                                             Description                                                                                                                                                                                                                             |                                                                                              Default                                                                                               |
|----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| global.clusterConfig                               | Global cluster config options.                                                                                                                                                                                                                                                                                                                                                                                                                                      | <code>{}</code>                                                                                                                                                                                    |
| global.sysdig.secureAPIToken                       | Global API token to access Sysdig Secure.                                                                                                                                                                                                                                                                                                                                                                                                                           | <code>""</code>                                                                                                                                                                                    |
| global.sysdig.secureAPITokenSecret                 | Global secret with API Token to access Sysdig Secure.                                                                                                                                                                                                                                                                                                                                                                                                               | <code>""</code>                                                                                                                                                                                    |
| global.sysdig.region                               | Global Sysdig Secure region                                                                                                                                                                                                                                                                                                                                                                                                                                         | <code>"us1"</code>                                                                                                                                                                                 |
| global.proxy                                       | Global HTTP Proxy settings.                                                                                                                                                                                                                                                                                                                                                                                                                                         | <code>{}</code>                                                                                                                                                                                    |
| global.image.pullSecrets                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | <code>[]</code>                                                                                                                                                                                    |
| global.image.pullPolicy                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | <code>IfNotPresent</code>                                                                                                                                                                          |
| clusterName                                        | **required** <br/> Cluster Name which appear on Secure UI                                                                                                                                                                                                                                                                                                                                                                                                           | <code>""</code>                                                                                                                                                                                    |
| namespace                                          | Namespace to install components (Optional, will default to release namespace). <br/><br/> IMPORTANT: If a namespace is specified this way it must already exist otherwise installation will fail.                                                                                                                                                                                                                                                                   | <code>""</code>                                                                                                                                                                                    |
| sysdig.secureAPIToken                              | **required** <br/> API Token to access Sysdig Secure. <br/><br/>If neither this value nor `sysdig.existingSecureAPITokenSecret` are configured, the user will be required to provide the deployment the `SECURE_API_TOKEN` (and `AUTH_BEARER_TOKEN` if the scanner is enabled) environment variables. Overrides `global.sysdig.secureAPIToken`                                                                                                                      | <code>""</code>                                                                                                                                                                                    |
| sysdig.existingSecureAPITokenSecret                | **required** <br/>Existing secret with API Token to access Sysdig Secure <br/>Alternatively, specify the name of a Kubernetes secret containing `SECURE_API_TOKEN` and `AUTH_BEARER_TOKEN` entry if you're also enabling scanner. <br/><br/>If neither this value nor `sysdig.secureAPIToken` are configured, the user will be required to provide the deployment the `SECURE_API_TOKEN` (and `AUTH_BEARER_TOKEN` if the scanner is enabled) environment variables. | <code>""</code>                                                                                                                                                                                    |
| sysdig.apiEndpoint                                 | Sysdig URL.<br/> - Default secure.sysdig.com is for the us-east region.<br/> - For us-west use us2.app.sysdig.com<br/> - For European Union, use eu1.app.sysdig.com<br/> - For APAC, use app.au1.sysdig.com<br/> - For US4 (our west Google cloud region) use app.us4.sysdig.com<br/> - For on-prem, your own enpoints<br/>                                                                                                                                         | <code>""</code>                                                                                                                                                                                    |
| features.k8sAuditDetections                        | Enable K8s Audit detections with Falco rules                                                                                                                                                                                                                                                                                                                                                                                                                        | <code>true</code>                                                                                                                                                                                  |
| features.k8sAuditDetectionsRules                   | [Admission Webhook Configuration rules](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#matching-requests-rules) for the Audit Detections                                                                                                                                                                                                                                                                                 | <code>[{"apiGroups":["","apps","autoscaling","batch","networking.k8s.io","rbac.authorization.k8s.io","extensions"],"apiVersions":["*"],"operations":["*"],"resources":["*/*"],"scope":"*"}]</code> |
| verifySSL                                          | For outbound connections (secure backend, proxy,...) <br/>Whether to verify SSL on HTTPS connections                                                                                                                                                                                                                                                                                                                                                                | <code>true</code>                                                                                                                                                                                  |
| nameOverride                                       | Chart name override                                                                                                                                                                                                                                                                                                                                                                                                                                                 | <code>""</code>                                                                                                                                                                                    |
| fullnameOverride                                   | Chart full name override                                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>""</code>                                                                                                                                                                                    |
| labels                                             | Additional labels, applies to both scanner and webhook                                                                                                                                                                                                                                                                                                                                                                                                              | <code>{}</code>                                                                                                                                                                                    |
| serviceAccounts.webhook.create                     | Create the service account                                                                                                                                                                                                                                                                                                                                                                                                                                          | <code>true</code>                                                                                                                                                                                  |
| serviceAccounts.webhook.annotations                | Extra annotations for serviceAccount                                                                                                                                                                                                                                                                                                                                                                                                                                | <code>{}</code>                                                                                                                                                                                    |
| serviceAccounts.webhook.name                       | Use this value as serviceAccount Name                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>""</code>                                                                                                                                                                                    |
| serviceAccounts.scanner.create                     | Create the service account                                                                                                                                                                                                                                                                                                                                                                                                                                          | <code>true</code>                                                                                                                                                                                  |
| serviceAccounts.scanner.annotations                | Extra annotations for serviceAccount                                                                                                                                                                                                                                                                                                                                                                                                                                | <code>{}</code>                                                                                                                                                                                    |
| serviceAccounts.scanner.name                       | Use this value as serviceAccount Name                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>""</code>                                                                                                                                                                                    |
| podMonitors.webhook.enabled                        | Enable the webhook PodMonitor to scrape metrics                                                                                                                                                                                                                                                                                                                                                                                                                     | <code>false</code>                                                                                                                                                                                 |
| podMonitors.webhook.labels                         | Labels on the webhook PodMonitor                                                                                                                                                                                                                                                                                                                                                                                                                                    | <code>{}</code>                                                                                                                                                                                    |
| podMonitors.webhook.annotations                    | Annotations on the webhook PodMonitor                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>{}</code>                                                                                                                                                                                    |
| podMonitors.scanner.enabled                        | Enable the scanner PodMonitor to scrape metrics                                                                                                                                                                                                                                                                                                                                                                                                                     | <code>false</code>                                                                                                                                                                                 |
| podMonitors.scanner.labels                         | Labels on the scanner PodMonitor                                                                                                                                                                                                                                                                                                                                                                                                                                    | <code>{}</code>                                                                                                                                                                                    |
| podMonitors.scanner.annotations                    | Annotatons on the scanner PodMonitor                                                                                                                                                                                                                                                                                                                                                                                                                                | <code>{}</code>                                                                                                                                                                                    |
| webhook.name                                       | Service name for Webhook deployment                                                                                                                                                                                                                                                                                                                                                                                                                                 | <code>webhook</code>                                                                                                                                                                               |
| webhook.replicaCount                               | Amount of replicas for webhook. **Deprecated**, use `webhook.autoscaling.minReplicas` and `webhook.autoscaling.maxReplicas` instead.                                                                                                                                                                                                                                                                                                                                | <code>1</code>                                                                                                                                                                                     |
| webhook.image.registry                             | Webhook image registry                                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>quay.io</code>                                                                                                                                                                               |
| webhook.image.repository                           | Webhook image registry                                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>sysdig/admission-controller</code>                                                                                                                                                           |
| webhook.image.pullPolicy                           | PullPolicy for Webhook image                                                                                                                                                                                                                                                                                                                                                                                                                                        | <code></code>                                                                                                                                                                                      |
| webhook.image.tag                                  | Override the default image tag. If not specified, it defaults to appVersion in Chart.yaml                                                                                                                                                                                                                                                                                                                                                                           | <code></code>                                                                                                                                                                                      |
| webhook.image.digest                               | Specify the image digest value.  If set, this value is used instead of the tag value.                                                                                                                                                                                                                                                                                                                                                                               | <code></code>                                                                                                                                                                                      |
| webhook.labels                                     | Additional labels, applies to webhook only                                                                                                                                                                                                                                                                                                                                                                                                                          | <code>{}</code>                                                                                                                                                                                    |
| webhook.service.type                               | Use this type as webhook service                                                                                                                                                                                                                                                                                                                                                                                                                                    | <code>ClusterIP</code>                                                                                                                                                                             |
| webhook.service.port                               | Configure port for the webhook service                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>443</code>                                                                                                                                                                                   |
| webhook.rbac.create                                | Enable the creation of ClusterRoles and the binding of these roles                                                                                                                                                                                                                                                                                                                                                                                                  | <code>true</code>                                                                                                                                                                                  |
| webhook.httpProxy                                  | HTTP Proxy settings for webhook. <br/>Set to http(s)://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                                                                                                                                                                       | <code>""</code>                                                                                                                                                                                    |
| webhook.httpsProxy                                 | HTTPS Proxy settings for webhook. <br/>Set to http(s)://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                                                                                                                                                                      | <code>""</code>                                                                                                                                                                                    |
| webhook.noProxy                                    | List of hosts, IPs, or IPs in CIDR format that should not go through the proxy. We include "kubernetes" service and typical 10.0.0.0/8 services                                                                                                                                                                                                                                                                                                                     | <code>kubernetes,10.0.0.0/8</code>                                                                                                                                                                 |
| webhook.podAnnotations                             | Webhook pod annotations. If empty, some annotations are automatically generated for prometheus scraping.                                                                                                                                                                                                                                                                                                                                                            | <code>{}</code>                                                                                                                                                                                    |
| webhook.podSecurityContext                         | Pod Security context for webhook.If empty, some security context are automatically generated.                                                                                                                                                                                                                                                                                                                                                                       | <code>{}</code>                                                                                                                                                                                    |
| webhook.securityContext                            | Configure securityContext for webhook. If empty, some security context are automatically generated.                                                                                                                                                                                                                                                                                                                                                                 | <code>{}</code>                                                                                                                                                                                    |
| webhook.hostNetwork                                | Specifies if the webhook should be started in hostNetwork mode. <br/>This is required if using a custom CNI where the managed control plane nodes are unable to initiate network connections to the pods, for example using Calico CNI plugin on EKS. <br/>This is not required or recommended in most contexts.                                                                                                                                                    | <code>false</code>                                                                                                                                                                                 |
| webhook.imagePullSecrets                           | The image pull secrets for webhook                                                                                                                                                                                                                                                                                                                                                                                                                                  | <code>[]</code>                                                                                                                                                                                    |
| webhook.resources                                  | Resource request and limits for webhook                                                                                                                                                                                                                                                                                                                                                                                                                             | <code>{"limits":{"cpu":"250m","memory":"256Mi"},"requests":{"cpu":"100m","memory":"256Mi"}}</code>                                                                                                 |
| webhook.autoscaling.enabled                        | Enable horizontal pod autoscaling                                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>true</code>                                                                                                                                                                                  |
| webhook.autoscaling.minReplicas                    | Min replicas to use while autoscaling the webhook                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>2</code>                                                                                                                                                                                     |
| webhook.autoscaling.maxReplicas                    | Max replicas to use while autoscaling the webhook                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>5</code>                                                                                                                                                                                     |
| webhook.autoscaling.targetCPUUtilizationPercentage | Target CPU to use when the number of replicas must be increased                                                                                                                                                                                                                                                                                                                                                                                                     | <code>80</code>                                                                                                                                                                                    |
| webhook.timeoutSeconds                             | Number of seconds for the request to time out                                                                                                                                                                                                                                                                                                                                                                                                                       | <code>5</code>                                                                                                                                                                                     |
| webhook.nodeSelector                               | Configure nodeSelector for scheduling for webhook                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>{}</code>                                                                                                                                                                                    |
| webhook.priorityClassName                          | priorityClassName config for the webhook                                                                                                                                                                                                                                                                                                                                                                                                                            | <code></code>                                                                                                                                                                                      |
| webhook.tolerations                                | Tolerations for scheduling for webhook                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>[]</code>                                                                                                                                                                                    |
| webhook.affinity                                   | Configure affinity rules for webhook                                                                                                                                                                                                                                                                                                                                                                                                                                | <code>{}</code>                                                                                                                                                                                    |
| webhook.denyOnError                                | Deny request when an error happened evaluating request                                                                                                                                                                                                                                                                                                                                                                                                              | <code>false</code>                                                                                                                                                                                 |
| webhook.dryRun                                     | Dry Run request                                                                                                                                                                                                                                                                                                                                                                                                                                                     | <code>false</code>                                                                                                                                                                                 |
| webhook.logLevel                                   | Log Level - Valid Values are: error, info, debug, trace                                                                                                                                                                                                                                                                                                                                                                                                             | <code>info</code>                                                                                                                                                                                  |
| webhook.ssl.reuseTLSSecret                         | Reuse existing TLS Secret during chart upgrade                                                                                                                                                                                                                                                                                                                                                                                                                      | <code>false</code>                                                                                                                                                                                 |
| webhook.ssl.ca.cert                                | For outbound connections (secure backend, proxy,...) <br/>And inbound connections to serve HttpRequests as Kubernetes Webhook. <br/>A PEM-encoded x509 certificate authority. <br/>If empty, a new CA will be autogenerated.                                                                                                                                                                                                                                        | <code>""</code>                                                                                                                                                                                    |
| webhook.ssl.ca.key                                 | For outbound connections (secure backend, proxy,...) <br/>A PEM-encoded private key of the certificate authority to use in the certificate generation. <br/>If empty, a new CA will be autogenerated.                                                                                                                                                                                                                                                               | <code>""</code>                                                                                                                                                                                    |
| webhook.ssl.cert                                   | For inbound connections to serve HttpRequests as Kubernetes Webhook. <br/>A PEM-encoded x509 certificate signed by the CA. <br/>If empty, a new cert will be generated. <br/>If provided, it must be valid with the `webhook.ssl.ca`. <br/>If this is set, the key must also be provided.                                                                                                                                                                           | <code>""</code>                                                                                                                                                                                    |
| webhook.ssl.key                                    | For inbound connections to serve HttpRequests as Kubernetes Webhook. <br/>A PEM-encoded private key signed by the CA. <br/>If empty, a new key will be generated. <br/>If provided, it must be valid with the `webhook.ssl.ca`. <br/>If this is set, the cert must also be provided.                                                                                                                                                                                | <code>""</code>                                                                                                                                                                                    |
| webhook.customEntryPoint                           | Custom entrypoint for the webhook <br/>Remember to provide the webhook valid arguments with `--tls_cert_file` and `--tls_private_key_file`. <br/>default: /bin/webhook --tls_cert_file /cert/tls.crt --tls_private_key_file /cert/tls.key                                                                                                                                                                                                                           | <code>[]</code>                                                                                                                                                                                    |
| webhook.http.port                                  | HTTP serve port where the requests will be served from                                                                                                                                                                                                                                                                                                                                                                                                              | <code>5000</code>                                                                                                                                                                                  |
| scc.create                                         | Enable the creation of Security Context Constraints in Openshift                                                                                                                                                                                                                                                                                                                                                                                                    | <code>true</code>                                                                                                                                                                                  |
| scanner.enabled                                    | If you only want the Kubernetes Audit Log functionality then disable this, and it will disable the Admission Controller Scanning Policy functionality.                                                                                                                                                                                                                                                                                                              | <code>true</code>                                                                                                                                                                                  |
| scanner.name                                       | Service name for Scanner deployment                                                                                                                                                                                                                                                                                                                                                                                                                                 | <code>scanner</code>                                                                                                                                                                               |
| scanner.replicaCount                               | Amount of replicas for scanner                                                                                                                                                                                                                                                                                                                                                                                                                                      | <code>1</code>                                                                                                                                                                                     |
| scanner.image.registry                             | Scanner image registry                                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>quay.io</code>                                                                                                                                                                               |
| scanner.image.repository                           | Scanner image repository                                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>sysdig/inline-scan-service</code>                                                                                                                                                            |
| scanner.image.pullPolicy                           | PullPolicy for Scanner image                                                                                                                                                                                                                                                                                                                                                                                                                                        | <code></code>                                                                                                                                                                                      |
| scanner.image.tag                                  | Scanner image tag                                                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>0.0.13</code>                                                                                                                                                                                |
| scanner.image.digest                               | Specify the image digest value.  If set, this value is used instead of the tag value.                                                                                                                                                                                                                                                                                                                                                                               | <code></code>                                                                                                                                                                                      |
| scanner.labels                                     | Additional labels, applies to scanner only                                                                                                                                                                                                                                                                                                                                                                                                                          | <code>{}</code>                                                                                                                                                                                    |
| scanner.service.port                               | Configure port for the webhook service                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>8080</code>                                                                                                                                                                                  |
| scanner.authWithSecureToken                        | Authenticate with Secure token                                                                                                                                                                                                                                                                                                                                                                                                                                      | <code>false</code>                                                                                                                                                                                 |
| scanner.httpProxy                                  | HTTP Proxy settings for scanner. <br/>Set to http(s)://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                                                                                                                                                                       | <code>""</code>                                                                                                                                                                                    |
| scanner.httpsProxy                                 | HTTPS Proxy settings for scanner. <br/>Set to http(s)://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                                                                                                                                                                      | <code>""</code>                                                                                                                                                                                    |
| scanner.noProxy                                    | List of hosts, IPs, or IPs in CIDR format that should not go through the proxy. We include "kubernetes" service and typical 10.0.0.0/8 services                                                                                                                                                                                                                                                                                                                     | <code>kubernetes,10.0.0.0/8</code>                                                                                                                                                                 |
| scanner.podAnnotations                             | Scanner pod annotations                                                                                                                                                                                                                                                                                                                                                                                                                                             | <code>{"prometheus.io/path":"/metrics","prometheus.io/port":"8080","prometheus.io/scrape":"true"}</code>                                                                                           |
| scanner.psp.create                                 | Whether to create a psp policy and role / role-binding                                                                                                                                                                                                                                                                                                                                                                                                              | <code>false</code>                                                                                                                                                                                 |
| scanner.podSecurityContext                         | PSP's for scanner                                                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>{}</code>                                                                                                                                                                                    |
| scanner.verifyRegistryTLS                          | Verify TLS on image pull from registries                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>true</code>                                                                                                                                                                                  |
| scanner.dockerCfgSecretName                        | Docker config secret. Use a provided secret containing a .dockercfg for registry authentication (i.e. Openshift internal registry)                                                                                                                                                                                                                                                                                                                                  | <code>""</code>                                                                                                                                                                                    |
| scanner.securityContext                            | Configure securityContext for scanner                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true}</code>                                                                                                   |
| scanner.imagePullSecrets                           | The image pull secrets for scanner                                                                                                                                                                                                                                                                                                                                                                                                                                  | <code>[]</code>                                                                                                                                                                                    |
| scanner.resources                                  | Resource requests and limits for scanner                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>{}</code>                                                                                                                                                                                    |
| scanner.nodeSelector                               | Configure nodeSelector for scheduling for the scanner                                                                                                                                                                                                                                                                                                                                                                                                               | <code>{}</code>                                                                                                                                                                                    |
| scanner.priorityClassName                          | priorityClassName config for the scanner                                                                                                                                                                                                                                                                                                                                                                                                                            | <code></code>                                                                                                                                                                                      |
| scanner.tolerations                                | Tolerations for scheduling for the scanner                                                                                                                                                                                                                                                                                                                                                                                                                          | <code>[]</code>                                                                                                                                                                                    |
| scanner.affinity                                   | Configure affinity rules for the scanner                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>{}</code>                                                                                                                                                                                    |
| scanner.ssl.ca.cert                                | For outbound connections (secure backend, proxy,...). <br/>A PEM-encoded x509 certificate authority. <br/>If empty, a new CA will be autogenerated.                                                                                                                                                                                                                                                                                                                 | <code>""</code>                                                                                                                                                                                    |
| scanner.customEntryPoint                           | Custom entrypoint for the scanner. <br/>Remember to provide the scanner valid arguments with `--server_port` and optionally `--auth_secure_token` <br/>default: /inline-scan-service --server_port=8080                                                                                                                                                                                                                                                             | <code>[]</code>                                                                                                                                                                                    |


Specify each parameter using the **`--set key=value[,key=value]`** argument to `helm upgrade --install`. For example:

```console
$ helm upgrade --install sysdig-admission-controller sysdig/admission-controller \
    --create-namespace -n sysdig-admission-controller --version=0.11.2 \
    --set sysdig.secureAPIToken=YOUR-KEY-HERE,clusterName=YOUR-CLUSTER-NAME
```

**Alternatively, a YAML file** that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm upgrade --install sysdig-admission-controller sysdig/admission-controller \
    --create-namespace -n sysdig-admission-controller --version=0.11.2 \
    --values values.yaml
```

### Verify the integrity and origin
Sysdig Helm Charts are signed so users can verify the integrity and origin of each chart, the steps are as follows:

#### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

#### Verify the chart

To check the integrity and the origin of the charts you can now append the `--verify` flag to the `install`, `upgrade` and `pull` helm commands.

## Examples
- [Default `values.yaml`](https://github.com/sysdiglabs/charts/blob/master/charts/admission-controller/values.yaml)
- Find some [examples of these values](https://github.com/sysdiglabs/charts/tree/master/charts/admission-controller/ci)

### Custom Admission Controller Rules to be detected

In case you don't want to detect some resources you can create your custom rules.

To achieve this, you can change the **k8sAuditDetectionsRules** variable in the [values.yaml](./values.yaml) file.
For example, if you want to filter out secrets from the AC you can try with these rules:

```
- apiGroups:
  - ""
  apiVersions: [ "*" ]
  operations: [ "*" ]
  resources:
  - bindings
  - componentstatuses
  - configmaps
  - endpoints
  - events
  - limitranges
  - namespaces
  - nodes
  - persistentvolumeclaims
  - persistentvolumes
  - pods/*
  - podtemplates
  - replicationcontrollers
  - resourcequotas
  - serviceaccounts
  - services
  scope: "*"
- apiGroups:
  - apps
  - autoscaling
  - batch
  - networking.k8s.io
  - rbac.authorization.k8s.io
  - extensions
  apiVersions: [ "*" ]
  operations: [ "*" ]
  resources: [ "*/*" ]
  scope: "*"
```

### Proxy Usage

There are several configuration parameters for the proxy usage

- Two involved components `webhook.*` and `scanner.*`; reference to the first for communications to the Sysdig backend, while
second communicates with the registry from where to pull the image to be scanned.
- configuration values `*.httpProxy`, `*.httpsProxy` and `*.noProxy`. Make sure to use at least `https` version for Sysdig Secure Backend.

If your Proxy is served with TLS
- The url for those `*.httpProxy` and `*.httpsProxy` must be `https://`
- If using a self-signed certificate you will need to also configure one of the following two options
    1. Set the `verifySSL=false` parameter
    2. Or set `*.ssl.ca.cert` for both components `webhook` and `scanner`



## Usages


### Basic

```
$ helm upgrade --install sysdig-admission-controller sysdig/admission-controller \
      --create-namespace -n sysdig-admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```



### On Prem

Use the following command to deploy in an on-prem:

```
$ helm upgrade --install sysdig-admission-controller sysdig/admission-controller \
      --create-namespace -n sysdig-admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set verifySSL=false
```

Use `verifySSL=false` if you are using self signed certificates.



### CA Provided

The following command will deploy the admission controller with a custom CA:
Note: Since the certificates are not provided, they will be autogenerated with the provided CA.

```
$ helm upgrade --install sysdig-admission-controller sysdig/admission-controller \
      --create-namespace -n sysdig-admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.ca.key=YOUR_CA_KEY_AS_PEM_ENCODED
```


### CA and Certificates Provided

The following command will deploy the admission controller with a custom CA and valid certificates signed with this CA:

```
$ helm upgrade --install sysdig-admission-controller sysdig/admission-controller \
      --create-namespace -n sysdig-admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.ca.key=YOUR_CA_KEY_AS_PEM_ENCODED \
      --set webhook.ssl.cert=YOUR_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.key=YOUR_KEY_AS_PEM_ENCODED
```

## Confirm Working Status


### Activity Audit

1. Install Admission Controller on your Kubernetes Cluster following one of the (use-cases)(#usage) described
    - This feature is enabled by default through `features.k8sAuditDetections` value
2. Check your current "Kubernetes Audit" policies in `Sysdig Secure > Policies > Threat Detection | Runtime Policies` as we will be triggering one of those to prove it's working correctly.
    - We suggest using "Create Privileged Pod" but you can choose any.
3. If possible, let's activate just installed component logs to have them at sight
    ```
    $ kubectl logs -f -n sysdig-admission-controller -l app.kubernetes.io/component=webhook
    ```
4. Trigger following command to force an unwanted audit detection
    ```
    $ kubectl run nginx --image nginx --privileged
    ```
5. If you had a chance to activate logs, take a look at them. You should see something like this
    ```
    {"level":"info","component":"console-notifier","message":"Pod started with privileged container (user=** pod=nginx ns=default images=nginx)"}
    ```
6. Confirm that event reached Sysdig Secure, looking at `Events`



### Image Scanning

1. Install Admission Controller on your Kubernetes Cluster following one of the (use-cases)(#usage) described
    - In the chart, this feature is enabled by default through `scanner.enabled` value
2. Enable Admission-Controller on your Sysdig Secure > Image Scanning > Admission Controller > Policy Assignments
This section can only be accessed by a user with Administrator permissions
3. Add some an assignment to Allow or Deny images within a namespace
4. Tail to the logs from the Admission Controller
    ```
    $ kubectl logs -f -n sysdig-admission-controller -l app.kubernetes.io/component=webhook
    ```
5. Push some deployment into your Kubernetes Cluster to watch the result, for example an nginx image
    ```
    $ kubectl run nginx --image=nginx
    ```

If policy is set to allow, the deployment will be successful.

Either way, you should see some logs in Admission Controller tail

    -- allow assignment result
    {"level":"info","component":"scanning-evaluator","message":"checking pod=nginx in namespace=default"}
    {"level":"info","component":"scanning-evaluator","message":"evaluating container with name=nginx and image=nginx"}
    {"level":"info","component":"scanning-evaluator","time":"","message":"matched policy=Allow always for namespace=default and image=nginx"}
    {"level":"info","component":"scanning-evaluator","message":"allowing container with name=nginx and image=nginx"}

    -- reject assignment result
    {"level":"info","component":"scanning-evaluator","message":"checking pod=nginx in namespace=default"}
    {"level":"info","component":"scanning-evaluator","message":"evaluating container with name=nginx and image=nginx"}
    {"level":"info","component":"scanning-evaluator","message":"matched policy=Reject Allways for namespace=default and image=nginx"}
    {"level":"info","component":"scanning-evaluator","message":"denying container with name=nginx and image=nginx reason=\"Reject Always\""}

## Running helm unit tests

The sysdiglabs/charts repository uses the following helm unittest plugin: https://github.com/quintush/helm-unittest

You can test the changes to your chart by running the test suites as follows:

```
helm unittest --helm3 .
```

The helm unit tests are in the tests folder. It is recommended to add new tests as new features are added here.

## Troubleshooting


### Q: I'm not able to get an alert for an event with the `ka.verb=get` condition.

A: Despite [Kubernetes Extensible Admission Controller webhook allows it](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#matching-requests-rules), Sysdig Admission Controller does only handle `CREATE`, `UPDATE`, `DELETE` and `CONNECT` type of events.
Also, beware Kubernetes [`apiGroups`](https://github.com/sysdiglabs/charts/blob/master/charts/admission-controller/values.yaml#L41-L54) are scoped

S: Still, if required, you can make use of the [legacy Sysdig Kubernetes Audit Log](https://docs.sysdig.com/en/docs/sysdig-secure/secure-events/kubernetes-audit-logging/#legacy-installation-instructions) which do support more verbs.

<!--
https://github.com/sysdiglabs/cloud-connector/blob/master/pkg/engine/ingestor/k8s/admission/event_builder.go#L75-L84
https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#matching-requests-rules
-->

### Q: I get tons of "TLS handshake error"

A: This happens when DEBUG is enabled but Admission Controller will behave as expected. Those calls are some non-sysdig direct calls to the Admission Controller without TLS, which raises this informational log by Go internal library.


### Q: I need to troubleshoot, any way to switch to `debug` verbose?
A: If you used helm to install, you can edit the helm `values.yaml` to set `webhook.logLevel=debug`
<br/>Alternatively, you can edit the webhook configmap - add the `LOG_LEVEL=debug` key-value and restart the webhook
```
    $ kubectl edit configmaps -n sysdig-admission-controller sysdig-admission-controller-webhook
    $ kubectl rollout restart deployment -n sysdig-admission-controller sysdig-admission-controller-webhook
```

### Q: I don't see `Policy Rules` honored
S: Review the [Admission Controller - Understanding:How Policy Conditions are applied](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/admission-controller//#understanding-how-policy-conditions-are-applied)

### Q: I don't see `Policy Assignments` order honored
A: It may be that you're using same namespace and image prefix on more than one assignment<br/>
S: Review the [Admission Controller - Understanding:Evaluation Order](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/admission-controller//#understanding-evaluation-order)

### Q: I don't see changes on `Policy Assignments` being applied on my cluster
A: Admission Controller pull changes from the Sysdig Secure platform every 5 minutes<br/>
S: You can wait those five minutes, or force the admission controller webhook restart

    $ kubectl rollout restart deployment -n sysdig-admission-controller sysdig-admission-controller-webhook

### Q: I am deploying it in a GKE Cluster, with Private Network enabled, and everything is slow or I cannot scale the cluster correctly.

```text
"Failed calling webhook, failing open audit.secure.sysdig.com: failed calling webhook "audit.secure.sysdig.com": Post "https://sysdig-ac-webhook.sysdig-agent.svc:443/k8s-audit?timeout=10s <https://sysdig-ac-webhook.sysdig-agent.svc/k8s-audit?timeout=10s>": context canceled"
```

A: GKE clusters run the K8s API outside from the cluster. If Private Network is enabled, the K8s API may be unable to reach the Admission Controller's webhook that validates each API request, so eventually every API request times out and is processed, but the performance is impacted in the process.
<br/><br/>S: As specified in [GKE Private Cluster Webhook Timeouts](https://cloud.google.com/kubernetes-engine/docs/how-to/private-clusters#api_request_that_triggers_admission_webhook_timing_out), the default firewall configuration does not allow TCP connections for ports other than 443 and 10250.
Admission Controller's webhook run on `5000 TCP port`, so you need to enable a new rule that allows the Control Plane's network to access it.
<br/>Follow the instructions in [GKE-Adding firewall rules to cluster](https://cloud.google.com/kubernetes-engine/docs/how-to/private-clusters#add_firewall_rules) to enable inbound connections to our webhook.


### Q: Getting "error getting the cluster id from kubernetes: open /var/run/secrets/kubernetes.io/serviceaccount/token: permission denied"

A: Some users (old versions of GKE) reported that the permissions to access serviceAccount token, mounted in the filesystem, was set to [`0600` permissions](https://discuss.hashicorp.com/t/wrong-permission-on-being-set-on-serviceaccount-token/28777), not allowing the pods to actually read from it.
<br/><br/>S: [Recommend](https://github.com/kubernetes/kubernetes/issues/82573) to change the `securityContext.fsGroup` to the value `65534` on the pod.
<br/>You can specify this through our helm chart with the parameter
```
--set webhook.podSecurityContext.fsGroup=65534
```

### Q: Getting readiness probe errors and cannot startup

```
13m         Warning   FailedComputeMetricsReplicas   horizontalpodautoscaler/sysdig-admission-controller-webhook   invalid metrics (1 invalid out of 1), first error is: failed to get cpu utilization: unable to get metrics for resource cpu: unable to fetch metrics from resource metrics API: the server could not find the requested resource (get pods.metrics.k8s.io)
```

A: [HorizontalAutoScaller](https://github.com/sysdiglabs/charts/blob/master/charts/admission-controller/templates/webhook/autoscaler.yaml) requires your kubernetes cluster to be able to use [metrics API](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-metrics-apis), which in some lightweight installations, such as minikube, must be enabled through a plugin
<br/>S: For minikube, enable `metric-server` plugin
```
 $ minikube addons list | grep metrics-server
 $  minikube addons enable metrics-server
 ```

### Q: Getting error "x509: certificate signed by unknown authority"

A: Sysdig installation is made with an unverfied certificate, such as self-signed, `SECURE_URL` being `https`
<br/>S: Add `--set verifySSL=false` to your installation parameters


### Q: Why is there no support for `ka.sourceips`?

AdmissionController is unable to retrieve the source IP of the events, because this information is not provided by the [Kubernetes AdmissionReview](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#request).
If you really require this field, as a workaround, you can use the legacy [Sysdig Agent + Kubernetes Audit](https://docs.sysdig.com/en/docs/sysdig-secure/secure-events/kubernetes-audit-logging/#legacy-installation-instructions)


<!--
Q: Helm v2 usage
should work with minor changes
1. Removed the option "--create-namespace" since not supported in v2. I don't see particular problem in creating the namespace manually before the execution of the chart
2. Added "--name" since required by v2 to specify the chart name
3. Changed Chart.yaml apiVersion: from v2 to v1. It seems that the difference is only related to dependencies and types, and I didn't find any of those in the chart (by default chats are considered as apps)
-->
