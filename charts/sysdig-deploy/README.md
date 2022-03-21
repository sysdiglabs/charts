# Sysdig

---
**WARNING**

This chart is still experimental and may have issues! Please use the [supported chart](https://github.com/sysdiglabs/charts/tree/master/charts/sysdig) for production deployments.

---

[Sysdig](https://sysdig.com/) is a unified platform for container and microservices monitoring, troubleshooting,
security and forensics. Sysdig platform has been built on top of [Sysdig tool](https://sysdig.com/opensource/sysdig/)
and [Sysdig Inspect](https://sysdig.com/blog/sysdig-inspect/) open-source technologies.

## Introduction

This chart deploys various Sysdig components into your Kubernetes cluster.

Currently included components:
- [Sysdig agent](https://github.com/sysdiglabs/charts/tree/master/charts/agent)

## Configuration

| Parameter                       | Description                                                       | Default   |
|---------------------------------|-------------------------------------------------------------------|-----------|
| `global.clusterConfig.name`     | Identifier for this cluster                                       | `""`      |
| `global.sysdig.accessKey`       | Sysdig Agent Access Key                                           | `""`      |
| `global.sysdig.accessKeySecret` | The name of a Kubernetes secret containing an 'access-key' entry. | `""`      |
| `global.image.registry`         | Container image registry                                          | `quay.io` |
| `agent`                         | Config specific to the Sysdig Agent                               | ``        |
| `agent.enabled`                 | Enable the agent component in this chart                          | `true`    |

For possible configuration values of the Agent, please refer to the Agent chart [README](https://github.com/sysdiglabs/charts/tree/master/charts/agent/README.md)
