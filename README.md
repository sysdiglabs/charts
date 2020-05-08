# Sysdig Helm Charts

[This website](https://sysdiglabs.github.io/charts) is the official source for Sysdig's Helm charts.


## Add this charts repository to your local Helm

To start using our charts, first add this _charts repository_ using the `helm` command line tool:

```bash
# Add sysdiglab charts to helm
helm repo add sysdiglabs https://sysdiglabs.github.io/charts

# Update list of charts from all registered charts repositories
helm repo update
```


## Use this charts repository

Once you have added this _charts repository_ to your local `helm`, you can start using it:

```bash
# List all charts:
helm search repo sysdiglabs

# Install Sysdig agent from the online charts repository with default settings using:
helm install sysdig-agent --set sysdig.accessKey=YOUR-KEY-HERE sysdiglabs/sysdig
```


## Hosted charts in this repository

See specific information about each _chart_ with these links
* [Chart: Sysdig agent](./charts/sysdig/README.md)


## More information

You can find more information about our software at:
* [sysdig.com](https://sysdig.com/), main Sysdig website
* [Sysdig documentation hub](https://docs.sysdig.com/)
* [Start a free Sysdig trial](https://sysdig.com/company/free-trial/)

For general information about Helm charts, visit:
* [The Helm package manager](https://helm.sh/)

---

![Sysdig logo](./assets/img/sysdig-logo-220.png)