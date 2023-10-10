# Chart: Rapid Response

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v0.8.3
### Bug Fixes
* **common,agent,admission-controller,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [e76f1c17](https://github.com/sysdiglabs/charts/commit/e76f1c17e48491dd8ea21293ec1fed2619eed204): Update Sysdig CA ([#1393](https://github.com/sysdiglabs/charts/issues/1393))
# v0.8.2
### New Features
* **admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [32231059](https://github.com/sysdiglabs/charts/commit/322310597ffbf9e47b5755be8f2f65a6e68296a2): pass agent tags to kspm components ([#1333](https://github.com/sysdiglabs/charts/issues/1333))
# v0.8.1
### Documentation
* **admission-controller, cluster-scanner, registry-scanner, cloud-connector, node-analyzer, rapid-response, sysdig-deploy, agent** [df733e62](https://github.com/sysdiglabs/charts/commit/df733e6294eae1967197e3521473a5fab0282b67): update maintainers list ([#1283](https://github.com/sysdiglabs/charts/issues/1283))
# v0.8.0
### New Features
* **sysdig-agent,node-analyzer,kspm-collector,rapid-response,admission-controller** [2dca8e7c](https://github.com/sysdiglabs/charts/commit/2dca8e7c5308e76c2da63c974ae75c4ad510c201): Global Custom CA Bundle Support ([#961](https://github.com/sysdiglabs/charts/issues/961))
# v0.7.0
### New Features
* **agent,rapid-response** [13dc488a](https://github.com/sysdiglabs/charts/commit/13dc488a6c1cbbfda114f90deeef91a43572a54e): set metadata.namespace on all namespaced items ([#1259](https://github.com/sysdiglabs/charts/issues/1259))
# v0.6.3
# v0.6.2
# v0.6.1
### Bug Fixes
* **common** [0e37805f](https://github.com/sysdiglabs/charts/commit/0e37805f0190b74b53f7d9b47e5528009f58aa4b): add missing CHANGELOG file and bump version ([#1223](https://github.com/sysdiglabs/charts/issues/1223))
### New Features
* **admission-controller,agent,common,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [47483bc0](https://github.com/sysdiglabs/charts/commit/47483bc0d5f872bc6d406a48491ac930d1d75f8f): Improve region resolution in all charts ([#946](https://github.com/sysdiglabs/charts/issues/946))
# v0.5.1
### Documentation
* **rapid-response** [b0318af9](https://github.com/sysdiglabs/charts/commit/b0318af99efbc579d15cbe9a081f542255a47316): DOC-3216 - update for clarity and correctness ([#1173](https://github.com/sysdiglabs/charts/issues/1173))
# v0.5.0
### New Features
* **admission-controller,agent,cloud-bench,cloud-connector,cloud-scanning,harbor-scanner-sysdig-secure,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig,sysdig-deploy,sysdig-mcm-navmenu,sysdig-stackdriver-bridge** [5d99a03d](https://github.com/sysdiglabs/charts/commit/5d99a03dced132b4771dde1ce5b90b63c518b408): use a PGP private key to sign charts on release ([#1170](https://github.com/sysdiglabs/charts/issues/1170))
# v0.4.12
### New Features
* **adminssion-controller,agent,node-analyzer,kspm-collector,rapid-response** [33cad895](https://github.com/sysdiglabs/charts/commit/33cad8952395800e2e453de6bbf81851bfe1c608): pull policy and secrets params uniformity ([#1158](https://github.com/sysdiglabs/charts/issues/1158))
# v0.4.11
### Chores
* **rapid-response** [f7c1db0](https://github.com/sysdiglabs/charts/commit/f7c1db03523d4a99eca3a04a8ffcedec15dbfbf0): bump rapid-response version to 0.3.9 ([#1045](https://github.com/sysdiglabs/charts/issues/1045))
# v0.4.10
### Bug Fixes
* **admission-controller,agent,node-analyzer,rapid-response,registry-scanner,sysdig** [0bf9682](https://github.com/sysdiglabs/charts/commit/0bf96827ebf80d76aab61b8fa3d26b3903df220b): Improve KubeVersion Comparisons ([#1040](https://github.com/sysdiglabs/charts/issues/1040))
# v0.4.9
### Chores
* **admission-controller,agent,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig-deploy** [7f35eb1](https://github.com/sysdiglabs/charts/commit/7f35eb1f88d93fa59c2839e7fbb756e50a378bea): update helm unittest plugin ([#996](https://github.com/sysdiglabs/charts/issues/996))
# v0.4.8
### New Features
* **rapid-response** [d034b71](https://github.com/sysdiglabs/charts/commit/d034b710e27688c5f67fc441ee7b9af3e2f3cbdc): Add ServiceAccount and SecurityContextConstraint for Rapid Response ([#1006](https://github.com/sysdiglabs/charts/issues/1006))
# v0.4.7
# v0.4.6
### Bug Fixes
* **rapid-response** [afe34ab](https://github.com/sysdiglabs/charts/commit/afe34ab63ee778f2a10b1902cdfb8fccc00c6762): Set rapid-response node selector os and arch by k8s version ([#930](https://github.com/sysdiglabs/charts/issues/930))
# v0.4.5
### Bug Fixes
* **rapid-response** [ad996c4](https://github.com/sysdiglabs/charts/commit/ad996c432eca3c68ad41e2d41566c513919259db): update chart version ([#909](https://github.com/sysdiglabs/charts/issues/909))
## v0.4.5
### Minor changes
* bump image tag to 0.3.8
# v0.4.4
### New Features
* **rapid-response,sysdig-deploy** [6158dda](https://github.com/sysdiglabs/charts/commit/6158dda036e90e8493d002b3501479ade32b48c1): Verify that image.tag is a string ([#894](https://github.com/sysdiglabs/charts/issues/894))
# v0.4.3
### New Features
* **agent,node-analyzer,rapid-response** [487b421](https://github.com/sysdiglabs/charts/commit/487b421c922e097047e5ca65c01cee466664daba): add Rancher-specific tolerations ([#884](https://github.com/sysdiglabs/charts/issues/884))
# v0.4.2
### Documentation
* **rapid-response** [02e4b0e](https://github.com/sysdiglabs/charts/commit/02e4b0eefc19767ffc4bdfcaad6724a602c2ba37): Removed extra ']' ([#881](https://github.com/sysdiglabs/charts/issues/881))
# v0.4.1
### Documentation
* **rapid-response** [2056b2b](https://github.com/sysdiglabs/charts/commit/2056b2b7678d178c9adf04e138cdd44e1bd6af87): Added some examples ([#880](https://github.com/sysdiglabs/charts/issues/880))
# v0.4.0
### New Features
* **rapid-response** [eb1d4c8](https://github.com/sysdiglabs/charts/commit/eb1d4c8442834e99984e397e3f93caf641c88816): Introduced the possibility of specifying a Service Account ([#879](https://github.com/sysdiglabs/charts/issues/879))
# v0.3.6
### Documentation
* **rapid-response** [21d07d8](https://github.com/sysdiglabs/charts/commit/21d07d8c09b38f9033891ba1d02ce59ae5fde8e6): Updated Rapid Response ([#878](https://github.com/sysdiglabs/charts/issues/878))
# v0.3.5
### Documentation
* **rapid-response,sysdig-deploy** [9b7cb32](https://github.com/sysdiglabs/charts/commit/9b7cb32e2c51141d74a05f2aa9bfd03babb782c4): Updated rapid-response doc ([#865](https://github.com/sysdiglabs/charts/issues/865))
# v0.3.4
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))

## v0.3.3
### Minor changes
* Add deployment test to rapid response chart

## v0.3.2
### Minor changes
* Updated chart icon

## v0.3.1
### Minor changes
* Added `node-role.kubernetes.io/control-plane` toleration

## v0.3.0
### Major changes
* Added support to custom CA certificates
### Bugfix
* Fixed missing tolerations, this was preventing Rapid Response to be deployed on control plane nodes

## v0.2.10
### Minor changes
* Updated override helm tests to include extra testcases.

## v0.2.9
### Minor changes
* Readme changes to indicate helm unit testing.

## v0.2.8
### Minor changes
* Added golden template tests

## v0.2.7
### Minor changes
* Added unit tests for testing labels

## v0.2.6
### Minor changes
* bump image tag to 0.3.6

## v0.2.5
* Added unit tests to check local overrides of global values

## v0.2.4
### Minor changes
* bump image tag to 0.3.5

## v0.2.3
### Minor changes
* Add aroberts87 to chart maintainers

## v0.2.2
### Minor changes
* bump image tag to 0.3.4

## v0.2.1

### Minor changes

* Removed trailing spaces

## v0.2.0

### Major change

* Deprecated the usage of `skipTlsVerifyCertificate`, for enabling/disabling the certificate verification use `sslVerifyCertificate` instead
For compatibility purposes `skipTlsVerifyCertificate` is still available in this release

## v0.1.1

### Bugfix

* Fixed an issue that was causing k8s secrets to get generated with uppercase characters

## v0.1.0

### First release

* Deploy only Sysdig Rapid Response daemonset and associated resources
* Use global common values for access key
