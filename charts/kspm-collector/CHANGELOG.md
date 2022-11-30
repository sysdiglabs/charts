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
