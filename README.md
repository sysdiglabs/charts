# Sysdig Helm Charts

This GitHub repository is the official source for Sysdig's Helm charts.

For instructions about how to install charts from this repository, visit the public website at
**[https://charts.sysdig.com](https://charts.sysdig.com/)**

---

## Contribute

![contribute](https://user-images.githubusercontent.com/1073243/180266068-2695317f-5b05-4075-b432-6861330a5ef3.gif)


### Development

#### How to make changes to an existing chart without publishing

If you make changes to an existing chart, but do not change its version, nothing new will be published to the _charts repository_.

#### Add a new chart

To add a new chart, create a directory inside _charts_ with it contents at _main_ branch.

When you commit it, it will be picked up by the GitHub action, and if it contains a chart and version that doesn't already exist in the _charts repository_, a new release with the package for the chart will be published on the _GitHub repository_, and the list of all charts at `index.yaml` on _gh-pages_ branch will be updated on the _charts repository_.

Please remind to include the new chart also in `.github/workflows/helm-unit-test.yaml` and `.github/workflows/k8s-apis-deprecation.yml`.

#### Add tests

Currently, two types of tests are available:

- Chat unit testing, through the [helm-unittest/helm-unittest](https://github.com/helm-unittest/helm-unittest) helm plugin, more info are available in the [test cheatsheet](https://github.com/helm-unittest/helm-unittest/blob/main/DOCUMENT.md#test-job)
- Integration testing, through the [helm/chart-testing](https://github.com/helm/chart-testing/) tooling.

---

### Pull Requests

#### Comply with requirements

[Checklist to comply-with when doing the PR](./.github/PULL_REQUEST_TEMPLATE.md)

- Title of the PR starts with type and scope
  - In order to automatically generate a meaningful changelog PR titles must respect the following rules (the same title must be used when merging it)
  - A Type and Scope should always be present. check [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
    ex.:`feat(agent,node-analyzer,sysdig-deploy): add automated changelogs`
- Chart Version bumped
- Variables are documented in the `README.md` (or `README.tpl` in some charts)
- Check GithubAction checks (run pre-commit) to avoid merge-check stoppers
- Changelogs and Release Notes are automated based on the commit messages using git-chglog

#### Comply with GithubAction Checks

Several checks are tested before a PR is merged.
Make sure to fail-fast on your local, before committing, with [pre-commit](https://pre-commit.com/) plugin, configured in `/.pre-commit-config.yaml`, to automate this step, and validate/detect the issues when committing from your local.

Some current checks:
- `lint` checks, running
- `docs` autogeneration, based on `values.yaml`. this does only apply to charts with `README.tpl` templates (ex.: admission-controller)
- `unit-test`, which will call [unit-tets](#--add-tests)

---

### Changelog

#### Extended Changelog

If necessary it is possible to add extended details to a changelog entry by adding a special section in the commit body.

The custom section must start with `Extended Changelog:`, in order to instruct the rendering engine to stop and avoid capturing things like `Signed-off-by:` it is possible to add `@@__CHGLOG_DELIMITER__@@` at the end of the section.

Example with `Signed-off-by`
```
Extended Changelog: Fixed 21 CVEs in total, the ones with high or critical severity are:
            * CVE-2022-1941
            * CVE-2022-1996
@@__CHGLOG_DELIMITER__@@

Signed-off-by: someone@sysdig.com
```

> **_NOTE:_**  Do not add the delimiter `@@__CHGLOG_DELIMITER__@@` at the end of the commit body as it will cause an error.

Example without `Signed-off-by`
```
Extended Changelog: Fixed 21 CVEs in total, the ones with high or critical severity are:
            * CVE-2022-1941
            * CVE-2022-1996
```

> **_NOTE:_**  While merging a PR with _Squash & Merge_ the `Extended Changelog` section must be manually added to the body or the workflow won't be able to process it.

#### Manual Changelog

Although not usually recommended it is possible to manually add a changelog entry, the ci does a simple grep in the `CHANGELOG.md` file and if the version being released is already present it will skip adding a new entry.

### GithubPages / Documentation

https://charts.sysdig.com is managed through GithubPages action, `.github/workflows/release.yml` will merge each `charts/*/README.md` into the `gh-pages` branch.

---

### Release

#### Publishing a new version of a chart

> **TL;DR**: When a commit to main includes a new version of a _chart_, a GitHub action will make it available on the _charts repository_.

With each commit to _main_, a GitHub action will compare all charts versions at the `charts` folder on _main_ branch with published versions at the `index.yaml` chart list on _gh-pages_ branch.

When it detects that the version in the folder doesn't exist in  `index.yaml`, it will create a release with the packaged chart content on the _GitHub repository_, and update `index.yaml` to include it on the `charts repository`.

`index.yaml` is accesible from [https://sysdiglabs.github.io/charts/index.yaml]([https://sysdiglabs.github.io/charts/index.yaml) and is the list of all _charts_ and their _versions_ available when you interact with the _charts repository_ using Helm.

The packaged referenced in `index.yaml`, when it's updated using the GitHub action, will link for download to the URL provided by the _GitHub repository_ release files.

---

## More informations

You can find more information at:

- [charts.sysdig.com/](https://charts.sysdig.com/) / [sysdiglabs.github.io/charts](https://sysdiglabs.github.io/charts)
- [The Helm package manager](https://helm.sh/)
- [Chart Releaser](https://github.com/helm/chart-releaser)
- [Chart Releaser GitHub Action](https://github.com/helm/chart-releaser-action)
