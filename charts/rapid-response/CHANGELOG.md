# Chart: Rapid Response

## Change Log

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
