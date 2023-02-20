# Chart: KSPM Collector

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v0.1.37
### Bug Fixes
* Fix AKS platform identification
# v0.1.36
### New Features
* **kspm-analyzer, kspm-collector** [dedebca](https://github.com/sysdiglabs/charts/commit/dedebca2a44e00828d80379c00cafbb50d90db8d): OCP4 support ([#915](https://github.com/sysdiglabs/charts/issues/915))
# v0.1.35
### New Features
* **kspm-collector** [d1328c0](https://github.com/sysdiglabs/charts/commit/d1328c02976901a64d91f4e86a2a26035045496c): bumped KSPM Collector to latest version ([#921](https://github.com/sysdiglabs/charts/issues/921))
# v0.1.34
### Bug Fixes
* **node-analyzer,kspm-collector** [59543e8](https://github.com/sysdiglabs/charts/commit/59543e8da45e1e61f21b2489500fe5452906bca0): Fix security context permission for KSPM components ([#907](https://github.com/sysdiglabs/charts/issues/907))
# v0.1.33
### New Features
* **kspm-collector** [faf65fa](https://github.com/sysdiglabs/charts/commit/faf65fa003469a6ed99ae4d97aaef040cbfa6d0b): Custom tolerations and nodeSelector ([#912](https://github.com/sysdiglabs/charts/issues/912))
# v0.1.32
### Minor changes
* Allow to configure liveness and readiness probes
# v0.1.31
### Bug Fixes
* **kspm-collector** [a7aea8a](https://github.com/sysdiglabs/charts/commit/a7aea8af8469a0b2bda6230cfa11f1debbbf9a05): CVE-2022-32149 ([#834](https://github.com/sysdiglabs/charts/issues/834))
# v0.1.30
### Bug Fixes
* **kspm-collector** [c321da9](https://github.com/sysdiglabs/charts/commit/c321da920147c9182cc69cebb33e91d0258746f0): longer initial delay on collector startup probe ([#826](https://github.com/sysdiglabs/charts/issues/826))
# v0.1.29
### Bug Fixes
* **kspm-collector** [[7c70012](https://github.com/sysdiglabs/charts/commit/7c700124693d3e143eac25fbc3c6b93c01ab5ba3)]: Fix numeric port on configmap

# v0.1.28
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))

# v0.1.27
### Minor changes
* Bumped image tag to 1.15.0

# v0.1.26
### Minor changes
* Add deployment test to kspm collector chart

# v0.1.25
### Minor changes
* Updated chart icon

# v0.1.24
### Minor changes
* Updated override helm tests to include extra testcases.

# v0.1.23
### Minor changes
* Readme small fix to helm unit test command

# v0.1.22
### Minor changes
* Readme changes to indicate helm unit testing.

# v0.1.21
### Minor changes
* Added golden template tests

# v0.1.20
### Minor changes
* Added unit tests to check conditional flag testing

# v0.1.19
### Minor changes
* Added unit tests for testing labels

# v0.1.18
### Minor changes
* Bumped image tag to 1.14.0

# v0.1.17
### Minor changes
* Added unit tests to check local overrides of global values

# v0.1.16
### Minor changes:
* KSPMCollector:
    * Added liveliness and readiness probes.
    * All capabilities are now dropped.
    * Pod will not run with root privileges.
    * Bumped image tag to 1.13.0

# v0.1.15
### Feature
* Add imagePullSecret flag for kspm-collector

# v0.1.14
### Minor chagnes
* Bumped image tag to 1.11.0

# v0.1.13
### Bugfixes
* Fix labels indentation

# v0.1.12
### Minor chagnes
* Bumped image tag to 1.9.0

# v0.1.11
### Minor changes
* Removed trailing spaces

# v0.1.10
### Minor change
* Improving nats_insecure conditional logic

# v0.1.9
### Minor change
* Bumped image tag to 1.8.0

# v0.1.8
### Bugfixes
* Bumped image tag to 1.7.0

# v0.1.7
### Minor change
* Support the arm64 architecture

# v0.1.6
### Minor change
* Support HTTP proxy

# v0.1.5
### Bugfixes
* Removed duplicate labels from deployment of `app.kubernetes.io/instance`

# v0.1.4
### Bugfixes
* Bumped image tag to 1.5.0

# v0.1.3
### Bugfixes
* Remove duplicated apiVersion

# v0.1.2
### Bugfixes
* Fix kspm-collector access key env

# v0.1.1
### Minor change
* KSPM Chart components - fix KSPM serviceAccount that is created when KSPM not installed

# v0.1.0

### Major change
* Rename cspm-collector to kspm-collector

### Minor change
* Update image tag to 1.4.0

# v0.0.4

* Handle failure on apis discovery

## v0.0.2

* CSPM support AKS

## v0.0.1

Initial release
