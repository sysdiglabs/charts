# Chart: KSPM Collector

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v0.16.2
### Chores
* **ci** [fc5ecbaa](https://github.com/sysdiglabs/charts/commit/fc5ecbaaee10ec74f09a77a40be626f34e7dd292): bump bitnami/kubectl image references ([#1946](https://github.com/sysdiglabs/charts/issues/1946))
# v0.16.1
### Chores
* **ci** [e222f21d](https://github.com/sysdiglabs/charts/commit/e222f21de483926259c9574e4c2d9679681b9ddb): bump bitnami/kubectl image references ([#1892](https://github.com/sysdiglabs/charts/issues/1892))
# v0.16.0
### Chores
* **kspm-collector,node-analyzer** [d372a3c0](https://github.com/sysdiglabs/charts/commit/d372a3c01552094c8598493e9d1092e66fade67d): release kspm-collector & node-analyzer ([#1875](https://github.com/sysdiglabs/charts/issues/1875))
# v0.15.9
### Chores
* **node-analyzer,kspm-collector,agent,rapid-response** [fccdc179](https://github.com/sysdiglabs/charts/commit/fccdc1790d42e22c3d605303a4d5f904a0e91439): bump the bitnami/kubectl image reference in charts ([#1772](https://github.com/sysdiglabs/charts/issues/1772))
# v0.15.8
### New Features
* **common,admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [07abc204](https://github.com/sysdiglabs/charts/commit/07abc204fd61e4692b48cf36babf0eecae6d154b): Add support for the in1 region ([#1847](https://github.com/sysdiglabs/charts/issues/1847))
# v0.15.7
### Chores
* **agent,cluster-shield,sysdig-deploy,rapid-response,kspm-collector,cluster-scanner** [87059f19](https://github.com/sysdiglabs/charts/commit/87059f1992b6bf1c133ef96937ea2da90fa7d8a1): bump helm-unittest to v0.5.1 ([#1785](https://github.com/sysdiglabs/charts/issues/1785))
# v0.15.6
### Bug Fixes
* **kspm-collector,node-analyzer** [919bac75](https://github.com/sysdiglabs/charts/commit/919bac7579929a11ca2f19fd39d9600271c345fe): fix pod failure in NATS connection error ([#1773](https://github.com/sysdiglabs/charts/issues/1773))
# v0.15.5
### New Features
* **agent,kspm-collector,node-analyzer,rapid-response** [c0359500](https://github.com/sysdiglabs/charts/commit/c0359500433949727357cfd918d43d9a0e0dbe11): update kubectl images used for testing purpose ([#1758](https://github.com/sysdiglabs/charts/issues/1758))
# v0.15.4
### New Features
* **kspm-collector** [b751ae90](https://github.com/sysdiglabs/charts/commit/b751ae900f4cb865d4ccd7f428eef333c17d0615): bump kspm-collector version to 0.15.4 ([#1747](https://github.com/sysdiglabs/charts/issues/1747))
# v0.15.3
### Others
* [549e723e](https://github.com/sysdiglabs/charts/commit/549e723e11f0cb0deff59715f5ed2d26bdf4568c)
# v0.15.2
### New Features
* **kspm-collector** [5d917b1c](https://github.com/sysdiglabs/charts/commit/5d917b1c64661edd997bc4f81d1461a28b99eab2): Added permission for secrets ([#1715](https://github.com/sysdiglabs/charts/issues/1715))
# v0.15.1
### New Features
* **kspm-collector,node-analyzer** [03e67add](https://github.com/sysdiglabs/charts/commit/03e67adde86b18ef4f96dfe58e6425534a3b4ac0): release kspm-collector & node-analyzer with support for CRN & name from IBM cloud MDS ([#1712](https://github.com/sysdiglabs/charts/issues/1712))
# v0.15.0
### New Features
* **node-analyzer,kspm-collector** [7d1201fc](https://github.com/sysdiglabs/charts/commit/7d1201fc5d1bfc18e9cfc24ed621e76773405d64): Skip TLS certificate verification when using TLS Proxy & bump applications version ([#1665](https://github.com/sysdiglabs/charts/issues/1665))
# v0.14.2
### Chores
* **kspm-collector,kspm-collector** [e885b38c](https://github.com/sysdiglabs/charts/commit/e885b38ccdf152db9227d0ecaf3b281f9f10752a): version bump of kspm-collector & node-analyzer ([#1650](https://github.com/sysdiglabs/charts/issues/1650))
# v0.14.1
### Chores
* **node-analyzer,kspm-collector** [53da744e](https://github.com/sysdiglabs/charts/commit/53da744e4aff66f4fdc86a462a4e72d7ed94ec92): Bump KSPM to 1.41.2 & Node Analyzer to 1.38.1 ([#1643](https://github.com/sysdiglabs/charts/issues/1643))
# v0.14.0
### New Features
* **kspm-collector** [0b82d816](https://github.com/sysdiglabs/charts/commit/0b82d8165acdc7e34aea690d03422a7cd5a7b265): Deployment annotations and fix label render issue - replace [#1626](https://github.com/sysdiglabs/charts/issues/1626) ([#1639](https://github.com/sysdiglabs/charts/issues/1639))
# v0.13.0
### Chores
* **node-analyzer,kspm-collector** [bf10775e](https://github.com/sysdiglabs/charts/commit/bf10775e88d40a12e1e3058d96f3ecdf6138c715): bump node-analyzer to v1.41.0 and kspm-collector to v1.38.0 ([#1627](https://github.com/sysdiglabs/charts/issues/1627))
# v0.12.0
### New Features
* **common** [0061b52d](https://github.com/sysdiglabs/charts/commit/0061b52d51f43e1e4d5e2bdf1145be28287d5ce6): add me2 region support ([#1591](https://github.com/sysdiglabs/charts/issues/1591))
# v0.11.2
### Bug Fixes
* **agent,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [6b1f5818](https://github.com/sysdiglabs/charts/commit/6b1f5818836af26e5d83621049c96ae07d1fe12c): Set test rollout namespace based on required service accounts ([#1593](https://github.com/sysdiglabs/charts/issues/1593))
# v0.11.1
### Chores
* **node-analyzer,kspm-collector** [f1023ae1](https://github.com/sysdiglabs/charts/commit/f1023ae129bf5c95b13686bf793130d8fdbc6e50): Bump KSPM to 1.39.1 & Node Analyzer to 1.37.1 ([#1582](https://github.com/sysdiglabs/charts/issues/1582))
# v0.11.0
### Chores
* **node-analyzer,kspm-collector** [d80be00a](https://github.com/sysdiglabs/charts/commit/d80be00a821b0af2f71da6fd04590fcd897e0b4a): Bump KSPM to 1.39.0 & Node Analyzer to 1.37.0 ([#1549](https://github.com/sysdiglabs/charts/issues/1549))
# v0.10.0
### Chores
* **node-analyzer,kspm-collector** [045b5d37](https://github.com/sysdiglabs/charts/commit/045b5d3798eb60ac6bff33f168273dca8a49618b): Bump KSPM to 1.38.0 & Node Analyzer to 1.36.0 ([#1513](https://github.com/sysdiglabs/charts/issues/1513))
# v0.9.3
### Chores
* **kspm-collector,node-analyzer** [0b43cdef](https://github.com/sysdiglabs/charts/commit/0b43cdef544b2a5d553479027c9065964c6c4829): update cspm agents to UBI image 1.5.8 ([#1469](https://github.com/sysdiglabs/charts/issues/1469))
# v0.9.2
### Bug Fixes
* **agent,kspm-collector,node-analyzer,sysdig** [f378d192](https://github.com/sysdiglabs/charts/commit/f378d1922d0f21f5936c6ed872e6538536ccf1f2): whitespace errors ([#1436](https://github.com/sysdiglabs/charts/issues/1436))
# v0.9.1
### New Features
* **node-analyzer,kspm-collector,sysdig-deploy** [f6f68ff0](https://github.com/sysdiglabs/charts/commit/f6f68ff0cd31693aaf26e0f3de53bb70a42182ad): allow custom proxy for individual containers in node analyzer ([#1432](https://github.com/sysdiglabs/charts/issues/1432))
# v0.8.5
### Chores
* **kspm-collector,node-analyzer** [201126cf](https://github.com/sysdiglabs/charts/commit/201126cf8abb51996ee001665c17545210058ff9): KSPM v1.34.0 ([#1422](https://github.com/sysdiglabs/charts/issues/1422))
# v0.8.4
### New Features
* **kspm-collector,node-analyzer** [660e610d](https://github.com/sysdiglabs/charts/commit/660e610d475cdac3b9d2c51da4af0a01abce31f6): add support for NATS_MAX_RECONNECT variable ([#1400](https://github.com/sysdiglabs/charts/issues/1400))
# v0.8.3
### Bug Fixes
* **kspm-collector,node-analyzer** [67f042fd](https://github.com/sysdiglabs/charts/commit/67f042fd9ebb72cd121751d46fb96f7c3ad539ba): add debug logs to cloud platform metadata loading ([#1398](https://github.com/sysdiglabs/charts/issues/1398))
# v0.8.2
### Bug Fixes
* **common,agent,admission-controller,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [e76f1c17](https://github.com/sysdiglabs/charts/commit/e76f1c17e48491dd8ea21293ec1fed2619eed204): Update Sysdig CA ([#1393](https://github.com/sysdiglabs/charts/issues/1393))
# v0.8.1
### Bug Fixes
* **common,agent,node-analyzer,kspm-collector** [0806635e](https://github.com/sysdiglabs/charts/commit/0806635e5824365adb8ab3d8fd31811477c8918e): support multi-level map in agent.tags ([#1351](https://github.com/sysdiglabs/charts/issues/1351))
# v0.8.0
### New Features
* **admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [32231059](https://github.com/sysdiglabs/charts/commit/322310597ffbf9e47b5755be8f2f65a6e68296a2): pass agent tags to kspm components ([#1333](https://github.com/sysdiglabs/charts/issues/1333))
# v0.7.0
### Chores
* **kspm-collector,node-analyzer** [96e039bb](https://github.com/sysdiglabs/charts/commit/96e039bbe88e2284c99da30e3612efde00e9d2ac): KSPM v1.30.0 ([#1322](https://github.com/sysdiglabs/charts/issues/1322))
# v0.6.0
### Chores
* **kspm-collector,node-analyzer** [3985651e](https://github.com/sysdiglabs/charts/commit/3985651e0c6d52788fa0e36a740499458571b6b0): KSPM v1.29.0 ([#1311](https://github.com/sysdiglabs/charts/issues/1311))
# v0.5.0
### New Features
* **kspm-collector,node-analyzer** [b302524f](https://github.com/sysdiglabs/charts/commit/b302524f75098299644ef541d71876180f61ed01): release agents v1.27.0 with RKE2 suport ([#1274](https://github.com/sysdiglabs/charts/issues/1274))
# v0.4.0
### New Features
* **sysdig-agent,node-analyzer,kspm-collector,rapid-response,admission-controller** [2dca8e7c](https://github.com/sysdiglabs/charts/commit/2dca8e7c5308e76c2da63c974ae75c4ad510c201): Global Custom CA Bundle Support ([#961](https://github.com/sysdiglabs/charts/issues/961))
# v0.3.4
# v0.3.3
### New Features
* **kspm-collector,node-analyzer** [b95c0dac](https://github.com/sysdiglabs/charts/commit/b95c0dac7dc7cf9feb64a824bd415bb34f708e99): add resource ID to Posture ([#1231](https://github.com/sysdiglabs/charts/issues/1231))
# v0.3.2
### Bug Fixes
* **kspm-collector,node-analyzer** [96da2bf6](https://github.com/sysdiglabs/charts/commit/96da2bf6a09a306e2e801ed6358080956130adc0): properly handle affinity beta annotations ([#1196](https://github.com/sysdiglabs/charts/issues/1196))
# v0.3.1
### Bug Fixes
* **common** [0e37805f](https://github.com/sysdiglabs/charts/commit/0e37805f0190b74b53f7d9b47e5528009f58aa4b): add missing CHANGELOG file and bump version ([#1223](https://github.com/sysdiglabs/charts/issues/1223))
### New Features
* **admission-controller,agent,common,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [47483bc0](https://github.com/sysdiglabs/charts/commit/47483bc0d5f872bc6d406a48491ac930d1d75f8f): Improve region resolution in all charts ([#946](https://github.com/sysdiglabs/charts/issues/946))
# v0.2.2
# v0.2.1
### Documentation
* **kspm-collector** [b10cd1ec](https://github.com/sysdiglabs/charts/commit/b10cd1ec4c3a3e44a27c2948c2bc8a462dbfa84c): DOC-3209 - update the helm readme for clarity and correctness ([#1168](https://github.com/sysdiglabs/charts/issues/1168))
# v0.2.0
### New Features
* **admission-controller,agent,cloud-bench,cloud-connector,cloud-scanning,harbor-scanner-sysdig-secure,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig,sysdig-deploy,sysdig-mcm-navmenu,sysdig-stackdriver-bridge** [5d99a03d](https://github.com/sysdiglabs/charts/commit/5d99a03dced132b4771dde1ce5b90b63c518b408): use a PGP private key to sign charts on release ([#1170](https://github.com/sysdiglabs/charts/issues/1170))
# v0.1.52
### Documentation
* **kspm-collector** [fdd7baec](https://github.com/sysdiglabs/charts/commit/fdd7baecf2e5283fd30ef25ad444c37d1082a327): kspm-collector readme formatting ([#1192](https://github.com/sysdiglabs/charts/issues/1192))
# v0.1.51
### New Features
* **kspm-collector,node-analyzer** [880cbc98](https://github.com/sysdiglabs/charts/commit/880cbc9840cacd4c66f939ba1d52a70181408a17): add account ID to Posture ([#1185](https://github.com/sysdiglabs/charts/issues/1185))
# v0.1.50
### New Features
* **adminssion-controller,agent,node-analyzer,kspm-collector,rapid-response** [33cad895](https://github.com/sysdiglabs/charts/commit/33cad8952395800e2e453de6bbf81851bfe1c608): pull policy and secrets params uniformity ([#1158](https://github.com/sysdiglabs/charts/issues/1158))
# v0.1.49
### Bug Fixes
* **kspm-collector** [0e781267](https://github.com/sysdiglabs/charts/commit/0e781267813eb79070f28ac2afa22b5c18a80a84): readme formatting ([#1154](https://github.com/sysdiglabs/charts/issues/1154))
# v0.1.48
### Chores
* **kspm-collector, node-analyzer** [1b347fe8](https://github.com/sysdiglabs/charts/commit/1b347fe80da79b95bfc7b0c4f51dd3cc12a6d0dc): bump KSPM to v1.24.0 ([#1144](https://github.com/sysdiglabs/charts/issues/1144))
# v0.1.47
### Chores
* **kspm-collector, node-analyzer** [2807ef4b](https://github.com/sysdiglabs/charts/commit/2807ef4b5e33c587008a84f03c1c26f18e48019b): bump KSPM to v1.23.0  ([#1132](https://github.com/sysdiglabs/charts/issues/1132))
# v0.1.46
### New Features
* **kspm-collector** [f0defb2b](https://github.com/sysdiglabs/charts/commit/f0defb2b4a81d67bf0f3426179cc8d45ddd20f7b): priorityclassname added ([#1114](https://github.com/sysdiglabs/charts/issues/1114))
# v0.1.45
### Bug Fixes
* **kspm-collector** [ac633130](https://github.com/sysdiglabs/charts/commit/ac6331304b82b2f22c01353b036696d2a92bb7b5): Add missing clusterrole for KSPM PSP ([#1109](https://github.com/sysdiglabs/charts/issues/1109))
# v0.1.44
### New Features
* **kspm-collector** [fe03214](https://github.com/sysdiglabs/charts/commit/fe0321465d12656a392c1e250e6c441af0a4c1d1): Added PSP policies for KSPM Collector ([#1088](https://github.com/sysdiglabs/charts/issues/1088))
# v0.1.43
### Chores
* **admission-controller,agent,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig-deploy** [7f35eb1](https://github.com/sysdiglabs/charts/commit/7f35eb1f88d93fa59c2839e7fbb756e50a378bea): update helm unittest plugin ([#996](https://github.com/sysdiglabs/charts/issues/996))
# v0.1.42
### New Features
* **kspm-collector,node-analyzer** [af66e68](https://github.com/sysdiglabs/charts/commit/af66e68abcc2d0345ec84c93b7cba1f65a8b0a97): bumped KSPM to latest version ([#1019](https://github.com/sysdiglabs/charts/issues/1019))
# v0.1.41
### New Features
* **kspm-collector,node-analyzer** [3632fb0](https://github.com/sysdiglabs/charts/commit/3632fb0aabeb97a98d76c208e2cc566f376a08a3): bumped KSPM to latest version ([#977](https://github.com/sysdiglabs/charts/issues/977))
# v0.1.40
### New Features
* **kspm-collector** [84e8b53](https://github.com/sysdiglabs/charts/commit/84e8b53a84ff809cda26dc5d9aea0f6470cf44a5): Added permission for ocp api ([#964](https://github.com/sysdiglabs/charts/issues/964))
# v0.1.39
# v0.1.38
### New Features
* **kspm-collector,node-analyzer** [114c784](https://github.com/sysdiglabs/charts/commit/114c7840689472638326fc01d652c698830ec3a2): bumped KSPM to latest version ([#957](https://github.com/sysdiglabs/charts/issues/957))
# v0.1.37
### New Features
* **kspm-collector,node-analyzer** [3e111b6](https://github.com/sysdiglabs/charts/commit/3e111b6c16a7d81e13a2d1d7006d078bddda5885): bumped KSPM to latest version ([#939](https://github.com/sysdiglabs/charts/issues/939))
# v0.1.36
### New Features
* **kspm-analyzer, kspm-collector** [dedebca](https://github.com/sysdiglabs/charts/commit/dedebca2a44e00828d80379c00cafbb50d90db8d): OCP4 support ([#915](https://github.com/sysdiglabs/charts/issues/915))
# v0.1.35
### New Features
* **kspm-collector** [d1328c0](https://github.com/sysdiglabs/charts/commit/d1328c02976901a64d91f4e86a2a26035045496c): bumped KSPM Collector to latest version ([#921](https://github.com/sysdiglabs/charts/issues/921))
# v0.1.33
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
