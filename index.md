---
title: Sysdig Helm Charts
description: Repository for Sysdig's Helm charts.
---

Helm is an open-source package manager for Kubernetes applications. Using a helm chart you can describe, install, configure, and upgrade applications automatically.

To simplify your deployment experience, Sysdig provides helm charts to install and configure Sysdig installation components in your Kubernetes environment.


## Sysdig Chart Repository

The Sysdig Chart Repository includes the following charts:

| Charts          | Description |
| :---------------| ----------- |
|[`sysdig-deploy`](/charts/sysdig-deploy)    | Deploys the following components in your Kubernetes cluster:<br>`kspm-collector`:  Enables collecting and sendin Kubernetes resource manifests to be evaluated against compliance policies. The scan results are displayed by Sysdig Secure's Actionable Compliance.<br>`node-analyzer`: Enables  Image Analyzer, Benchmarks, and Host Scanning features.<br>`rapid-response`:  Allows designated advance users to investigate and troubleshoot events from a remote shell.<br>`agent`: Processes syscall events and metrics, creates [capture](https://docs.sysdig.com/en/docs/sysdig-secure/investigate/captures/#captures) files, and performs auditing and compliance. |
|[`admission-controller`](/charts/admission-controller) | Deploys the [Sysdig Admission Controller](https://docs.sysdig.com/en/docs/sysdig-secure/scanning/admission-controller/) in your Kubernetes cluster to enable image scanning and audit logging. |
|[`cloud-connector`](/charts/cloud-connector) | Deploys the [Sysdig Cloud Connector](https://docs.sysdig.com/en/docs/installation/sysdig-secure-for-cloud/) in your Kubernetes cluster to enable threat-detection and image scanning. |
|[`harbor-scanner-sysdig-secure`](/charts/harbor-scanner-sysdig-secure) | Deploys the Harbor Scanner Adapter to enable Harbor to use Sysdig Secure scanning engine to analyze the container images managed by the platform. |
|[`registry-scanner`](/charts/registry-scanner) | Deploys the Sysdig Registry Scanner as a scheduled cronjob in your Kubernetes cluster. |
|[`sysdig-mcm-navmenu`](/charts/sysdig-mcm-navmenu) | Deploys services and ingress required to create Multi-Cloud Management menu in Sysdig. |
|[`sysdig-stackdriver-bridge`](/charts/sysdig-stackdriver-bridge) | Deploys the the Sysdig Stackdriver Bridge application to enable reading and sending audit logs from Stackdriver to Sysdig agent. |


## Add Sysdig Chart Repository 

To start using Sysdig charts, add the Sysdig chart repository to your local helm :

```bash
# Add sysdig charts to helm
$ helm repo add sysdig https://charts.sysdig.com

# Update list of charts from all registered charts repositories
$ helm repo update
```

## Use Sysdig Chart Repository

Once you have added the chart repository to your local `helm`, you can start using it:

```bash
# List all charts:
$ helm search repo sysdig
```

Continue with installing the desired components given in [Sysdig Chart Repository](#sysdig-chart-repository).
