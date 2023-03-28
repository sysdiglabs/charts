# Chart: Node Analyzer

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
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
