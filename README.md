# Sysdig Helm Charts

This website is the official source for Sysdig's Helm charts.

## Add this charts repository to your local Helm

To start using our charts, first add this charts repository using the `helm` command line tool:

```bash
# Add sysdiglab charts to helm
helm repo add sysdiglabs https://sysdiglabs.github.io/charts
```
## Use this charts repository

Then you can start using it:

```bash
# List all charts:
helm search repo sysdiglabs

# Install Sysdig agent from the online charts repository with default settings using:
helm install sysdig-agent --set sysdig.accessKey=YOUR-KEY-HERE sysdiglabs/sysdig
```

## Hosted charts in this repository

See specific information about each chart with these links
* [Sysdig agent](./charts/sysdig/README.md)


## More information

You can find more information at:
* [sysdig.com](https://sysdig.com/)
* [Sysdig documentation](https://docs.sysdig.com/)
* [The Helm package manager](https://helm.sh/)