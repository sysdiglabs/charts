<!--


DO NOT MODIFY THIS FILE MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Admission Controller

[{{ .Project.Name }}]({{ .Project.URL }}) features ActivityAudit and ImageScanning on a Kubernetes Cluster.
<br/>{{ .Project.Description }}

## TL;DR;

```
$ helm repo add {{ .Repository.Name }} {{ .Repository.URL }}
$ helm repo update
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}} {{ end }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```

- [Configuration](#configuration)
- [Usages](#usages)
- [Confirm Working Status](#confirm-working-status)
- [Troubleshooting](#troubleshooting)

<br/><br/>

## Introduction

This chart deploys {{ .Project.App }} on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.



### Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}



###  Installing the Chart

To install the chart with the release name `{{ .Release.Name }}`:

```console
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }}
```

The command deploys {{ .Project.App }} on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`



### Uninstalling the Chart

To uninstall/delete the `{{ .Release.Name }}`:

```console
$ helm uninstall sysdig-{{ .Release.Name }} -n {{ .Release.Namespace }}
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

{{ if .Chart.Values -}}

## Configuration

The following table lists the configurable parameters of the `{{ .Chart.Name }}` chart and their default values.

{{ .Chart.Values }}

Specify each parameter using the **`--set key=value[,key=value]`** argument to `helm upgrade --install`. For example:

```console
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} \
    --set {{ .Chart.ValuesExample }}
```

**Alternatively, a YAML file** that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
    --create-namespace -n {{ .Release.Namespace }}{{ with .Chart.Version }} --version={{.}}{{ end }} \
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
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN
```



### On Prem

Sysdig On-Prem installations might use a TLS self-signed server certificate or one from an untrusted CA, so it requires an extra configuration.

#### Ignore TLS certificate verification

Use the following command to deploy in an on-prem and ignore the untrusted certificate using `verifySSL=false`:

```
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set verifySSL=false
```

#### Custom CA Provided

The following command will deploy the admission controller with a custom CA. The custom CA certificate is added to the trusted certificates store.

```
$ helm upgrade --install sysdig-{{ .Release.Name }} {{ .Repository.Name }}/{{ .Chart.Name }} \
      --create-namespace -n {{ .Release.Namespace }} \
      --set clusterName=CLUSTER_NAME \
      --set sysdig.secureAPIToken=SECURE_API_TOKEN \
      --set webhook.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED \
      --set scanner.ssl.ca.cert=YOUR_CA_CERT_AS_PEM_ENCODED
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
    $ kubectl logs -f -n {{ .Release.Namespace }} -l app.kubernetes.io/component=webhook
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
    $ kubectl edit configmaps -n {{ .Release.Namespace }} sysdig-admission-controller-webhook
    $ kubectl rollout restart deployment -n {{ .Release.Namespace }} sysdig-admission-controller-webhook
```

### Q: I don't see `Policy Rules` honored
S: Review the [Admission Controller - Understanding:How Policy Conditions are applied]({{ .Project.URL }}/#understanding-how-policy-conditions-are-applied)

### Q: I don't see `Policy Assignments` order honored
A: It may be that you're using same namespace and image prefix on more than one assignment<br/>
S: Review the [Admission Controller - Understanding:Evaluation Order]({{ .Project.URL }}/#understanding-evaluation-order)

### Q: I don't see changes on `Policy Assignments` being applied on my cluster
A: Admission Controller pull changes from the Sysdig Secure platform every 5 minutes<br/>
S: You can wait those five minutes, or force the admission controller webhook restart

    $ kubectl rollout restart deployment -n {{ .Release.Namespace }} sysdig-admission-controller-webhook

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
<br/>S: Add `--set verifySSL=false` to your installation parameters or configure a trusted CA certificate


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
