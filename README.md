# Sysdig Helm Charts

This website is the official source for Sysdig's Helm charts.


## Add this charts repository to your local Helm

To start using our charts, first add this _charts repository_ using the `helm` command line tool:

```bash
# Add sysdiglab charts to helm
helm repo add sysdiglabs https://sysdiglabs.github.io/charts
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
* [Sysdig agent](./charts/sysdig/README.md)


## More information

You can find more information about our software at:
* [sysdig.com](https://sysdig.com/)
* [Sysdig documentation](https://docs.sysdig.com/)

For general information about Helm charts, visit:
* [The Helm package manager](https://helm.sh/)