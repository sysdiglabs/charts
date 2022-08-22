# Chart: Agent

## Change Log

This file documents all notable changes to the Sysdig Agent Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

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
