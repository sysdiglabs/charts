---
title: Sysdig Helm Charts
description: The repository for Sysdig Helm charts.
---

## Install Sysdig Using Helm

Sysdig leverages the power of the Helm open-source package manager for Kubernetes applications. 

If you are installing, configuring, or upgrading Sysdig components on a Kubernetes environment, use the Helm charts in this repository. 

## Core Component Charts

To install the core components of Sysdig Monitor and Sysdig Secure, use the **sysdig-deploy** parent chart, which invokes a variety of child charts as needed. 

Additional Sysdig Secure components provide scanning for vulnerabilities in various parts of the environment and the CI/CD lifecycle.

| Parent Chart                                   | Subcharts                                              | Description                                                  |
| ---------------------------------------------- | :----------------------------------------------------- | ------------------------------------------------------------ |
| [`sysdig-deploy`](/charts/sysdig-deploy)       |                                                        | Installs, configures, and upgrades the Sysdig Agent and a variety of Sysdig Secure components. The parent chart deploys multiple child charts. |
|                                                | [`sysdig-agent`](/charts/agent)                        | Processes syscall events, metrics and creates capture files. It provides detailed visibility into container and host activity, helping to detect and prevent threats. |
|                                                | [`node-analyzer`](/charts/node-analyzer)               | The `node-analyzer` deploys the following as one daemonset in a cluster: <br>`host-scanner`<br>`runtime-scanner`<br>`kspm-analyzer` |
|                                                | [`kspm-collector`](/charts/kspm-collector)             | Collects Kubernetes resource manifests and sends them to be evaluated against Sysdig compliance policies. The scan results are displayed in Sysdig Secure [Compliance](https://docs.sysdig.com/en/compliance/) and [Inventory ](https://docs.sysdig.com/en/docs/sysdig-secure/inventory/)UI. |
|                                                | [`host-scanner`](/charts/node-analyzer)                | Scan [hosts](https://docs.sysdig.com/en/docs/sysdig-secure/vulnerabilities/runtime/host-scanning/) to identify and prioritize vulnerabilities with rich context. |
|                                                | [`runtime-scanner`](/charts/node-analyzer)             | Scan Kubernetes [workloads](https://docs.sysdig.com/en/docs/sysdig-secure/vulnerabilities/runtime/) in runtime to identify and prioritize vulnerabilities with rich context. |
|                                                | [`admission-controller`](/charts/admission-controller) | Intercept creation and modification of Kubernetes resources for auditing, and, for legacy scanning engine, allows blocking requests based on image vulnerabilities and misconfigurations. |
|                                                | [`rapid-response`](/charts/rapid-response)             | Allows designated advance users to investigate and troubleshoot events from a remote shell. |
| [`registry-scanner`](/charts/registry-scanner) |                                                        | Scan images in [container registries](https://docs.sysdig.com/en/docs/sysdig-secure/vulnerabilities/registry/) to identify and prioritize vulnerabilities with rich context. |
| [`cloud-connector`](/charts/cloud-connector)   |                                                        | Used only in special cases when the standard way of [connecting cloud accounts to Sysdig Secure](https://docs.sysdig.com/en/cloud-accounts-secure/) using Terraform or CloudFormation Templates will not work. <br/>Use this method only if recommended by your Sysdig account manager. |

## Legacy Charts

The following charts are kept in the repository for existing users but are in legacy status and are not recommended for fresh deployments.

| Charts                                                       | Description                                                  |
| :----------------------------------------------------------- | ------------------------------------------------------------ |
| [`sysdig`](/charts/sysdig)       |                                                        | Installs, configures, and upgrades the Sysdig Agent and a variety of Sysdig Secure components. |
| [`cloud-scanning`](/charts/tree/master/charts/cloud-scanning) | Deprecated. Deploys the Sysdig Cloud scanning on your Kubernetes cluster. |
| [`harbor-scanner-sysdig-secure`](/charts/harbor-scanner-sysdig-secure) | Deploys the Harbor Scanner Adapter to enable Harbor to use Sysdig Secure scanning engine to analyze the container images managed by the platform. |
| [`cloud-bench`]()                                            | Deprecated. Deploys the Sysdig Cloud Bench on your Kubernetes cluster. |
| [`sysdig-mcm-navmenu`](/charts/sysdig-mcm-navmenu)           | Deploys services and ingress required to create multi-cloud management menu in Sysdig. |
| [`sysdig-stackdriver-bridge`](/charts/sysdig-stackdriver-bridge) | Deploys the Sysdig Stackdriver Bridge application to read and send audit logs from Stackdriver to Sysdig Agent. |
