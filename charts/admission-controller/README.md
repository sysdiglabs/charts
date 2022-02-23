<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.TPL with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run: 
$ pre-commit install
$ pre-commit run -a

-->

# Admission Controller

[Sysdig Admission Controller](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/admission-controller/) - This chart deploys the Sysdig Admission Controller in your Kubernetes cluster.

## TL;DR;

```
$ helm repo add sysdig https://charts.sysdig.com
$ helm repo update
$ helm install admission-controller sysdig/admission-controller \
      --create-namespace -n admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```

See other [usages](#usages)



## Introduction

This chart deploys the Sysdig Admission Controller on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.



### Prerequisites

- Kubernetes v1.16+
- Cluster Name (pick one to identify your Kubernetes Cluster)
- Sysdig Secure API Token



###  Installing the Chart

To install the chart with the release name `admission-controller`:

```console
$ helm install admission-controller sysdig/admission-controller -n admission-controller
```

The command deploys the Sysdig Admission Controller on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`



### Uninstalling the Chart

To uninstall/delete the `admission-controller`:

```console
$ helm delete admission-controller -n admission-controller
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `admission-controller` chart and their default values.

|              Parameter              |                                                                                                                                                                                                                             Description                                                                                                                                                                                                                             |                                                                                              Default                                                                                               |
|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clusterName                         | **required** <br/>Cluster Name which appear on Secure UI                                                                                                                                                                                                                                                                                                                                                                                                            | <code>""</code>                                                                                                                                                                                    |
| sysdig.secureAPIToken               | **required** <br/> API Token to access Sysdig Secure. <br/><br/>If neither this value nor `sysdig.existingSecureAPITokenSecret` are configured, the user will be required to provide the deployment the `SECURE_API_TOKEN` (and `AUTH_BEARER_TOKEN` if the scanner is enabled) environment variables.                                                                                                                                                               | <code>""</code>                                                                                                                                                                                    |
| sysdig.existingSecureAPITokenSecret | **required** <br/>Existing secret with API Token to access Sysdig Secure <br/>Alternatively, specify the name of a Kubernetes secret containing `SECURE_API_TOKEN` and `AUTH_BEARER_TOKEN` entry if you're also enabling scanner. <br/><br/>If neither this value nor `sysdig.secureAPIToken` are configured, the user will be required to provide the deployment the `SECURE_API_TOKEN` (and `AUTH_BEARER_TOKEN` if the scanner is enabled) environment variables. | <code>""</code>                                                                                                                                                                                    |
| sysdig.url                          | The Sysdig URL prefix                                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>"https://secure.sysdig.com"</code>                                                                                                                                                           |
| features.k8sAuditDetections         | Enable K8s Audit detections with Falco rules                                                                                                                                                                                                                                                                                                                                                                                                                        | <code>false</code>                                                                                                                                                                                 |
| features.k8sAuditDetectionsRules    | [Admission Webhook Configuration rules](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#matching-requests-rules) for the Audit Detections                                                                                                                                                                                                                                                                                 | <code>[{"apiGroups":["","apps","autoscaling","batch","networking.k8s.io","rbac.authorization.k8s.io","extensions"],"apiVersions":["*"],"operations":["*"],"resources":["*/*"],"scope":"*"}]</code> |
| verifySSL                           | Verify SSL on HTTPS connections to Sysdig Secure                                                                                                                                                                                                                                                                                                                                                                                                                    | <code>true</code>                                                                                                                                                                                  |
| nameOverride                        | Chart name override                                                                                                                                                                                                                                                                                                                                                                                                                                                 | <code>""</code>                                                                                                                                                                                    |
| fullnameOverride                    | Chart full name override                                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>""</code>                                                                                                                                                                                    |
| serviceAccounts.webhook.create      | Create the service account                                                                                                                                                                                                                                                                                                                                                                                                                                          | <code>true</code>                                                                                                                                                                                  |
| serviceAccounts.webhook.annotations | Extra annotations for serviceAccount                                                                                                                                                                                                                                                                                                                                                                                                                                | <code>{}</code>                                                                                                                                                                                    |
| serviceAccounts.webhook.name        | Use this value as serviceAccount Name                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>""</code>                                                                                                                                                                                    |
| serviceAccounts.scanner.create      | Create the service account                                                                                                                                                                                                                                                                                                                                                                                                                                          | <code>true</code>                                                                                                                                                                                  |
| serviceAccounts.scanner.annotations | Extra annotations for serviceAccount                                                                                                                                                                                                                                                                                                                                                                                                                                | <code>{}</code>                                                                                                                                                                                    |
| serviceAccounts.scanner.name        | Use this value as serviceAccount Name                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>""</code>                                                                                                                                                                                    |
| webhook.name                        | Service name for Webhook deployment                                                                                                                                                                                                                                                                                                                                                                                                                                 | <code>webhook</code>                                                                                                                                                                               |
| webhook.replicaCount                | Amount of replicas for webhook                                                                                                                                                                                                                                                                                                                                                                                                                                      | <code>1</code>                                                                                                                                                                                     |
| webhook.image.registry              | Webhook image registry                                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>quay.io</code>                                                                                                                                                                               |
| webhook.image.repository            | Webhook image registry                                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>sysdig/admission-controller</code>                                                                                                                                                           |
| webhook.image.pullPolicy            | PullPolicy for Webhook image                                                                                                                                                                                                                                                                                                                                                                                                                                        | <code>IfNotPresent</code>                                                                                                                                                                          |
| webhook.image.tag                   | Override the default image tag. If not specified, it defaults to appVersion in Chart.yaml                                                                                                                                                                                                                                                                                                                                                                           | <code></code>                                                                                                                                                                                      |
| webhook.service.type                | Use this type as webhook service                                                                                                                                                                                                                                                                                                                                                                                                                                    | <code>ClusterIP</code>                                                                                                                                                                             |
| webhook.service.port                | Configure port for the webhook service                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>443</code>                                                                                                                                                                                   |
| webhook.httpProxy                   | HTTP Proxy settings for webhook. <br/>Set to http://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                                                                                                                                                                          | <code>""</code>                                                                                                                                                                                    |
| webhook.httpsProxy                  | HTTPS Proxy settings for webhook. <br/>Set to https://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                                                                                                                                                                        | <code>""</code>                                                                                                                                                                                    |
| webhook.noProxy                     | List of hosts, IPs, or IPs in CIDR format that should not go through the proxy. We include "kubernetes" service and typical 10.0.0.0/8 services                                                                                                                                                                                                                                                                                                                     | <code>kubernetes,10.0.0.0/8</code>                                                                                                                                                                 |
| webhook.podAnnotations              | Webhook pod annotations                                                                                                                                                                                                                                                                                                                                                                                                                                             | <code>{"prometheus.io/path":"/metrics","prometheus.io/port":"5000","prometheus.io/scheme":"https","prometheus.io/scrape":"true","sidecar.istio.io/inject":"false"}</code>                          |
| webhook.podSecurityContext          | PSP's for webhook                                                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>{}</code>                                                                                                                                                                                    |
| webhook.securityContext             | Configure securityContext for webhook                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true}</code>                                                                                                   |
| webhook.hostNetwork                 | Specifies if the webhook should be started in hostNetwork mode. <br/>This is required if using a custom CNI where the managed control plane nodes are unable to initiate network connections to the pods, for example using Calico CNI plugin on EKS. <br/>This is not required or recommended in most contexts.                                                                                                                                                    | <code>false</code>                                                                                                                                                                                 |
| webhook.imagePullSecrets            | The image pull secrets for webhook                                                                                                                                                                                                                                                                                                                                                                                                                                  | <code>[]</code>                                                                                                                                                                                    |
| webhook.resources                   | Resource request and limits for webhook                                                                                                                                                                                                                                                                                                                                                                                                                             | <code>{}</code>                                                                                                                                                                                    |
| webhook.timeoutSeconds              | Number of seconds for the request to time out                                                                                                                                                                                                                                                                                                                                                                                                                       | <code>10</code>                                                                                                                                                                                    |
| webhook.nodeSelector                | Configure nodeSelector for scheduling for webhook                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>{}</code>                                                                                                                                                                                    |
| webhook.tolerations                 | Tolerations for scheduling for webhook                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>[]</code>                                                                                                                                                                                    |
| webhook.affinity                    | Configure affinity rules for webhook                                                                                                                                                                                                                                                                                                                                                                                                                                | <code>{}</code>                                                                                                                                                                                    |
| webhook.denyOnError                 | Deny request when an error happened evaluating request                                                                                                                                                                                                                                                                                                                                                                                                              | <code>false</code>                                                                                                                                                                                 |
| webhook.dryRun                      | Dry Run request                                                                                                                                                                                                                                                                                                                                                                                                                                                     | <code>false</code>                                                                                                                                                                                 |
| webhook.ssl.ca.cert                 | A PEM-encoded x509 certificate authority to use in the certificate generation and to contact the Secure backend. If empty, a new CA will be autogenerated.                                                                                                                                                                                                                                                                                                          | <code>""</code>                                                                                                                                                                                    |
| webhook.ssl.ca.key                  | A PEM-encoded private key of the certificate authority to use in the certificate generation. If empty, a new CA will be autogenerated.                                                                                                                                                                                                                                                                                                                              | <code>""</code>                                                                                                                                                                                    |
| webhook.ssl.cert                    | A PEM-encoded x509 certificate signed by the CA. If empty, a new cert will be generated. If provided, it must be valid with the `webhook.ssl.ca`. If this is set, the key must also be provided.                                                                                                                                                                                                                                                                    | <code>""</code>                                                                                                                                                                                    |
| webhook.ssl.key                     | A PEM-encoded private key signed by the CA. If empty, a new key will be generated. If provided, it must be valid with the `webhook.ssl.ca`. If this is set, the cert must also be provided.                                                                                                                                                                                                                                                                         | <code>""</code>                                                                                                                                                                                    |
| webhook.customEntryPoint            | Custom entrypoint for the webhook. If configured, remember to provide the webhook valid arguments with `--tls_cert_file` and `--tls_private_key_file`.                                                                                                                                                                                                                                                                                                              | <code>[]</code>                                                                                                                                                                                    |
| scanner.enabled                     | Deploy the Inline Scanner Service                                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>true</code>                                                                                                                                                                                  |
| scanner.name                        | Service name for Scanner deployment                                                                                                                                                                                                                                                                                                                                                                                                                                 | <code>scanner</code>                                                                                                                                                                               |
| scanner.replicaCount                | Amount of replicas for scanner                                                                                                                                                                                                                                                                                                                                                                                                                                      | <code>1</code>                                                                                                                                                                                     |
| scanner.image.registry              | Scanner image registry                                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>quay.io</code>                                                                                                                                                                               |
| scanner.image.repository            | Scanner image repository                                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>sysdig/inline-scan-service</code>                                                                                                                                                            |
| scanner.image.pullPolicy            | PullPolicy for Scanner image                                                                                                                                                                                                                                                                                                                                                                                                                                        | <code>IfNotPresent</code>                                                                                                                                                                          |
| scanner.image.tag                   | Scanner image tag                                                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>0.0.9</code>                                                                                                                                                                                 |
| scanner.service.port                | Configure port for the webhook service                                                                                                                                                                                                                                                                                                                                                                                                                              | <code>8080</code>                                                                                                                                                                                  |
| scanner.authWithSecureToken         | Authenticate with Secure token                                                                                                                                                                                                                                                                                                                                                                                                                                      | <code>false</code>                                                                                                                                                                                 |
| scanner.httpProxy                   | HTTP Proxy settings for scanner. <br/>Set to http://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                                                                                                                                                                          | <code>""</code>                                                                                                                                                                                    |
| scanner.httpsProxy                  | HTTPS Proxy settings for scanner. <br/>Set to https://proxyIp:proxyPort in case connection to Sysdig Secure requires a proxy                                                                                                                                                                                                                                                                                                                                        | <code>""</code>                                                                                                                                                                                    |
| scanner.noProxy                     | List of hosts, IPs, or IPs in CIDR format that should not go through the proxy. We include "kubernetes" service and typical 10.0.0.0/8 services                                                                                                                                                                                                                                                                                                                     | <code>kubernetes,10.0.0.0/8</code>                                                                                                                                                                 |
| scanner.podAnnotations              | Scanner pod annotations                                                                                                                                                                                                                                                                                                                                                                                                                                             | <code>{"prometheus.io/path":"/metrics","prometheus.io/port":"8080","prometheus.io/scrape":"true"}</code>                                                                                           |
| scanner.psp.create                  | Whether to create a psp policy and role / role-binding                                                                                                                                                                                                                                                                                                                                                                                                              | <code>false</code>                                                                                                                                                                                 |
| scanner.podSecurityContext          | PSP's for scanner                                                                                                                                                                                                                                                                                                                                                                                                                                                   | <code>{}</code>                                                                                                                                                                                    |
| scanner.verifyRegistryTLS           | Verify TLS on image pull from registries                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>true</code>                                                                                                                                                                                  |
| scanner.dockerCfgSecretName         | Docker config secret. Use a provided secret containing a .dockercfg for registry authentication (i.e. Openshift internal registry)                                                                                                                                                                                                                                                                                                                                  | <code>""</code>                                                                                                                                                                                    |
| scanner.securityContext             | Configure securityContext for scanner                                                                                                                                                                                                                                                                                                                                                                                                                               | <code>{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true}</code>                                                                                                   |
| scanner.imagePullSecrets            | The image pull secrets for scanner                                                                                                                                                                                                                                                                                                                                                                                                                                  | <code>[]</code>                                                                                                                                                                                    |
| scanner.resources                   | Resource requests and limits for scanner                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>{}</code>                                                                                                                                                                                    |
| scanner.nodeSelector                | Configure nodeSelector for scheduling for the scanner                                                                                                                                                                                                                                                                                                                                                                                                               | <code>{}</code>                                                                                                                                                                                    |
| scanner.tolerations                 | Tolerations for scheduling for the scanner                                                                                                                                                                                                                                                                                                                                                                                                                          | <code>[]</code>                                                                                                                                                                                    |
| scanner.affinity                    | Configure affinity rules for the scanner                                                                                                                                                                                                                                                                                                                                                                                                                            | <code>{}</code>                                                                                                                                                                                    |
| scanner.ssl.ca.cert                 | A PEM-encoded x509 certificate authority to use when contacting the secure backend.                                                                                                                                                                                                                                                                                                                                                                                 | <code>""</code>                                                                                                                                                                                    |
| scanner.customEntryPoint            | Custom entrypoint for the scanner. If configured, remember to provide the scanner valid arguments with `--server_port` and `--auth_secure_token`                                                                                                                                                                                                                                                                                                                    | <code>[]</code>                                                                                                                                                                                    |



Specify each parameter using the **`--set key=value[,key=value]`** argument to `helm install`. For example:

```console
$ helm install admission-controller sysdig/admission-controller --create-namespace -n admission-controller  --set sysdig.secureAPIToken=YOUR-KEY-HERE,clusterName=YOUR-CLUSTER-NAME
```



**Alternatively, a YAML file** that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install admission-controller sysdig/admission-controller --create-namespace -n admission-controller --values values.yaml
```


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


## Usages


### Basic

```
$ helm install  admission-controller sysdig/admission-controller \
      --create-namespace -n admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN     
```



### On Prem

Use the following command to deploy in an on-prem:

```
$ helm install  admission-controller sysdig/admission-controller \
      --create-namespace -n admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.url=SECURE_URL \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set verifySSL=false
```

Use `verifySSL=false` if you are using self signed certificates.



### CA Provided

The following command will deploy the admission controller with a custom CA:

```
$ helm install  admission-controller sysdig/admission-controller \
      --create-namespace -n admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.url=SECURE_URL \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.ca.key=YOUR_CA_KEY_AS_PEM_ENCODED
```

Since the certificates are not provided, they will be autogenerated with the provided CA.



### CA and Certificates Provided

The following command will deploy the admission controller with a custom CA and valid certificates signed with this CA:

```
$ helm install  admission-controller sysdig/admission-controller \
      --create-namespace -n admission-controller \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.url=SECURE_URL \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.ca.key=YOUR_CA_KEY_AS_PEM_ENCODED \
      --set webhook.ssl.cert=YOUR_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.key=YOUR_KEY_AS_PEM_ENCODED
```
