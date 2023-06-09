# Chart: Admission Controller

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
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
