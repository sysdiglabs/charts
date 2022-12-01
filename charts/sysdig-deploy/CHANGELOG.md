# Chart: sysdig-deploy

## Change Log

This file documents all notable changes to Sysdig's sysdig-deploy Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

## 1.5.8
### Minor changes:
* Fixed notes failing when custom option is provided.

## 1.5.7
### Minor changes:
* node-analyzer
  * bump to version 1.8.3

## v1.5.6
### Minor changes
* agent
    * Fixed links displayed in the Notes section
* Fixed links displayed in the Notes section

## v1.5.4
### Minor changes
* admission-controller:
  * bump dependency to ~0.7.14

## v1.5.2
### Minor changes
* Updated chart icon

## v1.5.1
### Minor changes
* node-analyzer:
	* bump dependency to ~1.8.1

## v1.5.0
### Minor changes
* Add new HostScanner component to nodeAnalyzer chart
* Add `global.sysdig.tags` to chart values

## v1.4.32
### Minor changes
* node-analyzer:
	* bump dependency to ~1.7.48

## v1.4.31
### Minor changes
* agent
    * Do not add psp policy to clusterrole if k8s > 1.25
* node-analyzer
    * Do not add psp policy to clusterrole if k8s > 1.25

## v1.4.30
### Minor changes
* agent
    * Added `node-role.kubernetes.io/control-plane` toleration
* node-analyzer
    * Added `node-role.kubernetes.io/control-plane` toleration
* rapid-response
    * Added `node-role.kubernetes.io/control-plane` toleration

## v1.4.29
### Major changes
* RapidResponse:
  * Added support to custom CA certificates
### Bugfix
* RapidResponse:
  * Fixed missing tolerations, this was preventing Rapid Response to be deployed on control plane nodes

## v1.4.28
* agent
    * Added negative test case to check incorrect sysdig region input, also added code changes to fail on wrong sysdig region input.
* node-analyzer
    * Added negative test case to check incorrect sysdig region input, also added code changes to fail on wrong sysdig region input.

## v1.4.27
### Minor changes
* admission-controller
    * Updated override helm tests to include extra testcases.
* agent
    * Updated override helm tests to include extra testcases.
* kspm-collector
    * Updated override helm tests to include extra testcases.
* node-analyzer
    * Updated override helm tests to include extra testcases.
* rapid-response
    * Updated override helm tests to include extra testcases.

## v1.4.26
* kspm-collector
    * Readme small fix to helm unit test command

## v1.4.25
### Minor changes
* admission-controller
    * Readme changes to indicate helm unit testing.
* agent
    * Readme changes to indicate helm unit testing.
* kspm-collector
    * Readme changes to indicate helm unit testing.
* node-analyzer
    * Readme changes to indicate helm unit testing.
* rapid-response
    * Readme changes to indicate helm unit testing.

## v1.4.24
### Minor changes
* admission-controller
    * Added golden template tests
* agent
    * Added golden template tests
* kspm-collector
    * Added golden template tests
* node-analyzer
    * Added golden template tests
* rapid-response
    * Added golden template tests

## v1.4.23
### Minor changes
* admission-controller
    * Added unit tests to check conditional flag testing
* agent
    * Added unit tests to check conditional flag testing
* kspm-collector
    * Added unit tests to check conditional flag testing
* node-analyzer
    * Added unit tests to check conditional flag testing

## v1.4.22
### Minor changes
* admission-controller
    * Added unit tests for testing labels
* agent
    * Added unit tests for testing labels
* kspm-collector
    * Added unit tests for testing labels
* node-analyzer
    * Added unit tests for testing labels
* rapid-response
    * Added unit tests for testing labels

## v1.4.21
### Minor changes:
* node-analyzer
    * bump to version 1.7.39

## v1.4.20
### Minor changes
* admission-controller
  * Add option to specify additional labels

## v1.4.16
### Minor changes
* node-analyzer
  * Added toleration doc on node-analyzer chart

## v1.4.15
### Minor changes
* agent
  * Fixed .helmignore to add chart tests back when packaging the agent chart
* node-analyzer
  * Fixed .helmignore to not exclude chart tests when packaging the node-analyzer chart

## v1.4.13
### Minor changes
* admission-controller:
  * bump to version 0.7.5

## 1.4.12
### Minor changes
* NodeAnalyzer:
  * bump to version 1.7.35

## v1.4.11
### Minor changes
* admission-controller:
    * Added unit tests to check local overrides of global values

## v1.4.10
### Minor changes
* agent:
    * Added unit tests for testing helm install commands in readme
