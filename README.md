# Sysdig Helm Charts

This GitHub repository is the official source for Sysdig's Helm charts.

For instructions about how to install charts from this repository, visit the public website at:
[sysdiglabs.github.io/charts](https://sysdiglabs.github.io/charts) 

## Make changes to an existing chart without publishing

If you make changes to an existing chart, but do not change its version, nothing new will be published to the _charts repository_.

## Publishing a new version of a chart

When a commit to master includes a new version of a _chart_, a GitHub action will make it available on the _charts repository_.

### Detailed explanation of publish procedure

With each commit to _master_, a GitHub action will compare all charts versions at the `charts` folder on _master_ branch with published versions at the `index.yml` chart list on _gh-pages_ branch. 

When it detects that the version in the folder doesn't exist in  `index.yml`, it will create a release with the packaged chart content on the _GitHub repository_, and update `index.yml` to include it on the `charts repository`.

`index.yml` is accesible from [sysdiglabs.github.io/charts/index.yml] and is the list of all _charts_ and their _versions_ available when you interact with the _charts repository_ using Helm.

The packaged referenced in `index.yml`, when it's updated using the GitHub action, will link for download to the URL provided by the _GitHub repository_ release files.


## Add a new chart

To add a new chart, create a directory inside _charts_ with it contents at _master_ branch.

Whe you commit it, it will be picked up by the GitHub action, and if it contains a chart and version that doesn't already exist in the _charts repository_, a new release with the package for the chart will be published on the _GitHub repository_,
and the list of all charts at `index.yml` on _gh-pages_ branch will be updated on the _charts repository_.


## More information

You can find more information at:
* [sysdiglabs.github.io/charts](https://sysdiglabs.github.io/charts) 
* [The Helm package manager](https://helm.sh/)
* [Chart Releaser](https://github.com/helm/chart-releaser)
* [Chart Releaser GitHub Action](https://github.com/helm/chart-releaser-action)
---

![Sysdig logo](./assets/img/sysdig-logo-220.png)