# Chart: Node Analyzer

## Change Log

This file documents all notable changes to Sysdig Node Analyzer Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

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
