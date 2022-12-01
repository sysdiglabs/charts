# Chart: Agent

## Change Log


## v1.5.46
### Minor changes
* Fixed links displayed in the Notes section

## v1.5.45
### Minor changes
* Updated chart icon

## v1.5.44
### Minor changes
* Do not add psp policy to clusterrole if k8s > 1.25

## v1.5.43
### Minor changes
* Added `node-role.kubernetes.io/control-plane` toleration

## v1.5.42
### Minor changes
* Added negative test case to check incorrect sysdig region input, also added code changes to fail on wrong sysdig region input.

## v1.5.41
### Minor changes
* Updated override helm tests to include extra testcases.

## v1.5.40
### Minor changes
* Readme changes to indicate helm unit testing.

## v1.5.39
### Minor changes
* Added golden template tests
## v1.5.38
### Minor changes
* Added unit tests to check conditional flag testing

## v1.5.37
### Minor changes
* Added unit tests for testing labels

## v1.5.36
### Minor changes
* Revert changes from 1.5.35 due to breaking OKD3.

## v1.5.35
### Minor changes
* Remove 'beta' from kubernets.io/arch and kubernetes.io/os in daemonset due to deprecation

## v1.5.34
### Minor changes
* Fixed .helmignore to add chart tests back when packaging the chart

## v1.5.33
### Minor changes
* Added unit tests for testing helm install commands in readme

## v1.5.32
### Minor changes
* Added unit tests to check local overrides of global values

This file documents all notable changes to the Sysdig Agent Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

## v1.5.30
### Minor changes
* Tests: Added helm unit test to check apiEndpoint value set because of different region inputs.

## v1.5.29
### Minor changes
* Usage of global tags over existing value of tags

## v1.5.28
### Minor changes
* Add aroberts87 to chart maintainers

## v1.5.27
### Minor changes
* Removed trailing spaces

## v1.5.25
### Bugfix
* Don't deploy psp policies on k8s 1.25.x

## v1.5.24
### Minor changes
* Added a global gke autopilot flag

## v1.5.23
### Minor changes
* Added certificatesigningrequests resources in agent clusterrole

## v1.5.22

### Minor changes
* Add deployment test to agent chart

## v1.5.21

### Minor changes
* Moved the clusterrole's Ingresses resource in the networking.k8s.io group

## v1.5.19

### Bugfixes
* Don't mount /etc on GKE autopilot

## v1.5.18

### Minor changes
* Added /etc to container and initContainer /host/etc volume bind

## v1.5.17

### Minor changes
* Readme fixes

## v1.5.16

### Minor changes
* Removed warning from agent chart readme

## v1.5.15

### Minor changes
* Introduced support to proxy for agent initContainer

## v1.5.14
* Documentation fix slim-agent defaults to true

## v1.5.13

### Minor changes
* Reverted change for v1.5.10 that added /etc to /host/etc volume bind.

## v1.5.11

### Minor changes
* Added helper to accomodate agent configmapname

## v1.5.10

### Minor changes
* Added /etc to container /host/etc volume bind

## v1.5.9

### Bugfix

* Fix agent container name to match previous name `sysdig`

## v1.5.8

### Bugfix

* Fixed region collector addresses for us4, au1

## v1.5.7

### Minor Changes

* Fixed README redirect

## v1.5.6

### Bugfix

* make collectorHost required when region is custom

## v1.5.5

### Bugfix

* Require collectorHost to be specified if one of the SaaS regions isn't used

## v1.4.4

### Bugfix

* fix the `agent.ebpfEnabled` helper so it doesn't always evaluate to `true`

## v1.4.3

### Minor Changes

* Strip the custom appcheck stuff out of the agent chart


## v1.1.0

### Minor Changes

* Match the sysdig charts where the agent portion was updated up to version 1.12.70 from 1.12.56

## v1.0.0

### Major Changes

* Deploy only the Sysdig Agent daemonset and associated resources
* Automatically detect COS nodes and enable eBPF
* Use global common values for access key and cluster name
