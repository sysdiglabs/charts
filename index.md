---
title: Sysdig Helm Charts
description: Repository for Sysdig's Helm charts.
---

## Add this charts repository to your local Helm

To start using our charts, first add this _charts repository_ using the `helm` command line tool:

```bash
# Add sysdiglab charts to helm
$ helm repo add sysdig https://charts.sysdig.com

# Update list of charts from all registered charts repositories
$ helm repo update
```

## Use this charts repository

Once you have added this _charts repository_ to your local `helm`, you can start using it:

```bash
# List all charts:
$ helm search repo sysdig

# Install Sysdig agent from the online charts repository with default settings using:
$ helm install sysdig-agent --set sysdig.accessKey=YOUR-KEY-HERE sysdig/sysdig
```

## Hosted charts in this repository

See specific information about each _chart_ at the GitHub repository:
* [https://github.com/sysdiglabs/charts/tree/master/charts](https://github.com/sysdiglabs/charts/tree/master/charts)
