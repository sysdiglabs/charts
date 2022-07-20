# Chart: sysdig-deploy

## Change Log

This file documents all notable changes to Sysdig's sysdig-deploy Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

## v1.1.4

### Bugfixes

* Bumped rapid-response sub-chart version to 0.2.0

## v1.1.3

### Bugfixes

* Bumped agent sub-chart version to 1.5.9

## v1.1.2

### Bugfixes

* Bumped agent sub-chart version

## v1.1.1

### Minor changes

* Bumped rapid-response sub-chart version

## v1.1.0

### Major changes

* Introduced rapidResponse helm chart

## v1.0.8

### Bugfixes

* Version bump of sub-charts on `Chart.yaml`

## v1.0.7

### Minor changes

* Chart output clarity improved
* README now includes links to the chart components

## v1.0.6

### Minor changes

* Added autopilot instructions

## v1.0.5

### Bugfixes

* Fix global.sysdig.region behavior for on-prem
* Add some clarity to readme
* Increment kspm dependencies versions with access key bug fix

## v1.0.4

### Minor changes

* Fixed the `monitorUrl` address in the helm chart install notes for certain SaaS regions

## v1.0.3

### Minor changes

* KSPM Analyzer - fix container missing CPU\Memory limits & requests
* KSPM components - Merge analyzer and collector deploy flags into 1

## v1.0.1

### Minor changes

* Modified the maintainer list for this chart.
* Helm chart install notes now take into account the region in the links where it is deployed.
