# Chart: sysdig-deploy

## Change Log

This file documents all notable changes to Sysdig's sysdig-deploy Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

## v1.3.14
### Minor changes
* Added cerftificatesigningrequests resources to clusterrole

## v1.3.13

### Minor changes
* Bumped nodeAnalyzer to 1.7.8
* Bumped kspm-collector to 0.1.9

## v1.3.12

### Minor changes
* Bumped nodeAnalyzer to 1.7.7
* Bumped kspm-collector to 0.1.8

## v1.3.11

### Minor changes
* Bumped nodeAnalyzer to 1.7.6

## v1.3.10

### Minor changes
* Bumped nodeAnalyzer to 1.7.5
* Bumped benchmark runner to 1.0.18.2 

## v1.3.8

### Minor changes
* Fix indentation for install steps in README.md

## v1.3.7

### Minor changes
* Don't mount /etc for GKE autopilot
* Update agent chart version

## v1.3.6

### Minor changes
* Bumped node-analyzer to 1.7.4
* Bumped kspm-collector to 0.1.7

## v1.3.5

### Minor changes
* Added /etc to container and initContainer /host/etc volume bind

## v1.3.4

### Bugfix
* Previous change introduced a default to `global.imageRegistry`, breaking chart-specific overrides

## v1.3.3

### Bugfix
* Fix readme to refer to `global.imageRegistry`

## v1.3.2

### Minor changes
* Readme fixes
* Bumped nodeAnalyzer to 1.7.2
* Bumped agent to 1.5.17

## v1.3.1

### Minor changes
* Bumped benchmark runner to 1.0.18.1 and the node-analyzer to 1.7.1

## v1.3.0

### Minor changes
* Bumped nodeAnalyzer to 1.7.0

## v1.2.1

### Minor changes
* Bumped agent to 1.5.16

## v1.2.0

### Minor changes
* Changed the names of configmaps and other resources to remove the redundant `nodeanalyzer` string
* Fixed the ClusterRole reference to the wrong podsecuritypolicy name
* Updated daemonset selector label to be less repetitive

## v1.1.13
* Bumped agent to 1.5.15

## v1.1.12
* Bumped agent to 1.5.14

## v1.1.11
* Bumped node-analyzer to 1.5.14
* Bumped kspm-collector to 0.1.6

## v1.1.10
* Bumped agent to 1.5.13

## v1.1.9
* Bumped agent to 1.5.12

## v1.1.8

### Minor Changes
* Bumped agent to 1.5.11
* Bumped node-analyzer to 1.5.12
* Accomodate global agent configmapname variable

## v1.1.7

### Bugfixes

* Bumped node-analyzer to 1.5.10
* Bumped kspm-collector to 0.1.5

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
