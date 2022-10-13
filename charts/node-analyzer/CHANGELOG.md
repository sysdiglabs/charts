# Chart: Node Analyzer

## Change Log

This file documents all notable changes to Sysdig Node Analyzer Helm Chart. The release numbering uses [semantic versioning](http://semver.org).
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
