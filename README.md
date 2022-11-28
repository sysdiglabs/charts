# Sysdig Helm Charts

This GitHub repository is the official source for Sysdig's Helm charts.

 For instructions about how to install charts from this repository, visit the public website at
**[https://charts.sysdig.com](https://charts.sysdig.com/)**

<br/><br/>

## Contribute

![contribute](https://user-images.githubusercontent.com/1073243/180266068-2695317f-5b05-4075-b432-6861330a5ef3.gif)

### Development

#### - Make changes to an existing chart without publishing

If you make changes to an existing chart, but do not change its version, nothing new will be published to the _charts repository_.
<br/><br/>

### Pull Requests

[Checklist to comply-with when doing the PR](./.github/PULL_REQUEST_TEMPLATE.md)

- Title of the PR starts with type and scope, for more details check [Commit and PR tile guidelines](#commit-and-pr-tile-guidelines)
- Chart Version bumped
- Variables are documented in the README.md (or README.tpl in some charts)
- Check GithubAction checks (like lint) to avoid merge-check stoppers
- Changelogs and Release Notes are automated based on the commit messages using git-chglog

#### Commit and PR tile guidelines
In order to automatically generate a meaningful changelog PR titles must respect the following rules (the same title must be used when merging it)

A Type must be specified, avalilable types are:
- feat
- new
- fix
- perf
- refactor
- chore
- docs

A Scope should be always present, a few examples:
- (agent)
- (sysdig-deploy)
- (agent,node-analyzer,sysdig-deploy)

Full PR title example
`feat(agent,node-analyzer,sysdig-deploy): add automated changelogs`


#### - GithubAction Checks

Make sure to comply with

- `lint` checks, running
    > $ make lint
- `docs` autogeneration, based on `values.yaml`. this does only apply to charts with `README.tpl` templates (ex.: admission-controller)
   > $ make docs


To do this automatically, you can install [pre-commit](https://pre-commit.com/) plugin, configured in `/.pre-commit-config.yaml`, to automate this step, and validate/detect the issues when committing from your local.


### GithubPages / Documentation

https://charts.sysdig.com is managed through GithubPages action.
`.github/workflows/release.yml` will merge each `charts/*/README.md` into the `gh-pages` branch.


#### - Add a new chart

To add a new chart, create a directory inside _charts_ with it contents at _master_ branch.

When you commit it, it will be picked up by the GitHub action, and if it contains a chart and version that doesn't already exist in the _charts repository_, a new release with the package for the chart will be published on the _GitHub repository_,
and the list of all charts at `index.yaml` on _gh-pages_ branch will be updated on the _charts repository_.
<br/><br/>

### Release

#### - Publishing a new version of a chart

> TL;DR
> <br/>When a commit to master includes a new version of a _chart_, a GitHub action will make it available on the _charts repository_.

With each commit to _master_, a GitHub action will compare all charts versions at the `charts` folder on _master_ branch with published versions at the `index.yaml` chart list on _gh-pages_ branch.

When it detects that the version in the folder doesn't exist in  `index.yaml`, it will create a release with the packaged chart content on the _GitHub repository_, and update `index.yaml` to include it on the `charts repository`.

`index.yaml` is accesible from [https://sysdiglabs.github.io/charts/index.yaml]([https://sysdiglabs.github.io/charts/index.yaml) and is the list of all _charts_ and their _versions_ available when you interact with the _charts repository_ using Helm.

The packaged referenced in `index.yaml`, when it's updated using the GitHub action, will link for download to the URL provided by the _GitHub repository_ release files.
<br/><br/>

## More information

You can find more information at:
* [charts.sysdig.com/](https://charts.sysdig.com/) / [sysdiglabs.github.io/charts](https://sysdiglabs.github.io/charts)
* [The Helm package manager](https://helm.sh/)
* [Chart Releaser](https://github.com/helm/chart-releaser)
* [Chart Releaser GitHub Action](https://github.com/helm/chart-releaser-action)
