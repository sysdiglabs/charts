# Chart: Admission Controller

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v0.16.6
### Chores
* **admission-controller** [cb767c33](https://github.com/sysdiglabs/charts/commit/cb767c33699478121191eb221fe3a451706f41c1): Update to v3.9.47 ([#1866](https://github.com/sysdiglabs/charts/issues/1866))
# v0.16.5
### Bug Fixes
* **admission-controller** [c39e2b78](https://github.com/sysdiglabs/charts/commit/c39e2b78f5cd376a618991f835134de965a6b682): Fix proxy dns resolution ([#1885](https://github.com/sysdiglabs/charts/issues/1885))
# v0.16.4
### New Features
* **common,admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [07abc204](https://github.com/sysdiglabs/charts/commit/07abc204fd61e4692b48cf36babf0eecae6d154b): Add support for the in1 region ([#1847](https://github.com/sysdiglabs/charts/issues/1847))
# v0.16.3
### Chores
* **admission-controller** [421f5573](https://github.com/sysdiglabs/charts/commit/421f5573b1d09aea2000b28eefb3199f71387e7f): Update to v3.9.46 ([#1753](https://github.com/sysdiglabs/charts/issues/1753))
# v0.16.2
### Chores
* **admission-controller** [1f2bef59](https://github.com/sysdiglabs/charts/commit/1f2bef5901e1cbf0622c92f037d7b674705b6204): Update to v3.9.44 ([#1731](https://github.com/sysdiglabs/charts/issues/1731))
# v0.16.1
### New Features
* **admission_controller** [4c07fbd2](https://github.com/sysdiglabs/charts/commit/4c07fbd2c8c7144bef6ca7c3fba75a150775117b): release with AC Webhook latest version, 1.27.3 ([#1708](https://github.com/sysdiglabs/charts/issues/1708))

    * * Fixed a bug when doing metadata enrichment for Pods resources
# v0.16.0
### New Features
* **admission-controller** [7128e512](https://github.com/sysdiglabs/charts/commit/7128e51219382f536fb61bded24414d97fb1eb42): Support for VM checks ([#1651](https://github.com/sysdiglabs/charts/issues/1651))

    * * Added support for VM checks, disabled by default
# v0.15.4
### Chores
* **admission-controller** [990d0163](https://github.com/sysdiglabs/charts/commit/990d0163c053049e5204c0f805765cfb78f86992): Update to v3.9.42 ([#1676](https://github.com/sysdiglabs/charts/issues/1676))
# v0.15.3
### Chores
* **admission-controller** [2ee4a064](https://github.com/sysdiglabs/charts/commit/2ee4a0646896e352c49e90e1039a78f9101656f4): Update to v3.9.41 ([#1661](https://github.com/sysdiglabs/charts/issues/1661))
# v0.15.2
### New Features
* **admission-controller,node-analyzer** [9e8cc902](https://github.com/sysdiglabs/charts/commit/9e8cc902897f4185f9f56b825d6741539999fcf9): set dnsPolicy when we allow hostNetwork in the Pod  ([#1652](https://github.com/sysdiglabs/charts/issues/1652))
# v0.15.1
### Chores
* **admission-controller** [19cf4fab](https://github.com/sysdiglabs/charts/commit/19cf4fabb6f39b3bdc07f1471cf55536751caa88): Update to v3.9.40 ([#1648](https://github.com/sysdiglabs/charts/issues/1648))
# v0.15.0
### New Features
* **common** [0061b52d](https://github.com/sysdiglabs/charts/commit/0061b52d51f43e1e4d5e2bdf1145be28287d5ce6): add me2 region support ([#1591](https://github.com/sysdiglabs/charts/issues/1591))
# v0.14.24
# v0.14.23
### Minor changes
* Bump inline scan service image version
# v0.14.22
### Chores
* **admission-controller** [14e71c31](https://github.com/sysdiglabs/charts/commit/14e71c31b5e5b78c3cad1bb2cd2ccc254e824798): use denyOnError and timeouts settings for KSPM ([#1589](https://github.com/sysdiglabs/charts/issues/1589))
# v0.14.21
### Chores
* **admission-controller** [f7c813c0](https://github.com/sysdiglabs/charts/commit/f7c813c0d4ba16edf1e93505f6034caf33e706e1): Release admission controller v3.9.37 ([#1587](https://github.com/sysdiglabs/charts/issues/1587))
# v0.14.20
### New Features
* **KSPM admission controller** [48a4f16f](https://github.com/sysdiglabs/charts/commit/48a4f16f19d62cc6f11c757d6f41571dc119a2d5): SSPROD-35354 - Make Dry Run mode configurable to a user in Chart Values. ([#1560](https://github.com/sysdiglabs/charts/issues/1560))
# v0.14.19
### Chores
* [45895438](https://github.com/sysdiglabs/charts/commit/4589543862f78502932dca1c4e37a7d0d89259ff): migrate default branch to main ([#1556](https://github.com/sysdiglabs/charts/issues/1556))
# v0.14.18
### Chores
* **admission-controller** [3915ce10](https://github.com/sysdiglabs/charts/commit/3915ce106f7b347db99d1c9632887cbf33f4c950): add ports to service conditionally ([#1558](https://github.com/sysdiglabs/charts/issues/1558))
# v0.14.17
### Chores
* **admission-controller** [7c1a99a2](https://github.com/sysdiglabs/charts/commit/7c1a99a2fa9d164ff0a325ccbffd84fbc2c5123f): Update to v3.9.36 ([#1529](https://github.com/sysdiglabs/charts/issues/1529))
# v0.14.16
### New Features
* **sysdig-deploy** [49fe006f](https://github.com/sysdiglabs/charts/commit/49fe006fb0ff206c7b566a45bfa5f71713d5ad0a): Add prerequisite information on the chart ([#1468](https://github.com/sysdiglabs/charts/issues/1468))
# v0.14.15
### Chores
* **admission-controller,cloud-connector,cluster-scanner,node-analyzer,registry-scanner,sysdig-deploy** [9d5d8c58](https://github.com/sysdiglabs/charts/commit/9d5d8c5809d35bcb5e8060ccc454f446cb1e3bc7): change charts ownership ([#1461](https://github.com/sysdiglabs/charts/issues/1461))
# v0.14.14
### Chores
* **admission-controller** [8622c6c7](https://github.com/sysdiglabs/charts/commit/8622c6c7e1acc055ee7e8015c5204848f741f100): Update to v3.9.35 ([#1454](https://github.com/sysdiglabs/charts/issues/1454))
# v0.14.13
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
