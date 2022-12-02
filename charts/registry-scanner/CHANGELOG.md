# Chart: Sysdig Registry Scanner

## Change Log

This file documents all notable changes to Sysdig Registry Scanner. The release
numbering uses [semantic versioning](http://semver.org).

## v0.0.36

* Enhance chart documentation

## v0.0.35

### Minor changes

* Bump registry-scanner version to 0.1.11 (Update gem deps) 
* Experimental and unsupported feature to activate the new vm beta image scanning 

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
