# Chart: Sysdig Registry Scanner

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v0.1.19
### Bug Fixes
* **registry-scanner** [990ad5f](https://github.com/sysdiglabs/charts/commit/990ad5f97a4619c3a2928be67beb3ca302386467): insecure tls connections ([#972](https://github.com/sysdiglabs/charts/issues/972))
# v0.1.18
### Bug Fixes
* **registry-scanner** [ef5bb18](https://github.com/sysdiglabs/charts/commit/ef5bb18f06ab9ea03eb5d13a4be1d2da58c49d3f): fix installation in EKS ([#969](https://github.com/sysdiglabs/charts/issues/969))
# v0.1.17
# v0.1.16
# v0.1.15
# v0.1.14
# v0.1.13
### Chores
* **registry-scanner** [f182507](https://github.com/sysdiglabs/charts/commit/f182507d3a81154978a49bd0f1eaa25555d2d332): tests and logs ([#951](https://github.com/sysdiglabs/charts/issues/951))
# v0.1.12
### New Features
* **registry-scanner,ci** [901981f](https://github.com/sysdiglabs/charts/commit/901981fd4931bffac2236bb26aa9837d942ca6b9): add test for registry-scanner ([#947](https://github.com/sysdiglabs/charts/issues/947))
# v0.1.11
### New Features
* **registry-scanner** [9d26281](https://github.com/sysdiglabs/charts/commit/9d262815a76e1ea37377ed895d2732bb686be48f): add scanOnStart ([#949](https://github.com/sysdiglabs/charts/issues/949))
# v0.1.10
### New Features
* **registry-scanner** [bb1e039](https://github.com/sysdiglabs/charts/commit/bb1e0392124130d2df2242c6ae8b015300a65ec3): add logging ([#943](https://github.com/sysdiglabs/charts/issues/943))
# v0.1.9
### Bug Fixes
* **registry-scanner** [e033969](https://github.com/sysdiglabs/charts/commit/e0339692514de08cbcff7a34cb78d99507e355ca): fix if exist memberAccountsRoleName ([#942](https://github.com/sysdiglabs/charts/issues/942))
# v0.1.8
### New Features
* **registry-scanner** [e76c266](https://github.com/sysdiglabs/charts/commit/e76c26685d9b22a060fe5aff859c12612644a5bf): add options for ecr organization custom setup ([#929](https://github.com/sysdiglabs/charts/issues/929))
# v0.1.7

### Chores
* **registry-scanner** [6450b90](https://github.com/sysdiglabs/charts/commit/6450b9080f3de6b03c3c1b1eeabf0c7770063d73): bump registry scanner image version  to 0.2.3, which includes

#### Performance optimizations
* feat: Update CC so we have image cache by @tembleking in https://github.com/sysdiglabs/registry-scanner/pull/87
* perf: Implement parallelization in metadata retrieval by @tembleking in https://github.com/sysdiglabs/registry-scanner/pull/91

#### Bug fixes
* fix(aws-ecr): region fetch from registry url by @wideawakening in https://github.com/sysdiglabs/registry-scanner/pull/89

# v0.1.6
### Documentation
* **registry-scanner** [95495b8](https://github.com/sysdiglabs/charts/commit/95495b84911d63c69401ec96aad9a194bf939983): fix value documentation ([#902](https://github.com/sysdiglabs/charts/issues/902))
# v0.1.5
### Chores
* **registry-scanner** [6e4eb50](https://github.com/sysdiglabs/charts/commit/6e4eb50f4ddec185cabac4a892d978c55d927231): bump registry scanner image version ([#856](https://github.com/sysdiglabs/charts/issues/856))
# v0.1.4
### Chores
* **registry-scanner** [6450b90](https://github.com/sysdiglabs/charts/commit/6450b9080f3de6b03c3c1b1eeabf0c7770063d73): bump registry scanner image version ([#833](https://github.com/sysdiglabs/charts/issues/833))
# v0.1.3
### Chores
* **registry-scanner** [df88b05](https://github.com/sysdiglabs/charts/commit/df88b05aff423e11b3b2fa7fb8e27598e23e7785): Update default cronjob schedule to 6AM on Saturdays ([#830](https://github.com/sysdiglabs/charts/issues/830))
# v0.1.2
### Documentation
* **registry-scanner** [496466e](https://github.com/sysdiglabs/charts/commit/496466e333330ae479bba17f2ce224af7c822e07): auto generate documentation file readme ([#806](https://github.com/sysdiglabs/charts/issues/806))
# v0.1.1
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))

## v0.1.0

### Major changes

* Bump registry-scanner version to 0.2.0:
  - Append https in artifactory api url if user doesn't specify protocol
  - Update artifactory authentication method to not increment downloads counter (See https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-RetrieveArtifact)
  - Add ECR as new registry type supported

## v0.0.36

* Enhance chart documentation

## v0.0.35

### Minor changes

* Bump registry-scanner version to 0.1.11 (Update gem deps)
* Experimental an unsupported feature to activate the new vm beta image scanning

## v0.0.34

### Minor changes

* Removed trailing spaces

## v0.0.33

### Minor changes

* Bump registry-scanner version to 0.1.9 (fix memory leak issue)

## v0.0.32

### Minor changes

* Fix duplicate labels in the CronJob template (thanks @firaxis)

## v0.0.31

### Minor changes

* Bump registry-scanner version to 0.1.8:
* Fix a race condition when using multiple workers

## v0.0.30

### Minor changes

* Bump registry-scanner version to 0.1.7:
  * Support insecure registries

## v0.0.29

### Minor changes

* Bump registry-scanner version to 0.1.6:
  * Include break down of policies, stops and warns in report
  * Do not stop the scanning if the retrieval of a single image tag fails
  * Fix: artifactory auth if api are on a different subdomain

## v0.0.28

### Minor changes

* Bump registry-scanner version to 0.1.5
* Add ssl.ca.certs option to provide custom rootCA's to be trusted

## v0.0.27

### Minor changes

* Bump registry-scanner version to 0.1.4
* Add custom labels option to provide labels that will be add to k8s manifests
* Add securityContext option to configure security context for inline scanner container

## v0.0.26

### Minor changes

* Bump registry-scanner version to 0.1.3


## v0.0.25

### Minor changes

* Bump registry-scanner version to 0.1.1

## v0.0.24

### Minor changes

* Bump registry-scanner version to 0.1.0

## v0.0.23

### Minor changes

* Bump registry-scanner version to 0.0.9
* Propagate imagePullSecrets to the scan.pullSecrets option for inline-scanner

## v0.0.22

### Minor changes

* Bump registry-scanner version to 0.0.8

## v0.0.21

### Minor changes

* Bump registry-scanner version to 0.0.7
* Add options `config.registryType` and `config.registryAccountId` for ICR

## v0.0.20

### Minor changes

* Bump registry-scanner version to 0.0.6

## v0.0.19

### Minor changes

* Bump registry-scanner version to 0.0.5

## v0.0.18

### Minor changes

* Bump registry-scanner version to 0.0.4

## v0.0.17

### Minor changes

* Use batch/v1 API for kubernetes 1.21 or higher

## v0.0.16

### Minor changes

* Bump registry-scanner version to 0.0.3

## v0.0.15

### Minor changes

* New option `reportToPersistentVolumeClaim` to write the JSON report to a persistent volume claim.

## v0.0.14

### Minor changes

* Option `config.scan.inlineScanImage` to override inline scanner image (i.e. air gap environments)
* Bump registry-scanner version to 0.0.2
* Use Kubernetes Job smaller registry-scanner image
* Use batch/v1 instead of batch/v1beta1 for Kubernetes 1.21+

## v0.0.13

### Minor changes

* Use a fixed registry-scanner version (appVersion in chart.yaml) instead of latest

## v0.0.12

### Fixes

* Fix docker.io always preprended to inage name

### Minor changes

* Report required values with an error message using `required`

## v0.0.11

### Minor changes

* Use image from quay.io/sysdig/registry-scanner and tag `latest` instead of `master`

## v0.0.10

### Minor changes

* Update registryApiUrl description in values.yaml

## v0.0.9

### Minor changes

* Typos in README

## v0.0.8

### Minor changes

* New option `config.registryApiUrl` to define the Artifactory docker API as it is exposed at a different endpoint

## v0.0.7

### Minor changes

* New option `existingSecretName` to use existing or external secret

## v0.0.5

### Minor changes

* Remove `config.reEvaluate` option

## v0.0.4

### Minor changes

Internal CI changes

## v0.0.3

### Minor changes

* Add `config.reEvaluate` option
* Add proxy settings in values.yaml

## v0.0.2

### Minor changes

* Fixes in README

## v0.0.1

Initial release
