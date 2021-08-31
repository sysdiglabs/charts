# Chart: Sysdig Registry Scanner

## Change Log

This file documents all notable changes to Sysdig Registry Scanner. The release
numbering uses [semantic versioning](http://semver.org).

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
