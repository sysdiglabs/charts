# Chart: Admission Controller

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
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
