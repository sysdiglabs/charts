# Chart: Admission Controller

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v0.14.12
### Bug Fixes
* **common,agent,admission-controller,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [e76f1c17](https://github.com/sysdiglabs/charts/commit/e76f1c17e48491dd8ea21293ec1fed2619eed204): Update Sysdig CA ([#1393](https://github.com/sysdiglabs/charts/issues/1393))
# v0.14.11
### Chores
* **admission-controller** [684e44a1](https://github.com/sysdiglabs/charts/commit/684e44a18df462051a9a81ba2cdfb421d31d20f7): Update to v3.9.33 ([#1390](https://github.com/sysdiglabs/charts/issues/1390))
# v0.14.10
### Chores
* **admission-controller** [f706afc4](https://github.com/sysdiglabs/charts/commit/f706afc47a69d3471845ca2edfecf455a1452696): Update to v3.9.32 ([#1386](https://github.com/sysdiglabs/charts/issues/1386))
# v0.14.9
### Bug Fixes
* **admission-controller** [4aa15cc1](https://github.com/sysdiglabs/charts/commit/4aa15cc1899ae29eb280e31fbeffa54c066d3937): not detecting events in its own namespace ([#1379](https://github.com/sysdiglabs/charts/issues/1379))
# v0.14.8
### Chores
* **admission-controller** [50008e85](https://github.com/sysdiglabs/charts/commit/50008e8588b48cda8353ca7e8e6c0622c5df0114): Update to version 3.9.31 ([#1375](https://github.com/sysdiglabs/charts/issues/1375))
# v0.14.7
### New Features
* **admission-controller** [c7db0f7d](https://github.com/sysdiglabs/charts/commit/c7db0f7dab2b6fe2984a4b02620069d94504edd8): add worker volume size limit as configurable parameter ([#1352](https://github.com/sysdiglabs/charts/issues/1352))
# v0.14.6
### Bug Fixes
* **admission-controller** [1a1fad6f](https://github.com/sysdiglabs/charts/commit/1a1fad6f3b3a996f1a1402d4347c1d4cfe99e4ff): admission controller read does not read global.sysdig.accessKeySecret ([#1359](https://github.com/sysdiglabs/charts/issues/1359))
# v0.14.5
# v0.14.4
### Code Refactoring
* **admission-controller** [f71bbde0](https://github.com/sysdiglabs/charts/commit/f71bbde0472b2143903e35500ffcab02fcd76937): set cache flush to 24h ([#1349](https://github.com/sysdiglabs/charts/issues/1349))
# v0.14.3
# v0.14.2
### New Features
* **admission-controller** [c36098f2](https://github.com/sysdiglabs/charts/commit/c36098f237678642533ab609ec114060521341c1): add workers memory limits [Internal] ([#1342](https://github.com/sysdiglabs/charts/issues/1342))
# v0.13.9
### New Features
* **admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [32231059](https://github.com/sysdiglabs/charts/commit/322310597ffbf9e47b5755be8f2f65a6e68296a2): pass agent tags to kspm components ([#1333](https://github.com/sysdiglabs/charts/issues/1333))
# v0.13.8
### New Features
* **admission-controller** [5a096d3b](https://github.com/sysdiglabs/charts/commit/5a096d3b025cff5bc14aac0d6abac540393749e4): support new env vars ([#1335](https://github.com/sysdiglabs/charts/issues/1335))
# v0.13.7
### Chores
* **admission-controller** [ee16dabf](https://github.com/sysdiglabs/charts/commit/ee16dabfdca8128699794e3a0028fc24c519e41d): bump version to v3.9.27 ([#1325](https://github.com/sysdiglabs/charts/issues/1325))
# v0.13.6
### Bug Fixes
* **admission-controller** [d25c4d71](https://github.com/sysdiglabs/charts/commit/d25c4d712a4a2b6839404368db67108113138245): Use EKS Terraform friendly ports ([#1315](https://github.com/sysdiglabs/charts/issues/1315))
# v0.13.5
### New Features
* **admission-controller** [08aacd04](https://github.com/sysdiglabs/charts/commit/08aacd04c4ad67baa5ab041bcae658e1a1173a3e): support policies for worker ([#1318](https://github.com/sysdiglabs/charts/issues/1318))
# v0.13.4
### New Features
* **admission-controller** [640fa2e8](https://github.com/sysdiglabs/charts/commit/640fa2e83bbb989eef40cc565555a0b5ff4c65dc): Add support for worker skiptls ([#1317](https://github.com/sysdiglabs/charts/issues/1317))
# v0.13.3
### New Features
* **admission-controller** [60074372](https://github.com/sysdiglabs/charts/commit/60074372b0970726b1fe100853be7d7ffb01bdef): add watch job permission ([#1312](https://github.com/sysdiglabs/charts/issues/1312))
# v0.13.2
### New Features
* **admission-controller** [36e87076](https://github.com/sysdiglabs/charts/commit/36e87076af520a0b6becfdf8eeff15b46bed6803): Add watch permission for AC ([#1303](https://github.com/sysdiglabs/charts/issues/1303))
# v0.13.1
### Bug Fixes
* **admission-controller** [616cad33](https://github.com/sysdiglabs/charts/commit/616cad33605006718b729187bbf621e5546d5fe1): Restore DRY_RUN env in config map, used by legacy AC ([#1304](https://github.com/sysdiglabs/charts/issues/1304))
# v0.13.0
### New Features
* **admission-controller** [b9ab5aee](https://github.com/sysdiglabs/charts/commit/b9ab5aee6521d95aaba8b004b17807c811117122): Add KSPM Admission Controller to helm chart ([#1214](https://github.com/sysdiglabs/charts/issues/1214))
# v0.12.4
### New Features
* **admission-controller** [ffa2c439](https://github.com/sysdiglabs/charts/commit/ffa2c439bd0a1a76443dc41439f048a2fc41e016): internal test ([#1297](https://github.com/sysdiglabs/charts/issues/1297))
# v0.12.3
### Documentation
* **admission-controller, cluster-scanner, registry-scanner, cloud-connector, node-analyzer, rapid-response, sysdig-deploy, agent** [df733e62](https://github.com/sysdiglabs/charts/commit/df733e6294eae1967197e3521473a5fab0282b67): update maintainers list ([#1283](https://github.com/sysdiglabs/charts/issues/1283))
# v0.12.2
### New Features
* **admission-controller docs** [85b74e1a](https://github.com/sysdiglabs/charts/commit/85b74e1a2eace0a37b0cb24a671821c8e43cd450): Edit chart for clarity, consistency and correctness  ([#1206](https://github.com/sysdiglabs/charts/issues/1206))
# v0.12.1
### Bug Fixes
* **admission-controller,agent,sysdig-deploy** [bdf6c21f](https://github.com/sysdiglabs/charts/commit/bdf6c21f6322aaa8417fe8a763f01f5127601094): fix incompatibility errors on older helm versions ([#1281](https://github.com/sysdiglabs/charts/issues/1281))
# v0.12.0
### New Features
* **sysdig-agent,node-analyzer,kspm-collector,rapid-response,admission-controller** [2dca8e7c](https://github.com/sysdiglabs/charts/commit/2dca8e7c5308e76c2da63c974ae75c4ad510c201): Global Custom CA Bundle Support ([#961](https://github.com/sysdiglabs/charts/issues/961))
# v0.11.9
### New Features
* **admission-controller** [3d4304d0](https://github.com/sysdiglabs/charts/commit/3d4304d03483f23371f74541102b4cf1036bdfc0): update README with latest CA certificate changes ([#1263](https://github.com/sysdiglabs/charts/issues/1263))
# v0.11.8
* feat: change format publishing scanning events and fix bug using quick filters in the UI.

# v0.11.7
* feat: fix rules provider processing customer appends when there is no base rule.

# v0.11.5
### New Features
* **admission-controller** [346004b2](https://github.com/sysdiglabs/charts/commit/346004b28dbbc426df63f92835cac23205cee3d6): simplify CA and certificate options ([#1246](https://github.com/sysdiglabs/charts/issues/1246))

# v0.11.4
### New Features
* **admission-controller** [03f5b13a](https://github.com/sysdiglabs/charts/commit/03f5b13a47cd4f57a938daf1a2cd4aeb671251d1): Add labels to VAC webhook to adopt existing one ([#1238](https://github.com/sysdiglabs/charts/issues/1238))

# v0.11.3
* feat: remove workload name from scanning secure events for both dry run and real secure events

# v0.11.2
### Bug Fixes
* **admission-controller** [d03dc2ce](https://github.com/sysdiglabs/charts/commit/d03dc2ce1d7056304b7a1f803bb1dd92e4feb9d4): Make ValidatingWebhookConfiguration part of the resource lifecycle ([#1217](https://github.com/sysdiglabs/charts/issues/1217))

# v0.11.1
### Bug Fixes
* **common** [0e37805f](https://github.com/sysdiglabs/charts/commit/0e37805f0190b74b53f7d9b47e5528009f58aa4b): add missing CHANGELOG file and bump version ([#1223](https://github.com/sysdiglabs/charts/issues/1223))
### New Features
* **admission-controller,agent,common,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [47483bc0](https://github.com/sysdiglabs/charts/commit/47483bc0d5f872bc6d406a48491ac930d1d75f8f): Improve region resolution in all charts ([#946](https://github.com/sysdiglabs/charts/issues/946))

# v0.10.0
### New Features
* **admission-controller, sysdig-deploy** [120a3676](https://github.com/sysdiglabs/charts/commit/120a3676b81af7c22e21517ddca3be6039b7aa6c): Add logic to toggle enable/disable HPA and set replica count based on that value. ([#1204](https://github.com/sysdiglabs/charts/issues/1204))
# v0.9.0
### New Features
* **admission-controller,agent,cloud-bench,cloud-connector,cloud-scanning,harbor-scanner-sysdig-secure,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig,sysdig-deploy,sysdig-mcm-navmenu,sysdig-stackdriver-bridge** [5d99a03d](https://github.com/sysdiglabs/charts/commit/5d99a03dced132b4771dde1ce5b90b63c518b408): use a PGP private key to sign charts on release ([#1170](https://github.com/sysdiglabs/charts/issues/1170))
# v0.8.6
* feat: remove workload name from sysdig admission controller scanning event title

# v0.8.5
### New Features
* **adminssion-controller,agent,node-analyzer,kspm-collector,rapid-response** [33cad895](https://github.com/sysdiglabs/charts/commit/33cad8952395800e2e453de6bbf81851bfe1c608): pull policy and secrets params uniformity ([#1158](https://github.com/sysdiglabs/charts/issues/1158))

# v0.8.4
* fix prometheus.io/port annotation in webhook pod

# v0.8.3
* fix for "unable to create new engine due to append rule definitions error"

# v0.8.2
* fix: CVE-2023-2253
* chore(internal): filter out non-related rules files from policies response

# v0.8.1
### Chores
* **admission-controller** include fix for high severity vulnerability Go package github.com/docker/docker CVE-2023-28840
# v0.8.0
### New Features
* **admission-controller** [ba5c9103](https://github.com/sysdiglabs/charts/commit/ba5c91037bbf06470c2e03c69d0bba33518fc3c4): Deprecate sysdig.url (keep for compatibility) and use apiEndpoint instead ([#1118](https://github.com/sysdiglabs/charts/issues/1118))
# v0.7.28
### Bug Fixes
* **admission-controller,agent,node-analyzer,rapid-response,registry-scanner,sysdig** [0bf9682](https://github.com/sysdiglabs/charts/commit/0bf96827ebf80d76aab61b8fa3d26b3903df220b): Improve KubeVersion Comparisons ([#1040](https://github.com/sysdiglabs/charts/issues/1040))
# v0.7.27
### Chores
* **admission-controller,agent,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig-deploy** [7f35eb1](https://github.com/sysdiglabs/charts/commit/7f35eb1f88d93fa59c2839e7fbb756e50a378bea): update helm unittest plugin ([#996](https://github.com/sysdiglabs/charts/issues/996))
# v0.7.26
### Chores
* **admission-controller** [af8be4e](https://github.com/sysdiglabs/charts/commit/af8be4e6857a505c6e17739c390e5943f2bab751): Update to v3.9.17 ([#1014](https://github.com/sysdiglabs/charts/issues/1014))
# v0.7.25
# v0.7.24
### Documentation
* **admission-controller** [6271999](https://github.com/sysdiglabs/charts/commit/6271999eafafeff122bd8ada7483d098376e11b0): troubleshoot sourceIp support ([#885](https://github.com/sysdiglabs/charts/issues/885))
# v0.7.23
* Bump admission-controler to 3.9.16.
  * fix: remove unnecessary patch call to onboarding
  * chore: change customer ID endpoint due to its deprecation

# v0.7.22
### Bug Fixes
* **admission-controller,sydig-deploy** [7693f02](https://github.com/sysdiglabs/charts/commit/7693f025c4493e22de6caddbfff6c077198a24aa): fix priorityClassName in wrong scope for scanner deployment ([#882](https://github.com/sysdiglabs/charts/issues/882))
# v0.7.21
### Bug Fixes
* **admission-controller,sysdig-deploy** [369665e](https://github.com/sysdiglabs/charts/commit/369665e8c9075c3847583b1d55d6d66ab60a3f92): fix missing namespace declarations in secrets ([#874](https://github.com/sysdiglabs/charts/issues/874))
# v0.7.20
### Chores
* **sysdig-deploy, admission-controller** [73427aa](https://github.com/sysdiglabs/charts/commit/73427aa186cfeaa2d03ed8faa7ab97f32303ff1e): scan service image version bump ([#829](https://github.com/sysdiglabs/charts/issues/829))
# v0.7.19
### New Features
* **admission-controller** [a0949f3](https://github.com/sysdiglabs/charts/commit/a0949f335d2735c0a646041adab3dbb3e46f1e51): Reuse TLS secret on upgrade ([#808](https://github.com/sysdiglabs/charts/issues/808))
# v0.7.18
### New Features
* **admission-controller** [[c91349e](https://github.com/sysdiglabs/charts/commit/c91349e46428f4f615808a83c3c2ebcb5221a6b2)]: Update AC to 3.9.15 ([#802](https://github.com/sysdiglabs/charts/issues/802))
# v0.7.17
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))

## v0.7.16
### Minor changes
* `priorityClassName` is optional for scanner and webhook deployments

## v0.7.15
### Minor changes
* Bump inline scan service image version bump

## v0.7.14
### Minor changes
* Updated chart icon

## v0.7.13
### Minor changes
* Updated override helm tests to include extra testcases.

## v0.7.12
### Minor changes
* Readme changes to indicate helm unit testing.

## v0.7.11
### Minor changes
* Added golden template tests

## v0.7.10
### Minor changes
* Added unit tests to check conditional flag testing

## v0.7.9
### Minor changes
* Added unit tests for testing labels

## v0.7.8
### Minor changes
* Add option to specify additional labels

## v0.7.5
### Minor changes
* Add support for building Sysdig Secure URL from global region value

## v0.7.4
### Minor changes
* Added unit tests to check local overrides of global values

## v0.7.2
### Minor changes
* Add proper validation check for Secure API Token

## v0.7.1
### Minor changes
* Fix bug while using secureAPITokenSecret, removed hard requirement for secureAPIToken

## v0.7.0
### Major changes

* Add support for global values, allows admission-controller to be used as dependency of the sysdig-deploy chart
* Add namespace field to all resources

## v0.6.24

### Minor changes

* Added RBAC enable/disable flag
