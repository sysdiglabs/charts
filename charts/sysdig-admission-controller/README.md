Sysdig’s Admission Controller combines the Sysdig Secure image scanner with the Rego-based policy language to evaluate the scan results and the admission context, providing great flexibility on the admission decision.

Using native Kubernetes API extensions to perform the image scanning on admission enables major threat prevention with the hardening use case: “Only the images that are explicitly approved will be allowed to run on your cluster.”

The admission decision relies not only on the image name and tag, but also on additional context from the admission review, including the namespace, pod metadata, etc.

* TOC
{: toc}

### Features

 * Registry and repository whitelist
 * Global and per-namespace admission configuration
 * Configurable pre-scan and post-scan behavior, i.e.:
   * Accept only the images that pass the scan (default)
   * Directly reject non-whitelisted registries / repos, without scanning
   * Accept the image even if it doesn’t pass the scan
   * Do not accept any image that hasn’t been scanned already
 * Pod mutation: image tag is replaced by digest to prevent TOCTOU issue if the tag is updated between the scan and the pod scheduling.

### Common use cases

* User doesn't want to admit any image that doesn't pass the scanning policy
* User only wants to admit images from internal, curated repositories
* User wants to apply different admission and scanning policies depending on the namespace

### Additional links

[Blogpost](https://sysdig.com/blog/image-scanning-admission-controller/) (Slightly outdated since this was focused on our OPA integration, but contains the most important concepts)

## Requirements

* Helm 3
* Kubernetes 1.15 or higher

## Installation

Create a values.yaml overriding the desired values from the [values.yaml file in the repository](https://raw.githubusercontent.com/sysdiglabs/charts/master/charts/sysdig-admission-controller/values.yaml):

```yaml
# Uncomment the following line and set URL for On-Prem
# sysdigSecureApiUrl: https://HOSTNAME
# Put your <Sysdig-Secure-Secret-Token> in this value
sysdigSecureToken: xxxx-xxxxx-xxx

#Set to true to increase verbosity and output OPA input and rules in the log
verboseLog: false

preScanPolicies:

  autoGenerate: true

  defaultPolicy: accept

  # customPolicies:
  #   - prefix: "my.totally-trusted-registry.com/"
  #     action: accept
  #   - prefix: "bad-registry.com/specific-repo/"
  #     action: scan
  #   - prefix: "internal-registry.com/"
  #     action: check-scan
  #   - prefix: "bad-registry.com/"
  #     action: reject
  #   - prefix: "malware-registry.io/"
  #     action: reject

  byNamespace:
    ns-prod:
      defaultPolicy: accept
      customPolicies:
        - prefix: "docker.io/"
          action: scan

scanPolicies:

  # If set to "true", a default set of rules will be generated from this YAML values.
  # Otherwise, no rules will be generated, and only "customRules" below will apply
  autoGenerate: true

  # Default admission policy to apply: [accept | reject | scan-result]
  defaultPolicy: scan-result

  # What should we do if the Scan Result is not yet available (scan in progress): [accept | reject]
  reportPending: reject

  # What should we do if the Scan has failed (wrong credentials, misconfiguration, etc.): [accept | reject]
  scanFailed: reject

  # customPolicies:
  #   - prefix: "my.totally-trusted-registry.com/"
  #     action: accept
  #   - prefix: "bad-registry.com/specific-repo/"
  #     action: scan-result
  #   - prefix: "bad-registry.com/"
  #     action: reject
  #   - prefix: "malware-registry.io/"
  #     action: reject


  byNamespace: {}
  # byNamespace:
  #  ns-dev:
  #    # By default, images will be accepted in this NS regardless of the scan result
  #    defaultPolicy: accept
  #  ns-prod:
  #    # All images rejected by default in this namespace
  #    defaultPolicy: reject
  #    # Images from "my-trusted-registry.com/" will be always accepted
  #    customPolicies:
  #      - prefix: "my-trusted-registry.com/"
  #        action: accept
  #      - prefix: "docker.io/"
  #        action: scan-result
  #  ns-playground:
  #    defaultPolicy: accept
  #    customPolicies: []

```
The **sysdigSecureToken** value is mandatory, but if the defaults are acceptable for your usecase, all other settings are optional.

In this example values.yaml we accept all images by default in *preScanPolicies*, but we force images coming from docker.io/ in *ns-prod* namespace to be scanned. Then in *scanPolicies* we rely on the scan-result of the image to admit or deny the pod admission.

Once the values.yaml is ready, just create the namespace and deploy using Helm 3, adding the sysdiglabs Helm Chart repository.

```
$ kubectl create ns sysdig-admission-controller
$ helm repo add sysdiglabs https://sysdiglabs.github.io/charts/
$ helm install -n sysdig-admission-controller sysdig-admission-controller -f values.yaml sysdiglabs/sysdig-admission-controller --version 1.2.0
```

After a few seconds, this chart will deploy all the required components:
 * Register the aggregated API Service and admission controller webhook.
 * Admission Controller deployment and service.
 * Secure Token secret.
 * Required service account, TLS certificates, roles and permissions.
 * Configmaps, including *sysdig-admission-controller-policy* to store the policy configuration.

### Basic settings

The default settings in *values.yaml* should be right for most cases, but you must provide at minimum:

* **sysdigSecureToken** - The Sysdig Secure Token for your account
* **sysdigSecureApiUrl** - if the default SasS URL does not fit your environment (if using the on-prem version of Sysdig Secure

If you set the value **verboseLog** to *true*, the admission controller will include additional information in the output logs.

### Evaluation rules

The *values.yaml* includes a couple of sections that define the policies that apply when evaluating images.

#### preScanPolicies

This section defines the behavior (general, per namespace, or per registry/repository/tag) to apply to images before they are sent to the image scanner.

```yaml
preScanPolicies:

  autoGenerate: true

  defaultPolicy: scan

  customPolicies:
    - prefix: "some-registry.com/whitelistedrepo"
      action: accept
    - prefix: "bad-registry.com/"
      action: reject
    - prefix: "internal-registry.com/"
      action: check-scan

  byNamespace:
    playground:
      defaultPolicy: accept
      customPolicies: []
```

*autoGenerate* value must be *true*.

In this example we set the *defaultPolicy* to *scan*, so by default, in any namespace, images would be scanned. Then, for namespace *playground* we override the *defaultPolicy* to *accept* all images by default.

We also define a *customPolicies* list so for images prefixed with *some-registry.com/whitelistedrepo* we accept images without scanning them (this could be a trusted repository from an internal registry). But we also add *bad-registry.com/* to the custom policies so all images from this registry are rejected without being scanned, and for images from *internal-registry.com/*, we use the *check-scan* option that retrieves the result of a previous image scan, but doesn't trigger a new one.

For namespace *playground* we set *customPolicies* as an empty list. Otherwise the top-level *customPolicies* would apply instead, so we override this setting by defining it again in the namespace.

#### scanPolicies

The *scanPolicies* section defines the behavior for images being scanned (if they are not accepted/rejected in the pre-scan phase).

```yaml
scanPolicies:

  autoGenerate: true

  # Default admission policy to apply: [accept | reject | scan-result]
  defaultPolicy: scan-result
  # What should we do if the Scan Result is not yet available (scan in progress): [accept | reject]
  reportPending: reject
  # What should we do if the Scan has failed (wrong credentials, misconfiguration, etc.): [accept | reject]
  scanFailed: reject

  customPolicies:
    - prefix: "my-totally-trusted-registry.com/"
      action: accept
    - prefix: "bad-registry.com/"
      action: reject

  byNamespace:
    ns-prod:
      defaultPolicy: reject
      customPolicies:
      - prefix: "my-totally-trusted-registry.com/"
        action: accept
      - prefix: "docker.io/"
        action: scan-result
    ns-playground:
      defaultPolicy: accept
      customPolicies: []
```

*autoGenerate* value must be *true*.

Similar to the *preScanRules* section, we can define a general *defaultPolicy* behavior. **scan-result** in the example means that the decision will depend on the image scanning report result. We override this in the *ns-playground* namespace to always *accept* images (although they will be scanned, and the scan report could be *failed*), and then in *ns-prod* to *reject* by default.

We can also define *customPolicies* for specific registries, repositories and tags. In the example we always *accept* images coming from *my-totally-trusted-registry.com*, and we always *reject* images coming from *bad-registry.com/*. We override the behavior in *ns-playground* by defining an empty list of *customPolicies* (so **all** images are always accepted), and for *ns-prod* namespace we override the *customPolicies* to also force evaluation of the scan report for images coming from *docker.io/*.

### Changing settings after deploying with Helm

The *preScanPolicies* and *scanPolicies* values defined in the YAML files will be used by Helm templating system to create a ConfigMap named ***sysdig-admission-controller-policy***:

```yaml
apiVersion: v1
kind: ConfigMap
data:
  policy.json: |
    {
      "policies":
      {
        "autoGenerate": true,
        "byNamespace": {

...

        },
        "defaultPolicy": "scan-result",
        "reportPending": "reject",
        "scanFailed": "reject",
        "scanPolicyId": "policy_xxxx"
      },
      "preScanPolicies":
      {
        "autoGenerate": true,

...

        "defaultPolicy": "scan"
      }
    }
```

You can modify this ConfigMap and adjust the settings as you need, and the changes will be reflected after 1-2 minutes (https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#mounted-configmaps-are-updated-automatically).

## Evaluation engine

When a pod is created or updated, a new *AdmissionRequest* is analyzed by the admission controller.

The admission controller will evaluate the information and decide to admit or reject the pod in 3 phases: **pre-scan**, **metadata** and **scan** phase.

On each phase, it will evaluate a set of rules using the available context, and then make a decision.

The configuration from the ***sysdig-admission-controller-policy*** ConfigMap will modify the evaluation criteria.

### Evaluation phases

#### Pre-Scan phase

In this phase, the admission controller evaluates every container inside the pod, and takes on decision on the image:

* **accept**: Accept the image. No scan performed.
* **check-scan**: Take no admission decision yet. The pod progresses to the **scan phase**. But **don't trigger a scan** in Sysdig Secure. This means that if a report exists for that image, it will be recovered. In case the image was not analyzed previously (for example, when pushing the image to the registry, or in a CI/CD pipeline), it will be **evaluated as if the report were pending**.
* **scan**: Take no admission decision yet. The pod progresses to the **scan phase**. **Trigger a new scan**, so in case there was no previous analysis on this image, it requests a new one.
* **reject**: Reject the image. No scan performed.

Order is from less restrictive to most restrictive, and the most restrictive applies. For example:
 * If the admission controller rejects any container in the pod, it rejects the whole pod.
 * If any of the images evaluates to "scan", or "check-scan", the pod progresses to the **scan phase**.
 * Only if all images evaluate to **accept**, the admission controller accepts the pod and evaluation finishes here.

#### Metadata phase

For each container, if the *pre-scan* phase yields the **check-scan** result, and there are any metadata-rules defined (none by default), the admission controller evaluates this metadata-rules. The image information and scan status is available in the evaluation.

In most common use cases, this phase can be ignored.

#### Scan phase

In this phase, the admission controller evaluates the scan report for every container inside the pod. Then it makes a decision for each image. All the images for the containers in a pod need to be accepted for the pod to be accepted. Otherwise, the pod will be rejected.

Right before the scan phase:
* If the evaluated action was *scan* in the pre-scan phase, a new scan will be triggered in Sysdig Image Scanner.
* If action was *check-scan*, then the latest existing scan report will be retrieved, in case it exists. If no scan report exists for that image, it will be considered as "report pending".

For each container image composing the pod, the engine will evaluate the Rego rules, with the *scanPolicies* settings, the pod *AdmissionRequest* and the *scan report* .

* If any image is denied, then the Pod is **rejected** and the list of *reason*(s) is included in the reject message.
* Otherwise, the Pod is **accepted**

*Pod mutation*: The admission controller *modifies* the pod specification to replace the tag with the sha256 digest of the image, making sure that the tag cannot be altered to point to a different image.

### Evaluation policies configuration

#### *preScanPolicies* configuration (Pre-scan Phase)

Example:

```json
    {
      ...,
      "preScanPolicies":
      {
        "defaultPolicy": "scan",
        "customPolicies": [
          {
            "prefix": "some-registry.com/whitelistedrepo/",
            "action": "accept"
          },
          {
            "prefix": "bad-registry.com/",
            "action": "reject"
          }
        ],
        "byNamespace": {
          "playground": {
            "customPolicies": [],
            "defaultPolicy": "accept"
          }
        }
      }
    }
```

* **defaultPolicy**: The *defaultPolicy* top-level definition sets the default behavior for any container image that does not match any more specific rule. Possible values are:
  * **accept**: the image will be accepted
  * **reject**: the image will rejected
  * **scan**: the image will be evaluated in **Scan Phase**. A new scan will be triggered for the image.
  * **check-scan**: the image will be evaluated in **Scan Phase**, using the latest available report for that image, if it exists.
* **customPolicies**: The top-level *customPolicies* list sets specific behavior for images matching prefixes from the list. For each element in the list, the image name (composed of registry + repository:tag) is compared to the *prefix*. If the *prefix* matches the image (image name starts with this prefix), then the *action* is applied to that image, overriding the *defaultPolicy* action.
  * As *action* overrides the *defaultPolicy*, it can take the same values: **accept**, **reject** or **scan**.
  * If the image name does not match any element in the *customPolicies* list, the *defaultPolicy* will be applied.
  * In the example, images from *some-registry.com/whitelistedrepo/* will always be accepted, and images from *bad-registry.com/* will always be rejected. Other images would progress to **Scan phase**.
* **byNamespace**: The *byNamespace* dictionary might contain entries for namespaces that want to override the top-level policies. For each namespace, the *defaultPolicy* setting or the *customPolicies* list can be specified, overriding the top-level settings for images deployed in that namespace.
  * If no *defaultPolicy* is defined for a namespace, the top-level setting is used.
  * If no *customPolicies* is defined for a namespac, the top-level list applies. You can define an empty list, like in the example's namespace *playground*
  * In this example, for *playground* namespace all images would be accepted, and the top-level *customPolicies* would not apply inside that namespace.

⚠️ Please note that *customPolicies* have the highest priority. So, if a namespace defines a *defaultPolicy* but does not define *customPolicies*, then an image deployed in that namespace could match entries in the top-level *customPolicies* before the namespace *defaultPolicy* applies.

#### *policies* configuration (Scan Phase)

Example:

```json
    {
      "policies":
      {
        "defaultPolicy": "scan-result",
        "reportPending": "reject",
        "scanFailed": "reject",
        "customPolicies": [
          {
            "action": "accept",
            "prefix": "my-totally-trusted-registry.com/"
          },
          {
            "action": "reject",
            "prefix": "bad-registry.com/"
          }
        ],
        "byNamespace": {
          "ns-playground": {
            "customPolicies": [],
            "defaultPolicy": "accept"
          },
          "ns-prod": {
            "customPolicies": [
              {
                "action": "accept",
                "prefix": "my-totally-trusted-registry.com/"
              },
              {
                "action": "scan-result",
                "prefix": "docker.io/"
              }
            ],
            "defaultPolicy": "reject"
          }
        }
      },

      ...
    }
```

The settings for the Scan Phase are stored in the *policies* key inside the JSON, and are very similar to the *preScanPolicies* settings described in the previous section, so only the differences are described in here.

In the **Scan Phase** the scan report is retrieved (and optionally a new scan is triggered for the image).
It can happen that:
* The scan report is already available and ready to evaluate.
* The scan failed, because the image does not exist, the scanner does not have the required credentials, etc.
* The scan is not yet available (scan is in progress, or it does not exist and a new scan was not triggered).

So these conditions also impact the evaluation and must be considered in the settings:

* **defaultPolicy**: Possible values are:
  * **accept**: image will be accepted, despite the scanning result.
  * **reject**: image will rejected, despite the scanning result.
  * **scan-result**: image will be accepted or rejected depending on the scanning result from the scan report.
* **reportPending**: What to do if the report is not yet available:
  * **accept**: accept the image. Once the image is admited, the admission control won't be triggered again until the pod is recreated.
  * **reject**: reject the image (default if not specified).
* **scanFailed**: Behavior in case the scan failed (wrong credentials, wrong image, etc):
  * **accept**
  * **reject** (default if not specified).
* **customPolicies**: Same behavior as the *customPolicies* list for *preScanPolicies*, but the *action* key can take any of the following values, with same meaning as *defaultPolicy* values:
  * **accept**
  * **reject**
  * **scan-result**
* **byNamespace**: Same as *byNamespace* for *preScanPolicies*, overrides the top-level behavior for *defaultPolicy* *reportPending*, *scanFailed* or *customPolicies* for specific namespaces.

Same priority as *preScanPolicies* applies: Namespace *customPolicies* have the highest priority, followed by top-level *customPolicies*, then namespace *defaultPolicy* and finally top-level *defaultPolicy*.

⚠️ **IMPORTANT NOTE** ⚠️: If an image is rejected, the pod creation will fail and the corresponding Owner (Deployment, ReplicaSet, DaemonSet, etc.) will retry the creation, first after a few seconds, then slower, according to the exponential backoff retry mechanism. This means that, for example, pod creation could fail because the scan report is in progress, fail multiple times in a row, and then succeed a few minutes later, once the report is available and the exponential backoff mechanism retries the creation.

## Configuration examples

### Common use cases

#### Exclude a namespace

You can prevent the Sysdig Admission Controller to trigger for a namespace by including the label:

```
imagechecks.admission.sysdig.com/skip=true
````

you can add the label to the namespace by running:

```
kubectl label ns <namespace-name> imagechecks.admission.sysdig.com/skip=true
```

The namespace where you deploy the Sysdig Admission Controller gets this label added via the Helm chart pre-install hook. Otherwise, a reschedule of the admission controller pods could cause the webhook to fail, and prevent the pod to restart.

#### List of valid registries

* Specify a list of “valid” registries.
* Definition of “valid”: invalid registries will be DENIED always.
* “Valid” registries will be scanned
* Depending on the scan result, accept / reject image

⚠️ **Beware** ⚠️: you need to include per-namespace policies for *kube-system* or other critical namespaces.

```json
    {
      "preScanPolicies":
      {
        "defaultPolicy": "reject",
        "byNamespace": {
          "kube-system": {
            "customPolicies": [],
            "defaultPolicy": "accept"
          }
        },
        "customPolicies": [
          {
            "prefix": "valid-registry1.com/",
            "action": "scan"
          },
          {
            "prefix": "valid-registry2.com/",
            "action": "scan"
          }
        ],
      },
      "policies":
      {
        "defaultPolicy": "scan-result",
        "reportPending": "reject",
        "scanFailed": "reject"
      }
    }
```

#### Trigger scan, but always accept

All images should be accepted, but trigger a scan so you can configure alerts in the image scanner to detect vulnerabilities

```json
    {
      "preScanPolicies":
      {
        "defaultPolicy": "scan"
      },
      "policies":
      {
        "defaultPolicy": "accept"
      }
    }
```

#### Only accept already scanned and validated images

Images are scanned when they are pushed to the registry, so we just want to retrieve the existing scan report and accept the image if the report is "pass".

```json
    {
      "preScanPolicies":
      {
        "defaultPolicy": "check-scan"
      },
      "policies":
      {
        "defaultPolicy": "scan-result"
      }
    }
```

#### Image whitelisting

* Some images are critical and should be accepted (scan or not).
* Rest of images depend on the scan result.

⚠️ **Beware** ⚠️: you need to include per-namespace policies for *kube-system* or other critical namespaces.

```json
    {
      "preScanPolicies":
      {
        "defaultPolicy": "scan",
        "byNamespace": {
          "kube-system": {
            "customPolicies": [],
            "defaultPolicy": "accept"
          }
        },
        "customPolicies": [
          {
            "prefix": "docker.io/some-critical-image",
            "action": "accept"
          }
        ]
      },
      "policies":
      {
        "defaultPolicy": "scan-result",
        "reportPending": "reject",
        "scanFailed": "reject"
      }
    }
```

or alternatively, if you want to also trigger a scan for the "critical images", although they will always be accepted no matter the scan result:

```json
    {
      "preScanPolicies":
      {
        "defaultPolicy": "scan"
      },
      "policies":
      {
        "defaultPolicy": "scan-result",
        "reportPending": "reject",
        "scanFailed": "reject",
        "byNamespace": {
          "kube-system": {
            "customPolicies": [],
            "defaultPolicy": "accept"
          }
        },
        "customPolicies": [
          {
            "prefix": "docker.io/some-critical-image",
            "action": "accept"
          }
        ]
      }
    }
```
