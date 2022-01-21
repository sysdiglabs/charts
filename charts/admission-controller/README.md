# Admission Controller

[Sysdig Admission Controller](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/admission-controller/) - This chart deploys the Sysdig Admission Controller in your Kubernetes cluster.

## TL;DR;

```console
$ helm repo add sysdig https://charts.sysdig.com
$ helm repo update
$ helm install admission-controller sysdig/admission-controller --create-namespace -n admission-controller
```

## Introduction

This chart deploys the Sysdig Admission Controller on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes v1.16+
- Sysdig Secure API Token

## Installing the Chart

To install the chart with the release name `admission-controller`:

```console
$ helm install admission-controller sysdig/admission-controller -n admission-controller
```

The command deploys the Sysdig Admission Controller on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `admission-controller`:

```console
$ helm delete admission-controller -n admission-controller
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `admission-controller` chart and their default values.

|              Parameter              |                                                                                                                                              Description                                                                                                                                               |                                                                                         Default                                                                                         |
|-------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| sysdig.url                          | The Sysdig URL prefix                                                                                                                                                                                                                                                                                  | `"https://secure.sysdig.com"`                                                                                                                                                           |
| sysdig.secureAPIToken               | API Token to access Sysdig Secure                                                                                                                                                                                                                                                                      | `""`                                                                                                                                                                                    |
| sysdig.existingSecureAPITokenSecret | Existing secret with API Token to access Sysdig Secure Alternatively, specify the name of a Kubernetes secret containing 'SECURE_API_TOKEN' and 'AUTH_BEARER_TOKEN' entry if you're also enabling scanner                                                                                              | `""`                                                                                                                                                                                    |
| clusterName                         | Cluster Name which appear on Secure UI                                                                                                                                                                                                                                                                 | `""`                                                                                                                                                                                    |
| features.k8sAuditDetections         | Enable K8s Audit detections with Falco rules                                                                                                                                                                                                                                                           | `false`                                                                                                                                                                                 |
| features.k8sAuditDetectionsRules    | [Admission Webhook Configuration rules](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#matching-requests-rules) for the Audit Detections                                                                                                                    | `[{"apiGroups":["","apps","autoscaling","batch","networking.k8s.io","rbac.authorization.k8s.io","extensions"],"apiVersions":["*"],"operations":["*"],"resources":["*/*"],"scope":"*"}]` |
| verifySSL                           | Verify SSL on HTTPS connections to Sysdig Secure                                                                                                                                                                                                                                                       | `true`                                                                                                                                                                                  |
| nameOverride                        | Chart name override                                                                                                                                                                                                                                                                                    | `""`                                                                                                                                                                                    |
| fullnameOverride                    | Chart full name override                                                                                                                                                                                                                                                                               | `""`                                                                                                                                                                                    |
| serviceAccounts.webhook.create      | Create the service account                                                                                                                                                                                                                                                                             | `true`                                                                                                                                                                                  |
| serviceAccounts.webhook.annotations | Extra annotations for serviceAccount                                                                                                                                                                                                                                                                   | `{}`                                                                                                                                                                                    |
| serviceAccounts.webhook.name        | Use this value as serviceAccount Name                                                                                                                                                                                                                                                                  | `""`                                                                                                                                                                                    |
| serviceAccounts.scanner.create      | Create the service account                                                                                                                                                                                                                                                                             | `true`                                                                                                                                                                                  |
| serviceAccounts.scanner.annotations | Extra annotations for serviceAccount                                                                                                                                                                                                                                                                   | `{}`                                                                                                                                                                                    |
| serviceAccounts.scanner.name        | Use this value as serviceAccount Name                                                                                                                                                                                                                                                                  | `""`                                                                                                                                                                                    |
| webhook.name                        | Service name for Webhook deployment                                                                                                                                                                                                                                                                    | `webhook`                                                                                                                                                                               |
| webhook.replicaCount                | Amount of replicas for webhook                                                                                                                                                                                                                                                                         | `1`                                                                                                                                                                                     |
| webhook.image.registry              | Webhook image registry                                                                                                                                                                                                                                                                                 | `quay.io`                                                                                                                                                                               |
| webhook.image.repository            | Webhook image registry                                                                                                                                                                                                                                                                                 | `sysdig/admission-controller`                                                                                                                                                           |
| webhook.image.pullPolicy            | PullPolicy for Webhook image                                                                                                                                                                                                                                                                           | `IfNotPresent`                                                                                                                                                                          |
| webhook.image.tag                   | Override the default image tag. If not specified, it defaults to appVersion in Chart.yaml                                                                                                                                                                                                              | ``                                                                                                                                                                                      |
| webhook.service.type                | Use this type as webhook service                                                                                                                                                                                                                                                                       | `ClusterIP`                                                                                                                                                                             |
| webhook.service.port                | Configure port for the webhook service                                                                                                                                                                                                                                                                 | `443`                                                                                                                                                                                   |
| webhook.httpProxy                   | HTTP Proxy settings for webhook. Set to http://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                  | `""`                                                                                                                                                                                    |
| webhook.httpsProxy                  | HTTPS Proxy settings for webhook. Set to https://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                | `""`                                                                                                                                                                                    |
| webhook.noProxy                     | List of hosts, IPs, or IPs in CIDR format that should not go through the proxy. We include "kubernetes" service and typical 10.0.0.0/8 services                                                                                                                                                        | `kubernetes,10.0.0.0/8`                                                                                                                                                                 |
| webhook.podAnnotations              | Webhook pod annotations                                                                                                                                                                                                                                                                                | `{"prometheus.io/path":"/metrics","prometheus.io/port":"5000","prometheus.io/scheme":"https","prometheus.io/scrape":"true","sidecar.istio.io/inject":"false"}`                          |
| webhook.podSecurityContext          | PSP's for webhook                                                                                                                                                                                                                                                                                      | `{}`                                                                                                                                                                                    |
| webhook.securityContext             | Configure securityContext for webhook                                                                                                                                                                                                                                                                  | `{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true}`                                                                                                   |
| webhook.hostNetwork                 | Specifies if the webhook should be started in hostNetwork mode. This is required if using a custom CNI where the managed control plane nodes are unable to initiate network connections to the pods, for example using Calico CNI plugin on EKS. This is not required or recommended in most contexts. | `false`                                                                                                                                                                                 |
| webhook.imagePullSecrets            | The image pull secrets for webhook                                                                                                                                                                                                                                                                     | `[]`                                                                                                                                                                                    |
| webhook.resources                   | Resource request and limits for webhook                                                                                                                                                                                                                                                                | `{}`                                                                                                                                                                                    |
| webhook.timeoutSeconds              | Number of seconds for the request to time out                                                                                                                                                                                                                                                          | `10`                                                                                                                                                                                    |
| webhook.nodeSelector                | Configure nodeSelector for scheduling for webhook                                                                                                                                                                                                                                                      | `{}`                                                                                                                                                                                    |
| webhook.tolerations                 | Tolerations for scheduling for webhook                                                                                                                                                                                                                                                                 | `[]`                                                                                                                                                                                    |
| webhook.affinity                    | Configure affinity rules for webhook                                                                                                                                                                                                                                                                   | `{}`                                                                                                                                                                                    |
| webhook.denyOnError                 | Deny request when an error happened evaluating request                                                                                                                                                                                                                                                 | `false`                                                                                                                                                                                 |
| webhook.dryRun                      | Dry Run request                                                                                                                                                                                                                                                                                        | `false`                                                                                                                                                                                 |
| webhook.ssl.ca.cert                 | A PEM-encoded x509 certificate authority to use in the certificate generation. If empty, a new CA will be autogenerated.                                                                                                                                                                               | ``                                                                                                                                                                                      |
| webhook.ssl.ca.key                  | A PEM-encoded private key of the certificate authority to use in the certificate generation. If empty, a new CA will be autogenerated.                                                                                                                                                                 | ``                                                                                                                                                                                      |
| webhook.ssl.cert                    | A PEM-encoded x509 certificate signed by the CA. If empty, a new cert will be generated. If provided, it must be valid with the `webhook.ssl.ca`. If this is set, the key must also be provided.                                                                                                       | ``                                                                                                                                                                                      |
| webhook.ssl.key                     | A PEM-encoded private key signed by the CA. If empty, a new key will be generated. If provided, it must be valid with the `webhook.ssl.ca`. If this is set, the cert must also be provided.                                                                                                            | ``                                                                                                                                                                                      |
| scanner.enabled                     | Deploy the Inline Scanner Service                                                                                                                                                                                                                                                                      | `true`                                                                                                                                                                                  |
| scanner.name                        | Service name for Scanner deployment                                                                                                                                                                                                                                                                    | `scanner`                                                                                                                                                                               |
| scanner.replicaCount                | Amount of replicas for scanner                                                                                                                                                                                                                                                                         | `1`                                                                                                                                                                                     |
| scanner.image.registry              | Scanner image registry                                                                                                                                                                                                                                                                                 | `quay.io`                                                                                                                                                                               |
| scanner.image.repository            | Scanner image repository                                                                                                                                                                                                                                                                               | `sysdig/inline-scan-service`                                                                                                                                                            |
| scanner.image.pullPolicy            | PullPolicy for Scanner image                                                                                                                                                                                                                                                                           | `IfNotPresent`                                                                                                                                                                          |
| scanner.image.tag                   | Scanner image tag                                                                                                                                                                                                                                                                                      | `0.0.9`                                                                                                                                                                                 |
| scanner.service.port                | Configure port for the webhook service                                                                                                                                                                                                                                                                 | `8080`                                                                                                                                                                                  |
| scanner.authWithSecureToken         | Authenticate with Secure token                                                                                                                                                                                                                                                                         | `false`                                                                                                                                                                                 |
| scanner.httpProxy                   | HTTP Proxy settings for scanner. Set to http://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                  | `""`                                                                                                                                                                                    |
| scanner.httpsProxy                  | HTTPS Proxy settings for scanner. Set to https://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                | `""`                                                                                                                                                                                    |
| scanner.noProxy                     | List of hosts, IPs, or IPs in CIDR format that should not go through the proxy. We include "kubernetes" service and typical 10.0.0.0/8 services                                                                                                                                                        | `kubernetes,10.0.0.0/8`                                                                                                                                                                 |
| scanner.podAnnotations              | Scanner pod annotations                                                                                                                                                                                                                                                                                | `{"prometheus.io/path":"/metrics","prometheus.io/port":"8080","prometheus.io/scrape":"true"}`                                                                                           |
| scanner.psp.create                  | Whether to create a psp policy and role / role-binding                                                                                                                                                                                                                                                 | `false`                                                                                                                                                                                 |
| scanner.podSecurityContext          | PSP's for scanner                                                                                                                                                                                                                                                                                      | `{}`                                                                                                                                                                                    |
| scanner.verifyRegistryTLS           | Verify TLS on image pull from registries                                                                                                                                                                                                                                                               | `true`                                                                                                                                                                                  |
| scanner.dockerCfgSecretName         | Docker config secret. Use a provided secret containing a .dockercfg for registry authentication (i.e. Openshift internal registry)                                                                                                                                                                     | `""`                                                                                                                                                                                    |
| scanner.securityContext             | Configure securityContext for scanner                                                                                                                                                                                                                                                                  | `{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true}`                                                                                                   |
| scanner.imagePullSecrets            | The image pull secrets for scanner                                                                                                                                                                                                                                                                     | `[]`                                                                                                                                                                                    |
| scanner.resources                   | Resource requests and limits for scanner                                                                                                                                                                                                                                                               | `{}`                                                                                                                                                                                    |
| scanner.nodeSelector                | Configure nodeSelector for scheduling for the scanner                                                                                                                                                                                                                                                  | `{}`                                                                                                                                                                                    |
| scanner.tolerations                 | Tolerations for scheduling for the scanner                                                                                                                                                                                                                                                             | `[]`                                                                                                                                                                                    |
| scanner.affinity                    | Configure affinity rules for the scanner                                                                                                                                                                                                                                                               | `{}`                                                                                                                                                                                    |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install admission-controller sysdig/admission-controller --create-namespace -n admission-controller  --set sysdig.secureAPIToken=YOUR-KEY-HERE,clusterName=YOUR-CLUSTER-NAME
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install admission-controller sysdig/admission-controller --create-namespace -n admission-controller --values values.yaml
```


