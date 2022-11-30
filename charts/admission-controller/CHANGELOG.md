# Chart: Admission Controller

## Change Log

This file documents all notable changes to the Admission Controller Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

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
