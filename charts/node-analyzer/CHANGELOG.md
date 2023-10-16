# Chart: Node Analyzer

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v1.17.7
### Bug Fixes
* **kspm-collector,node-analyzer** [67f042fd](https://github.com/sysdiglabs/charts/commit/67f042fd9ebb72cd121751d46fb96f7c3ad539ba): add debug logs to cloud platform metadata loading ([#1398](https://github.com/sysdiglabs/charts/issues/1398))
# v1.17.6
### Bug Fixes
* **common,agent,admission-controller,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [e76f1c17](https://github.com/sysdiglabs/charts/commit/e76f1c17e48491dd8ea21293ec1fed2619eed204): Update Sysdig CA ([#1393](https://github.com/sysdiglabs/charts/issues/1393))
# v1.17.5
### Chores
* **node-analyzer** [a66360df](https://github.com/sysdiglabs/charts/commit/a66360dfbd00f1d82ab5da6f8b70a5e1d77440cf): remove broken link from values.yaml ([#1370](https://github.com/sysdiglabs/charts/issues/1370))
# v1.17.4
### Chores
* **node-analyzer** [fc65fee4](https://github.com/sysdiglabs/charts/commit/fc65fee45ac31030885407a7dbadd078096620ab): bump sysdig/vuln-host-scanner to v0.5.2 ([#1363](https://github.com/sysdiglabs/charts/issues/1363))
# v1.17.3
### Chores
* **sysdig, nodel-analyzer** [44e1c6a3](https://github.com/sysdiglabs/charts/commit/44e1c6a385faf3bdcdd0cb8427254338c68254c7): bump sysdig/vuln-runtime-scanner to v1.5.7 ([#1361](https://github.com/sysdiglabs/charts/issues/1361))
# v1.17.2
### Bug Fixes
* **node-analyzer** [58970c62](https://github.com/sysdiglabs/charts/commit/58970c62a7148f5bfbaaecfc2aa4f524d89657a4): prevent `custom_tags` from being set to `nil` ([#1355](https://github.com/sysdiglabs/charts/issues/1355))
# v1.17.1
### Bug Fixes
* **common,agent,node-analyzer,kspm-collector** [0806635e](https://github.com/sysdiglabs/charts/commit/0806635e5824365adb8ab3d8fd31811477c8918e): support multi-level map in agent.tags ([#1351](https://github.com/sysdiglabs/charts/issues/1351))
# v1.17.0
### Bug Fixes
* **node-analyzer** [340a9344](https://github.com/sysdiglabs/charts/commit/340a93448d0f3f1d4d7dbb830da7335266640835): node-analyzer jq/yq installation fix ([#1347](https://github.com/sysdiglabs/charts/issues/1347))
# v1.16.0
### New Features
* **admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [32231059](https://github.com/sysdiglabs/charts/commit/322310597ffbf9e47b5755be8f2f65a6e68296a2): pass agent tags to kspm components ([#1333](https://github.com/sysdiglabs/charts/issues/1333))
# v1.15.2
### Chores
* **node-analyzer** [de62a50b](https://github.com/sysdiglabs/charts/commit/de62a50b5e2e706157c564d9614688fe63d8da87): bump sysdig/vuln-host-scanner to v0.5 ([#1334](https://github.com/sysdiglabs/charts/issues/1334))
# v1.15.1
### Chores
* **sysdig, node-analyzer** [6b2c2efd](https://github.com/sysdiglabs/charts/commit/6b2c2efd7eccb16ad74df29d75daef664e2df9f7): bump sysdig/vuln-runtime-scanner to v1.5.6 ([#1331](https://github.com/sysdiglabs/charts/issues/1331))
# v1.15.0
### Chores
* **kspm-collector,node-analyzer** [96e039bb](https://github.com/sysdiglabs/charts/commit/96e039bbe88e2284c99da30e3612efde00e9d2ac): KSPM v1.30.0 ([#1322](https://github.com/sysdiglabs/charts/issues/1322))
# v1.14.7
### Chores
* **sysdig, node-analyzer** [0ba5baa3](https://github.com/sysdiglabs/charts/commit/0ba5baa3e690be1c2c3a92c4928558efffb33539): bump sysdig/vuln-runtime-scanner to v1.5.5 ([#1320](https://github.com/sysdiglabs/charts/issues/1320))

    * * Runtime Scanner bumped to 1.5.5
     * Fixed a bug that could cause the Runtime Scanner to perform unneeded rescans
# v1.14.6
### Chores
* **kspm-collector,node-analyzer** [3985651e](https://github.com/sysdiglabs/charts/commit/3985651e0c6d52788fa0e36a740499458571b6b0): KSPM v1.29.0 ([#1311](https://github.com/sysdiglabs/charts/issues/1311))
# v1.14.5
### Chores
* **sysdig, node-analyzer** [17d2e503](https://github.com/sysdiglabs/charts/commit/17d2e50326f587b154f43beb706627416ca6a4b6): bump sysdig/vuln-runtime-scanner to v1.5.4 ([#1305](https://github.com/sysdiglabs/charts/issues/1305))

    * * Runtime Scanner bumped to 1.5.4
     * Fixed a misbehavior of the image layer analyzer, which could lead to non-existing software artifacts being reported in the SBOM as a result of incorrect handling of opaque directories (ESC-3511).
# v1.14.4
### Documentation
* **admission-controller, cluster-scanner, registry-scanner, cloud-connector, node-analyzer, rapid-response, sysdig-deploy, agent** [df733e62](https://github.com/sysdiglabs/charts/commit/df733e6294eae1967197e3521473a5fab0282b67): update maintainers list ([#1283](https://github.com/sysdiglabs/charts/issues/1283))
# v1.14.3
### Bug Fixes
* **node-analyzer** [d5c2fffa](https://github.com/sysdiglabs/charts/commit/d5c2fffa9e9223ee6aea451f1ecdcee7610f02b8): permissions fix for CR sysdig-agent-node-analyzer ([#1272](https://github.com/sysdiglabs/charts/issues/1272))
# v1.14.2
### New Features
* **node-analyzer** [0ad8696a](https://github.com/sysdiglabs/charts/commit/0ad8696a0b38d2564121e6e798589f568e3547a8): Release eveconnector 1.1.2 ([#1280](https://github.com/sysdiglabs/charts/issues/1280))
# v1.14.1
### Chores
* **node-analyzer** [d59b8c97](https://github.com/sysdiglabs/charts/commit/d59b8c97488c9277885c203e0db39665625aa5ea): toggle volumes used by runtimeScanner and imageAnalyzer ([#1273](https://github.com/sysdiglabs/charts/issues/1273))
# v1.14.0
### New Features
* **kspm-collector,node-analyzer** [b302524f](https://github.com/sysdiglabs/charts/commit/b302524f75098299644ef541d71876180f61ed01): release agents v1.27.0 with RKE2 suport ([#1274](https://github.com/sysdiglabs/charts/issues/1274))
# v1.13.0
### New Features
* **sysdig-agent,node-analyzer,kspm-collector,rapid-response,admission-controller** [2dca8e7c](https://github.com/sysdiglabs/charts/commit/2dca8e7c5308e76c2da63c974ae75c4ad510c201): Global Custom CA Bundle Support ([#961](https://github.com/sysdiglabs/charts/issues/961))
# v1.12.1
### Chores
* **sysdig,node-analyzer** [00316d04](https://github.com/sysdiglabs/charts/commit/00316d042378fa75ac0ed9277b547236766ce816): bumped RuntimeScanner to 1.5.2 version ([#1275](https://github.com/sysdiglabs/charts/issues/1275))

    * * Added env var flag for internal timeout on scheduled operations
* Added fallback when connection to detected container runtime fails
* Security updates (July 2023). Fixed CVE
  *  CVE-2023-33199
# v1.12.0
### Bug Fixes
* **node-analyzer** [6dcb0a0a](https://github.com/sysdiglabs/charts/commit/6dcb0a0a5c32edc9aaa8c4821e3dfd2ce0888fe6): enable hostPID in node-analyzer ([#1271](https://github.com/sysdiglabs/charts/issues/1271))
# v1.11.3
### Chores
* **node-analyzer** [a22538b0](https://github.com/sysdiglabs/charts/commit/a22538b0455c4f1a6f2be577cbd0aaf904f3aad6): Bump benchmark runner ([#1269](https://github.com/sysdiglabs/charts/issues/1269))
# v1.11.2
### New Features
* **node-analyzer** [76af97ed](https://github.com/sysdiglabs/charts/commit/76af97edaae471525d78fd1115a0a6689223cfbb): updated legacy engine NIA compoment with latest release ([#1265](https://github.com/sysdiglabs/charts/issues/1265))
# v1.11.1
# v1.11.0
### New Features
* **node-analyzer** [6c0b1e6d](https://github.com/sysdiglabs/charts/commit/6c0b1e6d883c8372a142a4a4cf955f3ecda0fe24): allow node-analyzer chart to create its own priority class ([#1252](https://github.com/sysdiglabs/charts/issues/1252))
# v1.10.7
### Documentation
* **node-analyzer** [799649c4](https://github.com/sysdiglabs/charts/commit/799649c48c21b33083ee5a4a24642a010873d463): remove additional column from the configurations table ([#1251](https://github.com/sysdiglabs/charts/issues/1251))
# v1.10.6
### Documentation
* **node-analyzer** [8f952ad4](https://github.com/sysdiglabs/charts/commit/8f952ad43045ddcffa3fdbd346ed129f8da2f0fb): fix configuration table rendering ([#1249](https://github.com/sysdiglabs/charts/issues/1249))
# v1.10.5
# v1.10.4
### New Features
* **kspm-collector,node-analyzer** [b95c0dac](https://github.com/sysdiglabs/charts/commit/b95c0dac7dc7cf9feb64a824bd415bb34f708e99): add resource ID to Posture ([#1231](https://github.com/sysdiglabs/charts/issues/1231))
# v1.10.3
# v1.10.2
### Bug Fixes
* **kspm-collector,node-analyzer** [96da2bf6](https://github.com/sysdiglabs/charts/commit/96da2bf6a09a306e2e801ed6358080956130adc0): properly handle affinity beta annotations ([#1196](https://github.com/sysdiglabs/charts/issues/1196))
# v1.10.1
### Bug Fixes
* **common** [0e37805f](https://github.com/sysdiglabs/charts/commit/0e37805f0190b74b53f7d9b47e5528009f58aa4b): add missing CHANGELOG file and bump version ([#1223](https://github.com/sysdiglabs/charts/issues/1223))
### New Features
* **admission-controller,agent,common,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [47483bc0](https://github.com/sysdiglabs/charts/commit/47483bc0d5f872bc6d406a48491ac930d1d75f8f): Improve region resolution in all charts ([#946](https://github.com/sysdiglabs/charts/issues/946))
# v1.9.1
### Documentation
* **node-analyzer** [d43443a7](https://github.com/sysdiglabs/charts/commit/d43443a732bdbf710e094ea8ad8173d36c2fdc02): DOC-3214 - update for clarity ([#1171](https://github.com/sysdiglabs/charts/issues/1171))
# v1.9.0
### New Features
* **admission-controller,agent,cloud-bench,cloud-connector,cloud-scanning,harbor-scanner-sysdig-secure,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig,sysdig-deploy,sysdig-mcm-navmenu,sysdig-stackdriver-bridge** [5d99a03d](https://github.com/sysdiglabs/charts/commit/5d99a03dced132b4771dde1ce5b90b63c518b408): use a PGP private key to sign charts on release ([#1170](https://github.com/sysdiglabs/charts/issues/1170))
* **kspm-collector,node-analyzer** [880cbc98](https://github.com/sysdiglabs/charts/commit/880cbc9840cacd4c66f939ba1d52a70181408a17): add account ID to Posture ([#1185](https://github.com/sysdiglabs/charts/issues/1185))
# v1.8.65
### Chores
* **sysdig, node-analyzer** [706d562f](https://github.com/sysdiglabs/charts/commit/706d562f3d473f88fd1d257974cd3a127d672a2a): bump sysdig/vuln-runtime-scanner to v1.5.1 ([#1187](https://github.com/sysdiglabs/charts/issues/1187))

    * Runtimescanner bumped to 1.5.1
- Fix for CVE-2023-2253
# v1.8.64
### Bug Fixes
* **agent,node-analyzer** [e0ef02c2](https://github.com/sysdiglabs/charts/commit/e0ef02c283df3d12cf5d8d2b1b89a61e1fc30807): updateStrategy maxSurge param ([#1166](https://github.com/sysdiglabs/charts/issues/1166))
# v1.8.63
### New Features
* **adminssion-controller,agent,node-analyzer,kspm-collector,rapid-response** [33cad895](https://github.com/sysdiglabs/charts/commit/33cad8952395800e2e453de6bbf81851bfe1c608): pull policy and secrets params uniformity ([#1158](https://github.com/sysdiglabs/charts/issues/1158))
# v1.8.62
### Chores
* **node-analyzer** [9ed5c468](https://github.com/sysdiglabs/charts/commit/9ed5c468d40f8c64f4bc7710996261e9e40e3ec1): bump sysdig/vuln-host-scanner to v0.4 ([#1162](https://github.com/sysdiglabs/charts/issues/1162))

    * * Hostscanner bumped to 0.4
     * Updated the analyzer to inspect also vendor paths
     * Added support to apply image based accepts for all versions of the image, that image in a specific registry & repository, as well as a contain string for customized subsets of the environment
# v1.8.61
### Chores
* **sysdig, node-analyzer** [f9c8e102](https://github.com/sysdiglabs/charts/commit/f9c8e1028b4b4e79aba10e72f762f14956d54273): bump sysdig/vuln-runtime-scanner to v1.5 ([#1160](https://github.com/sysdiglabs/charts/issues/1160))

    * * Runtimescanner bumped to 1.5
     * Updated the analyzer to inspects also vendor paths
     * Added support to apply image based accepts for all versions of the image, that image in a specific registry & repository, as well as a contain string for customized subsets of the environment
# v1.8.60
### Chores
* **kspm-collector, node-analyzer** [1b347fe8](https://github.com/sysdiglabs/charts/commit/1b347fe80da79b95bfc7b0c4f51dd3cc12a6d0dc): bump KSPM to v1.24.0 ([#1144](https://github.com/sysdiglabs/charts/issues/1144))
# v1.8.59
### Chores
* **node-analyzer** [bf0b4fb4](https://github.com/sysdiglabs/charts/commit/bf0b4fb4f8100daac5fca312fd9622fbae87499d): bump sysdig/vuln-host-scanner to v0.3.10 ([#1126](https://github.com/sysdiglabs/charts/issues/1126))
# v1.8.58
### Chores
* **sysdig, node-analyzer** [601a0685](https://github.com/sysdiglabs/charts/commit/601a0685639cefc10ec9120c74153f4bb2ac2473): bump sysdig/vuln-runtime-scanner to v1.4.12 ([#1127](https://github.com/sysdiglabs/charts/issues/1127))
# v1.8.57
### Chores
* **kspm-collector, node-analyzer** [2807ef4b](https://github.com/sysdiglabs/charts/commit/2807ef4b5e33c587008a84f03c1c26f18e48019b): bump KSPM to v1.23.0  ([#1132](https://github.com/sysdiglabs/charts/issues/1132))
# v1.8.56
### New Features
* **node-analyzer** [0e7f2534](https://github.com/sysdiglabs/charts/commit/0e7f2534b5f6726d275c76d307910f8d909d3749): Update legacy engine HostAnalyzer with security updates ([#1129](https://github.com/sysdiglabs/charts/issues/1129))

    * Security updates (May 2023) for HostAnalyzer. Fixed 1 CVE:
	* CVE-2023-28840
# v1.8.55
### New Features
* **node-analyzer** [930926ef](https://github.com/sysdiglabs/charts/commit/930926efe251bd171c555d136030f5916a4ba04e): Update legacy engine NIA with security updates ([#1124](https://github.com/sysdiglabs/charts/issues/1124))

    * Security updates (May 2023) for NodeImageAnalyzer. Fixed 2 CVEs:
	* CVE-2023-30861
	* CVE-2023-28840
# v1.8.54
### New Features
* [19a5637d](https://github.com/sysdiglabs/charts/commit/19a5637d845bf05d06702955a8fb950f44d1aece): eve-connector priorityclassname added ([#1113](https://github.com/sysdiglabs/charts/issues/1113))
# v1.8.53
### New Features
* **node-analyzer** [729642d1](https://github.com/sysdiglabs/charts/commit/729642d13041aced698901d45f17ade57d109b9a): support settings passed as numbers ([#1093](https://github.com/sysdiglabs/charts/issues/1093))
# v1.8.52
### Bug Fixes
* **node-analyzer** [fd461c10](https://github.com/sysdiglabs/charts/commit/fd461c107d0c6fe3847a920d9851cd55ae566625): allow custom annotations on node analyzer daemonset ([#1097](https://github.com/sysdiglabs/charts/issues/1097))
# v1.8.51
### Bug Fixes
* **node-analyzer** [539e0a7](https://github.com/sysdiglabs/charts/commit/539e0a7b8641529e1276d0bca31a159256b4d720): Remove pullPolicy and pullSecrets duplicated entry ([#967](https://github.com/sysdiglabs/charts/issues/967))
# v1.8.50
### Chores
* **sysdig, node-analyzer** [a7564db](https://github.com/sysdiglabs/charts/commit/a7564dbac2f879064e000ef780b71ebc3d4463a7): bump sysdig/vuln-runtime-scanner to v1.4.11 ([#1061](https://github.com/sysdiglabs/charts/issues/1061))
# v1.8.49
### Bug Fixes
* **admission-controller,agent,node-analyzer,rapid-response,registry-scanner,sysdig** [0bf9682](https://github.com/sysdiglabs/charts/commit/0bf96827ebf80d76aab61b8fa3d26b3903df220b): Improve KubeVersion Comparisons ([#1040](https://github.com/sysdiglabs/charts/issues/1040))
# v1.8.48
### New Features
* **node-analyzer** [138602f](https://github.com/sysdiglabs/charts/commit/138602f0bf30808240f86ed35bad61f5496d1073): Allow daemonset to have maxUnavailable setting configurable ([#1029](https://github.com/sysdiglabs/charts/issues/1029))
# v1.8.47
### Chores
* **node-analyzer** [a8daf9c](https://github.com/sysdiglabs/charts/commit/a8daf9cb5776d1b154e4dfbf54a551c85bec1bcb): Release HostScanner and RuntimeScanner updates ([#1037](https://github.com/sysdiglabs/charts/issues/1037))

    * * Hostscanner bumped to 0.3.9
     * Support for .NET analyzer
* Runtimescanner bumped to 1.4.10
     * Support for .NET analyzer
# v1.8.46
### Chores
* **admission-controller,agent,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig-deploy** [7f35eb1](https://github.com/sysdiglabs/charts/commit/7f35eb1f88d93fa59c2839e7fbb756e50a378bea): update helm unittest plugin ([#996](https://github.com/sysdiglabs/charts/issues/996))
# v1.8.45
### New Features
* **kspm-collector,node-analyzer** [af66e68](https://github.com/sysdiglabs/charts/commit/af66e68abcc2d0345ec84c93b7cba1f65a8b0a97): bumped KSPM to latest version ([#1019](https://github.com/sysdiglabs/charts/issues/1019))
# v1.8.44
### New Features
* **node-analyzer** [f3d3eb5](https://github.com/sysdiglabs/charts/commit/f3d3eb5ba7ab4d7e1dbef7f59270dea860428bfa): update runtimeScanner image with a fix for k8s v1.26 ([#1017](https://github.com/sysdiglabs/charts/issues/1017))

    * * Runtimescanner bumped to 1.4.9:
      * Fix: use CRI api v1 to ensure support for kubernetes v1.26
# v1.8.43
### New Features
* **node-analyzer** [fd600e8](https://github.com/sysdiglabs/charts/commit/fd600e86b1d28f141ca59439bc687c31fdc141b1): add extraVolumes to daemonset with nodeAnalyzer.extraVolumes.volumes

    * adds new option `nodeAnalyzer.extraVolumes.volumes`. This allows to define volumes for the nodeAnalyzer daemonset in a cleaner way.
Previously it was necessary to use the option `nodeAnalyzer.imageAnalyzer.extraVolumes.volumes`.
# v1.8.42
### New Features
* **node-analyzer** [79f7679](https://github.com/sysdiglabs/charts/commit/79f76794e271abf031216b261165f313192001f5): Update HostScanner and RuntimeScanner images containing latest security updates and fix ([#999](https://github.com/sysdiglabs/charts/issues/999))

    * * Hostscanner bumped to 0.3.8
     * Fix CVE-2022-41721
     * Fix CVE-2022-41723
     * Improved JAR's manifest parsing
* Runtimescanner bumped to 1.4.7
     * Improved JAR's manifest parsing
# v1.8.41
### New Features
* **node-analyzer** [90e8df4](https://github.com/sysdiglabs/charts/commit/90e8df4228ce33e3ec57e6401de545e3fb265ced): bumped RuntimeScanner and HostScanner to latest versions ([#993](https://github.com/sysdiglabs/charts/issues/993))

    * * Hostscanner bumped to 0.3.7, Runtimescanner bumped to 1.4.7
     * fixed issue with detection of vulns in java packages with version ending with .RELEASE
     * fixed issue with full java path not showing for dependencies (ex: jar in a war)
# v1.8.40
### New Features
* **sysdig** [5273f8e](https://github.com/sysdiglabs/charts/commit/5273f8e29d38d79981797f2060271733654110dd): Update legacy engine NIA/HostAnalyzer components with security updates ([#989](https://github.com/sysdiglabs/charts/issues/989))
# v1.8.39
### New Features
* **kspm-collector,node-analyzer** [3632fb0](https://github.com/sysdiglabs/charts/commit/3632fb0aabeb97a98d76c208e2cc566f376a08a3): bumped KSPM to latest version ([#977](https://github.com/sysdiglabs/charts/issues/977))
# v1.8.38
### Bug Fixes
* **sysdig,node-analyzer** [27ce551](https://github.com/sysdiglabs/charts/commit/27ce5515b64325ebe0e97762dbcc0a2b8deddbd3): Added missing volumeMount required for IBM OCP on legacy and new VM ([#955](https://github.com/sysdiglabs/charts/issues/955))
# v1.8.37
# v1.8.36
### New Features
* **kspm-collector,node-analyzer** [114c784](https://github.com/sysdiglabs/charts/commit/114c7840689472638326fc01d652c698830ec3a2): bumped KSPM to latest version ([#957](https://github.com/sysdiglabs/charts/issues/957))
# v1.8.35
### New Features
* **kspm-collector,node-analyzer** [3e111b6](https://github.com/sysdiglabs/charts/commit/3e111b6c16a7d81e13a2d1d7006d078bddda5885): bumped KSPM to latest version ([#939](https://github.com/sysdiglabs/charts/issues/939))
# v1.8.34
### New Features
* **node-analyzer,sysdig** [42e3aa5](https://github.com/sysdiglabs/charts/commit/42e3aa5c30a06166eb959632ec223149a6784421): Feat/bench runner bump to 1.1.0.8 ([#937](https://github.com/sysdiglabs/charts/issues/937))
# v1.8.33
### New Features
* **sysdig,node-analyzer** [407e669](https://github.com/sysdiglabs/charts/commit/407e6693e451059956838118d65a8e0cc68547c4): bump legacy NodeImageAnalyzer to v0.1.24 ([#935](https://github.com/sysdiglabs/charts/issues/935))
# v1.8.32
### New Features
* **kspm-analyzer, kspm-collector** [dedebca](https://github.com/sysdiglabs/charts/commit/dedebca2a44e00828d80379c00cafbb50d90db8d): OCP4 support ([#915](https://github.com/sysdiglabs/charts/issues/915))
# v1.8.31
### New Features
* **node-analyzer** [19ec540](https://github.com/sysdiglabs/charts/commit/19ec540233c937fa2a98cd87921161025439f693): bumped RuntimeScanner and HostScanner to latest versions ([#916](https://github.com/sysdiglabs/charts/issues/916))
# v1.8.30
### New Features
* **sysdig,node-analyzer** [61deccc](https://github.com/sysdiglabs/charts/commit/61decccbf840632176424593b3959c7b8499c4a6): bump legacy NodeImageAnalyzer to v0.1.23 ([#924](https://github.com/sysdiglabs/charts/issues/924))
# v1.8.29
### New Features
* **node-analyzer** [cce0f8c](https://github.com/sysdiglabs/charts/commit/cce0f8cf6922b1cd35a7de63926b4bf51c335182): Bump KSPM Analyzer to latest version ([#922](https://github.com/sysdiglabs/charts/issues/922))
# v1.8.28
### Bug Fixes
* **node-analyzer,kspm-collector** [59543e8](https://github.com/sysdiglabs/charts/commit/59543e8da45e1e61f21b2489500fe5452906bca0): Fix security context permission for KSPM components ([#907](https://github.com/sysdiglabs/charts/issues/907))
# v1.8.27
### Bug Fixes
* **node-analyzer,sysdig-deploy** [9e11852](https://github.com/sysdiglabs/charts/commit/9e118521c490c788ca6053b513f281d09a7f9ccd): Global proxy values for host-scanner ([#901](https://github.com/sysdiglabs/charts/issues/901))
# v1.8.26
### New Features
* **agent,node-analyzer,rapid-response** [487b421](https://github.com/sysdiglabs/charts/commit/487b421c922e097047e5ca65c01cee466664daba): add Rancher-specific tolerations ([#884](https://github.com/sysdiglabs/charts/issues/884))
# v1.8.25
### Bug Fixes
* **node-analyzer** [771c584](https://github.com/sysdiglabs/charts/commit/771c5846a79dd78a3a69ba20553a1c8f3e93b2ed): Make probes configurable ([#888](https://github.com/sysdiglabs/charts/issues/888))
# v1.8.24
### Bug Fixes
* **node-analyzer** [9cee27d](https://github.com/sysdiglabs/charts/commit/9cee27d3f1ac66e709e8a50f5dd5ad00fc9b52ee): increase initial delay of the probes ([#872](https://github.com/sysdiglabs/charts/issues/872))
# v1.8.23
### Documentation
* **agent,node-analyzer,sysdig,sysdig-stackdriver-bridge** [da18fe5](https://github.com/sysdiglabs/charts/commit/da18fe5e7225be9bbfc484d6dcb22987d7d08066): remove references of the deprecated --purge option for 'helm delete' ([#864](https://github.com/sysdiglabs/charts/issues/864))
# v1.8.22
### Chores
* **node-analyzer** [7971a25](https://github.com/sysdiglabs/charts/commit/7971a253e2fe4f282ab05c9e3316985646fd4009): Added test template for new runtime and host scanner ([#867](https://github.com/sysdiglabs/charts/issues/867))
# v1.8.21
### New Features
* **node-analyzer** [c2e8885](https://github.com/sysdiglabs/charts/commit/c2e88858702ff11b262aac6c695c78508ba0317d): host-scanner bump to 0.3.4 ([#857](https://github.com/sysdiglabs/charts/issues/857))
# v1.8.20
### Documentation
* **agent,node-analyzer,sysdig** [bd37186](https://github.com/sysdiglabs/charts/commit/bd371864313e64d7a7ac07f79fe30f296b46d540): Remove references to Get Started in the READMEs ([#819](https://github.com/sysdiglabs/charts/issues/819))
# v1.8.19
### Bug Fixes
* **node-analyzer,sysdig-deploy** [1e001d1](https://github.com/sysdiglabs/charts/commit/1e001d17e3ec9fce3db2043f8f626b53d157f159): Added quotes to Runtime Scanner probe port ([#863](https://github.com/sysdiglabs/charts/issues/863))
# v1.8.18
### New Features
* **node-analyzer** [d364d34](https://github.com/sysdiglabs/charts/commit/d364d342bddab96c6e78345bbb60e17e343a2463): runtimescanner bump to 1.4.4 ([#853](https://github.com/sysdiglabs/charts/issues/853))
# v1.8.17
### Bug Fixes
* **node-analyzer** [e894e55](https://github.com/sysdiglabs/charts/commit/e894e55a2febb72749ec44b214370596fa569fda): fix typo in dirs to scan and additional dirs set to analyzer instead of scanner ([#854](https://github.com/sysdiglabs/charts/issues/854))
# v1.8.16
### New Features
* **node-analyzer** [c351cf9](https://github.com/sysdiglabs/charts/commit/c351cf97b6ac5897167021699755a015eeb59005): release HostScanner 0.3.2  ([#847](https://github.com/sysdiglabs/charts/issues/847))
# v1.8.15
### New Features
* **node-analyzer** [c0a3768](https://github.com/sysdiglabs/charts/commit/c0a3768d53e292c1f124b1da795b8b2a177170f9): Update legacy engine NIA/HostAnalyzer component with security updates ([#844](https://github.com/sysdiglabs/charts/issues/844))

    * Security updates (December 2022) for NodeImageAnalyzer and HostAnalyzer components
# v1.8.14
### New Features
* **node-analyzer** [05728e3](https://github.com/sysdiglabs/charts/commit/05728e35705e99b979c4f6f2a523cc40367d9b51): release HostScanner 0.3.1 ([#783](https://github.com/sysdiglabs/charts/issues/783))

    * * HostScanner, bumped to version 0.3.1 which brings:
        * Security fix for CVE-2022-32149
        * Support for GoogleCOS hosts non-os packages scan
        * Added `nodeAnalyzer.hostScanner.additionalDirsToScan` value to set additional folders to be scanned besides the default ones
        * Added new entries to the default set of directories to be scanned
            * Generic binaries (such as docker/containerd and infra tooling)
                * /bin,/sbin,/usr/bin,/usr/sbin,/usr/share,/usr/local
            * Libraries (such as default python libs)
                * /usr/lib,/usr/lib64
            * GoogleCOS tooling directories
                * /var/lib/google,/var/lib/toolbox,/var/lib/cloud
# v1.8.12
### New Features
* **node-analyzer** [90766bb](https://github.com/sysdiglabs/charts/commit/90766bbd66297671da37136503aef6d578b81e6b): runtimescanner bump to 1.4.1 ([#836](https://github.com/sysdiglabs/charts/issues/836))

## v1.8.12
### Minor changes
* RuntimeScanner: bump to version 1.4.1. Fixed 1 CVE:
  * CVE-2022-41717

# v1.8.11
### Bug Fixes
* **kspm-analyzer** [388dcdf](https://github.com/sysdiglabs/charts/commit/388dcdfb90c2834e09f0802370b521ce5b99570c): longer initial delay on analyzer startup probe ([#827](https://github.com/sysdiglabs/charts/issues/827))
# v1.8.10
### Documentation
* **node-analyzer** [1e0fb04](https://github.com/sysdiglabs/charts/commit/1e0fb04e90d6c88d22e3811fd312a8cf2378f26a): adding the new container and host scanner ([#797](https://github.com/sysdiglabs/charts/issues/797))
# v1.8.8
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))

This file documents all notable changes to Sysdig Node Analyzer Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

## 1.8.7
* bump kspm-analyzer to version 1.14.0

## 1.8.6
* namespace added to all namespaced resources

## 1.8.5
* BenchmarkRunner
    * bump to version 1.1.0.5

## 1.8.4
### Minor changes:
* Add deployment test to node analyzer chart

## 1.8.3
### Minor changes:
* BenchmarkRunner
    * bump to version 1.1.0.4

# v1.8.2
### Minor changes
* Updated chart icon

# v1.8.1
### Minor changes
* NodeAnalyzer:
    * NodeImageAnalyzer: bump to version 0.1.21 which contains security updates (November 2022). Fixed 21 CVEs in total, the ones with high or critical severity are:
        * CVE-2022-1941
        * CVE-2022-1996
        * CVE-2022-27191
        * CVE-2022-27664
        * CVE-2022-29361
        * CVE-2022-32149
        * CVE-2022-3515
        * CVE-2022-39237
        * CVE-2022-40674
    * HostAnalyzer: bump to version 0.1.13 (November 2022)

# v1.8.0
### Minor changes
* HostScanner: added to deamonset

## v1.7.48
### Minor changes
* RuntimeScanner: bump to version 1.4.0
	* path for nested java packages now reflect the nesting
	* fix for sporadic deadlocks when analyzing Java packages
	* added AcceptRisk support

## v1.7.47
### Minor changes
* Do not add psp policy to clusterrole if k8s > 1.25

## v1.7.46
### Minor changes
* Added `node-role.kubernetes.io/control-plane` toleration

## v1.7.45
### Minor changes
* Added negative test case to check incorrect sysdig region input, also added code changes to fail on wrong sysdig region input.

## v1.7.44
### Minor changes
* Updated override helm tests to include extra testcases.

## v1.7.43
### Minor changes
* Readme changes to indicate helm unit testing.

## v1.7.42
### Minor changes
* Added golden template tests

## v1.7.41
### Minor changes
* Added unit tests to check conditional flag testing

## v1.7.40
### Minor changes
* Added unit tests for testing labels

## 1.7.39
### Minor changes:
* BenchmarkRunner
    * bump to version 1.1.0.3

## v1.7.38
### Minor changes
* Added toleration doc on node-analyzer chart

## v1.7.37
### Minor change:
* Fixed .helmignore to not exclude chart tests when packaging the node-analyzer chart

## v1.7.36
### Minor changes:
* NodeAnalyzer:
    * RuntimeScanner: bump to version 1.3.0
        * fixes CVE-2022-32149
        * fixes CVE-2022-39237
        * add support for rhel9-based OSes

## v1.7.35
### Minor changes:
* Added unit tests for testing helm install commands in readme

## v1.7.34
### Minor changes:
* Added unit tests to check local overrides of global values

## v1.7.33

### Minor changes:
* KSPMAnalyzer:
    * Added liveliness and readiness probes.
    * All capabilities are now dropped.
    * Bumped image tag to 1.13.0
## v1.7.32
### Minor changes:
* NodeAnalyzer:
    * Runtimescanner: added ARM64 support

## 1.7.31
### Minor changes:
* BenchmarkRunner
    * bump to version 1.1.0.2

## v1.7.30

### Minor changes:
* Tests: Added helm unit test to check collector_endpoint value set because of different region inputs.

## v1.7.29

### Minor changes:
* KSPMAnalyzer: bump tag to 1.11.0

## v1.7.28

### Minor changes:
* NodeAnalyzer:
    * Replaced nodeAnalyzer.labels with daemonset.labels similar to how agent chart works to make it more consistent for customers.

## v1.7.27
### Minor changes:
* NodeAnalyzer:
    * NodeImageAnalyzer: bump to version 0.1.20 which contains security updates (October 2022)
        * CVE-2022-1941
        * CVE-2022-1996
        * CVE-2022-3515
        * CVE-2022-27191
        * CVE-2022-27664
        * CVE-2022-32149
        * CVE-2022-39237
        * CVE-2022-40674
    * HostAnalyzer: bump to version 0.1.12 which contains security updates (October 2022)
        * CVE-2022-27664
        * CVE-2022-32149

## v1.7.26
### Minor changes:
* BenchmarkRunner
    * multiarch builds
    * support arm64 hosts
    * bump to version 1.1.0.1

## v1.7.25
### Major changes:
* EveConnector:
    * Introduced proxy support
### Buxfix
* RuntimeScanner:
    * Fixed an issue where runtime scanner was not leverage on global proxy setting

## v1.7.24
### Minor changes:
* EveConnector:
    * bump to 1.1.0 version
### Bugfix
* EveConnector:
    * reduce the size of the image
    * bump dependencies to resolve critical and high vulnerabilities:
      * CVE-2022-1996
      * CVE-2022-1271
      * CVE-2022-2526
      * CVE-2022-3515

## v1.7.23
### Minor changes:
* RuntimeScanner:
    * bump to 1.2.13 version
### Bugfix
* RuntimeScanner:
    * fix jar parser to avoid duplicated pkgs

## v1.7.22
### Minor changes
* RuntimeScanner:
    * bump to 1.2.12 version
    * update vulnerable packages
    * bump to 1.19 Go version
### Bugfix
* RuntimeScanner:
    * fix container-storage locks

## v1.7.20
### Minor changes
* KSPMAnalyzer: bump tag to 1.9.0

## v1.7.19
### Minor changes
* RuntimeScanner: Added ability to support storage class for ephemeral storage.

## v1.7.18
### Minor changes
* BenchmarkRunner: bump tag to 1.0.19.0

## v1.7.17
### Bug fix
* Readme held incorrect values for runtimeScanner resources

## v1.7.16
### Bugfix
* Don't deploy psp policies on k8s 1.25.x

## v1.7.15
### Minor changes
* RuntimeScanner:
    * bump to 1.2.10 version
    * add image size and storage info to warning log

## v1.7.14
### Minor changes
* RuntimeScanner:
	* bump to 1.2.9 version
  	* configurable thresholds for maxFileSize and maxImageSize. Bigger files/images will be skipped
	* logging about the skipping of a file to be analysed changed from error to warning.

## v1.7.13
### Minor changes
* Added a global gke autopilot flag


## v1.7.12
### Minor changes
* HostAnalyzer: fixed certificates issue introduced in 0.1.10

## v1.7.11
### Minor changes
* RuntimeScanner: bumped to 1.2.8 with a fix regarding the dpkg packages version used to match vulnerabilities.

## v1.7.10
### Minor changes
* Security updates (August 2022) for NodeImageAnalyzer and HostAnalyzer components

## v1.7.9
### Minor changes
* RuntimeScanner: bumped to 1.2.7 which:
  * removed the old golang analyzer based on the go.sum files. Only go packages from binary will be analyzed.
  * fixes several bugs in loading images into openshift clusters.
  * improve memory consumption.

## v1.7.8
### Minor changes
* KSPMAnalyzer: bump tag to 1.8.0

## v1.7.7
### Minor changes
* KSPMAnalyzer: bump tag to 1.7.0

## v1.7.6
### Minor changes
* kspm-analyzer: Fixed configmap reference for environment variables

## v1.7.5
### Minor changes
* BenchmarkRunner: bump tag to 1.0.18.2

## v1.7.4
### Minor changes
* RuntimeScanner: bumped to 1.2.6 with fix of ignoring the fix solution date of a vuln when no fix version is available

# v1.7.3

### Minor changes
* kspm-analyzer: fixed agent_app_name value and support the arm64 architecture

# v1.7.2

### Minor changes
* Readme fixes

# v1.7.1

### Minor changes
* BenchmarkRunner: bump tag to 1.0.18.1

# v1.7.0

### Minor changes
* Add flags for disabling image analyzer, benchmark runner, host analyzer separately

## v1.6.0

### Minor changes
* Changed the names of configmaps and other resources to remove the redundant `nodeanalyzer` string
* Fixed the ClusterRole reference to the wrong podsecuritypolicy name
* Updated daemonset selector label to be less repetitive

# v1.5.14
### Minor changes
* KSPMAnalyzer: support proxy

## v1.5.13
### Minor changes
* RuntimeScanner: bumped to 1.2.5 with fixes on ruby file analyzer

## v1.5.12
### Minor changes
* Added helper to accomodate agent configmapname

## v1.5.11
### Minor changes
* RuntimeScanner: bumped to 1.2.4 with fixes on tmp dirs to be used during analysis

## v1.5.10
### Bugfixes
* Removed duplicate labels from deployment of `app.kubernetes.io/instance`

## v1.5.9
### Minor changes
* RuntimeScanner: bumped to 1.2.3 with fixes on java file analyzer

## v1.5.8
### Minor changes
* RuntimeScanner: bumped to 1.2.2 (performance improvement in pkgmeta client)

## v1.5.7
### Minor changes
* NodeImageAnalyzer: bumped to 0.1.18
* HostAnalyzer: bumped to 0.1.9
* RuntimeScanner: bumped to 1.2.0

## v1.5.6
### Bugfixes

* KSPM: Fix Analyzer nats url

## v1.5.5
### Bugfixes

* KSPM: Bumped image tag to 1.5.0

## v1.5.4
### Bugfixes

* Fix kspm-analyzer access key env

## v1.5.3
### Bugfixes

* Require apiEndpoint when region is custom
* Fix typo in clusterName helper call

## v1.5.2
### Minor changes
* KSPM Analyzer - fix container missing CPU\Memory limits & requests
* KSPM components - merge analyzer and collector deploy flags into 1

## v1.5.1
### Minor changes
* BenchmarkRunner: bump tag to 1.0.17.2

## v1.5.0
### Major change
* KSPMAnalyzer: rename cspm-analyzer to kspm-analyzer

### Minor changes
* KSPMAnalyzer: add documentation on port configuration
* KSPMAnalyzer: update image tag to 1.4.0

## v1.4.3
### Minor change

Update chart to match `sysdig v1.14.34`

## v1.4.2
### Minor change

* RuntimeScanner: added nodeAnalyzer.runtimeScanner.extraMounts for handle non-standard socket paths

## v1.4.1
### Minor change

* CSPM support AKS

## v1.4.0
### Major change

* Add CSPM Analyzer to Daemonset

## v1.3.0
### Bugfixes
* Additional bugfixes on the runtime Scanner
* RuntimeScanner provides correct image name in containerd environments
* RuntimeScanner provides correct image digest in dockerd environments

### Minor Changes

* Fix runtime-scanner `eve_enabled` check in configmap
* Release of runtime scanner 1.0.0
* RuntimeScanner: reduced and better disk usage for temporary files
* RuntimeScanner: added support for Runtime policies
* Added CRI-O support for runtime-scanner
* Improved runtime-scanner memory usage
* Updated runtime-scanner to the latest version

## v1.2.0

* Add `global.sysdig.region` variable for automatically determining collector endpoint

## v1.1.0

### Minor Changes

* Use global proxy settings when provided

## v1.0.0

### Major Changes

* Deploy only the Sysdig Node Analyzer and associated resources
