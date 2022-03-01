<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.TPL with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run: 
$ pre-commit install
$ pre-commit run -a

-->

# Admission Controller

[{{ .Project.Name }}]({{ .Project.URL }}) - {{ .Project.Description }}

## TL;DR;

```
$ helm repo add {{ .Repository.Name }} {{ .Repository.URL }}
$ helm repo update
$ helm install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n sysdig-{{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```

- [Configuration](#configuration)
- [Usages](#usages)
- [Confirm Working Status](#confirm-working-status)
- [Troubleshooting](#troubleshooting)


## Introduction

This chart deploys {{ .Project.App }} on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.



### Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}



###  Installing the Chart

To install the chart with the release name `{{ .Release.Name }}`:

```console
$ helm install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} -n sysdig-{{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }}
```

The command deploys {{ .Project.App }} on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`



### Uninstalling the Chart

To uninstall/delete the `{{ .Release.Name }}`:

```console
$ helm delete {{ .Release.Name }} -n {{ .Release.Namespace }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

{{ if .Chart.Values -}}

## Configuration

The following table lists the configurable parameters of the `{{ .Chart.Name }}` chart and their default values.

{{ .Chart.Values }}

Specify each parameter using the **`--set key=value[,key=value]`** argument to `helm install`. For example:

```console
$ helm install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }} {{ with .Chart.Version }} --version={{.}}{{ end }} \
    --set {{ .Chart.ValuesExample }}
```

**Alternatively, a YAML file** that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n sysdig-{{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} \
    --values values.yaml
```

Find some [examples of these values](https://github.com/sysdiglabs/charts/tree/master/charts/admission-controller/ci)
{{- end }}


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
$ helm install  sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```



### On Prem

Use the following command to deploy in an on-prem:

```
$ helm install  sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.url=SECURE_URL \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set verifySSL=false
```

Use `verifySSL=false` if you are using self signed certificates.



### CA Provided

The following command will deploy the admission controller with a custom CA:
Note: Since the certificates are not provided, they will be autogenerated with the provided CA.

```
$ helm install  sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.url=SECURE_URL \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.ca.key=YOUR_CA_KEY_AS_PEM_ENCODED
```


### CA and Certificates Provided

The following command will deploy the admission controller with a custom CA and valid certificates signed with this CA:

```
$ helm install  sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.url=SECURE_URL \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.ca.key=YOUR_CA_KEY_AS_PEM_ENCODED \
      --set webhook.ssl.cert=YOUR_CERT_AS_PEM_ENCODED \
      --set webhook.ssl.key=YOUR_KEY_AS_PEM_ENCODED
```

## Confirm Working Status

### Image Scanning

1. Install Admission Controller on your Kubernetes Cluster following one of the (use-cases)(#usage) described
2. Enable Admission-Controller on your Sysdig Secure > Image Scanning > Admission Controller > Policy Assignments
This section can only be accessed by a user with Administrator permissions
3. Add some an assignment to Allow or Deny images within a namespace
4. Tail to the logs from the Admission Controller
    ```
    $ kubectl logs -f -n  <ADMISSION_NAMESPACE> -l app.kubernetes.io/component=webhook
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


## Troubleshooting

### Q: I don't see `Policy Rules` honored
S: Review the [Admission Controller - Understanding:How Policy Conditions are applied]({{ .Project.URL }}/#understanding-how-policy-conditions-are-applied)

### Q: I don't see `Policy Assignments` order honored
A: It may be that you're using same namespace and image prefix on more than one assignment
S: Review the [Admission Controller - Understanding:Evaluation Order]({{ .Project.URL }}/#understanding-evaluation-order)

### Q: I don't see changes on `Policy Assignments` being applied on my cluster
A: Admission Controller pull changes from the server every 5 minutes
S: You can wait those five minutes, or force the admission controller webhook respawn

    $ kubectl delete pod -n <ADMISSION_NAMESPACE> -l app.kubernetes.io/component=webhook

<!--
Q: Helm v2 usage
should work with minor changes
1. Removed the option "--create-namespace" since not supported in v2. I don't see particular problem in creating the namespace manually before the execution of the chart
2. Added "--name" since required by v2 to specify the chart name
3. Changed Chart.yaml apiVersion: from v2 to v1. It seems that the difference is only related to dependencies and types, and I didn't find any of those in the chart (by default chats are considered as apps)
-->