* node-analyzer:
    * Added unit tests for testing helm install commands in readme
* sysdig-deploy:
    * Added unit tests for testing helm install commands in readme

## v1.4.9
### Minor changes
* kspm-collector:
  * bump to version 0.1.18

## v1.4.8
### Minor changes
* RapidResponse:
  * bump to version 0.3.6

## v1.4.7
### Minor changes
* admission-controller:
    * Add proper validation check for Secure API Token

## v1.4.6
### Minor changes
* agent:
    * Added unit tests to check local overrides of global values
* node-analyzer:
    * Added unit tests to check local overrides of global values
* kspm-collector:
    * Added unit tests to check local overrides of global values
* rapid-response:
    * Added unit tests to check local overrides of global values

## v1.4.5
### Feature
* Reduced privileges for kspm-collector
* Liveliness and health probes for kspm-collector and kspm-analyzer

## v1.4.4
### Feature
* Add imagePullSecret flag for kspm-collector

## v1.4.3
### Minor changes
* admission-controller:
    * Fix bug while using secureAPITokenSecret, removed hard requirement for secureAPIToken

## v1.4.2
### Minor changes
* Add ironashram to chart maintainers

## v1.4.1
### Minor changes:
* node-analyzer bumping version to 1.7.32

## v1.4.0
### Major changes:
* sysdig-deploy:
    * Introduce admission-controller as chart dependency
* admission-controller:
    * Support global values
    * Add namespace field to all resources

## v1.3.41
### Minor changes:
* node-analyzer bumping version to 1.7.31

## v1.3.40
### Minor changes:
* sysdig-deploy:
    * Updated readme.md file

## v1.3.39
### Minor changes:
* node-analyzer:
    * Tests: Added helm unit test to check collector_endpoint value set because of different region inputs.
* agent:
    * Tests: Added helm unit test to check apiEndpoint value set because of different region inputs.

## v1.3.38
### Minor changes
* RapidResponse:
  * bump to version 0.3.5

## v1.3.37
### Minor changes:
* sysdig-deploy:
    * Readme changes includes a better more clarified sysdig-deploy install command

## v1.3.36
### Minor changes:
* node-analyzer bumping version to 1.7.29
* kspm-collector bumping version to 0.1.14

## v1.3.35

### Minor changes
* Bumped nodeanalyzer to 1.7.28. Made nodeanalyzer labels consistent with agent.

## v1.3.34
### Minor changes
* sysdig-deploy:
    * Fix migrate_values.py link

## v1.3.33
### Minor changes
* Bumped agent to 1.5.29 to include the usage of global.sysdig.tags
* Added note for override of global tag over a local tag

## v1.3.32
### Minor changes
* Add aroberts87 to chart maintainers

## v1.3.31
### Minor changes:
* node-analyzer bumping version to 1.7.27

## v1.3.30
### Minor changes:
* node-analyzer bumping version to 1.7.26

## v1.3.29
### Major changes:
* EveConnector:
    * Introduced proxy support
### Buxfix
* RuntimeScanner:
    * Fixed an issue where runtime scanner was not leverage on global proxy setting

## v1.3.28
### Minor changes
* node-analyzer bumping version to 1.7.24

## v1.3.27
### Minor changes
* kspm-collector bumping version to 0.1.13

## v1.3.26
### Minor changes
* node-analyzer bumping version to 1.7.23

## v1.3.25
### Minor changes
* RapidResponse:
    * bump to version 0.3.4

## v1.3.24
### Minor changes
* Added rapid-response doc in sysdig-deploy README.md

## v1.3.23
### Minor Changes
* agent bumping version to 1.3.23

## v1.3.22
### Minor Changes
* node-analyzer bumping version to ~1.7.19

## v1.3.21
### Minor Changes
* Bumped nodeAnalyzer to 1.7.18
* Bumped benchmark runner to 1.0.19.0

## v1.3.20
### Minor changes
* CI workflow testing with kind cluster replaced with k3s.

## v1.3.19
### Bug fix
* node-analyzer readme held incorrect values for runtimeScanner resources

## v1.3.18
### Bugfix
* Don't deploy psp policies on k8s 1.25.x

## v1.3.17
### Minor changes
* Added a global gke autopilot flag

## v1.3.16
### Minor changes
* Added cerftificatesigningrequests resources to clusterrole

## v1.3.15

### Minor changes
* Updating kspm-collector minimum version to 0.1.10

## v1.3.14

### Minor changes
* Add deployment test to agent chart

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