### Custom Admission Controller Rules to be detected
In case you don't want to detect some resources you can create your custom rules. To achieve this, you can change the **k8sAuditDetectionsRules**
variable in the _values.yaml_ file.
For example, if you want to filter out secrets from the AC you can try with these rules:]
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
### On Prem deployment

Use the following command to deploy in an on-prem:

```
$ helm install  --create-namespace -n admission-controller admission-controller \
                --set sysdig.url=SECURE_URL \
                --set sysdig.secureAPIToken=SECURE_API_TOKEN \
                --set clusterName=CLUSTER_NAME \
                --set verifySSL=false \
                sysdig/admission-controller
```

Use `verifySSL=false` if you are using self signed certificates.

### CA Provided Deployment

The following command will deploy the admission controller with a custom CA:

```
$ helm install  --create-namespace -n admission-controller admission-controller \
                --set sysdig.url=SECURE_URL \
                --set sysdig.secureAPIToken=SECURE_API_TOKEN \
                --set clusterName=CLUSTER_NAME \
                --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
                --set webhook.ssl.ca.key=YOUR_CA_KEY_AS_PEM_ENCODED \
                sysdig/admission-controller
```

Since the certificates are not provided, they will be autogenerated with the provided CA.

### CA and Certificates Provided Deployment

The following command will deploy the admission controller with a custom CA and valid certificates signed with this CA:

```
$ helm install  --create-namespace -n admission-controller admission-controller \
                --set sysdig.url=SECURE_URL \
                --set sysdig.secureAPIToken=SECURE_API_TOKEN \
                --set clusterName=CLUSTER_NAME \
                --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
                --set webhook.ssl.ca.key=YOUR_CA_KEY_AS_PEM_ENCODED \
                --set webhook.ssl.cert=YOUR_CERT_AS_PEM_ENCODED \
                --set webhook.ssl.key=YOUR_KEY_AS_PEM_ENCODED \
                sysdig/admission-controller
```
