# Chart: Agent

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v1.7.5
### Bug Fixes
* **agent** [2024f12](https://github.com/sysdiglabs/charts/commit/2024f125f2bd049f63dc2309fde79afef1204dfe): Allow cointerface to be enabled in daemonset agents in delegated agent deployment ([#1079](https://github.com/sysdiglabs/charts/issues/1079))
# v1.7.4
### Bug Fixes
* **agent** [d9cbbdd](https://github.com/sysdiglabs/charts/commit/d9cbbdde53843f11d64223b3110378f0047c8697): fix occasional k8s_coldstart block duplication and key name ([#1069](https://github.com/sysdiglabs/charts/issues/1069))
# v1.7.3
### Chores
* **agent** [44f57ac](https://github.com/sysdiglabs/charts/commit/44f57ac7742edc044d5ce5a7fbddadf2d13c8846): bump agent version to 12.14.0 ([#1076](https://github.com/sysdiglabs/charts/issues/1076))
# v1.7.2
### Bug Fixes
* **agent** [34bf2af](https://github.com/sysdiglabs/charts/commit/34bf2afd26f848507cd8edff148f6253620657a9): Adjust features available in secure_light mode ([#1062](https://github.com/sysdiglabs/charts/issues/1062))
# v1.7.1
### Bug Fixes
* **agent,sysdig** [0702edd](https://github.com/sysdiglabs/charts/commit/0702eddfc46c823b8362b5f0d42e7be9d3bfe1ac): do not mount /var/lib when GKE autopilot is enabled ([#1047](https://github.com/sysdiglabs/charts/issues/1047))
# v1.7.0
### New Features
* **agent** [a44de57](https://github.com/sysdiglabs/charts/commit/a44de570eb9f124e6df2087e76ff817198a77b14): Move Agent lease permissions ([#1041](https://github.com/sysdiglabs/charts/issues/1041))
# v1.6.10
### Bug Fixes
* **agent,sysdig-deploy** [47651ab](https://github.com/sysdiglabs/charts/commit/47651ab557dd675a9daf0d3cdb0b758d63735e74): Reduce Agent mode misconfiguration from fail to NOTES output ([#1039](https://github.com/sysdiglabs/charts/issues/1039))
# v1.6.9
### Bug Fixes
* **admission-controller,agent,node-analyzer,rapid-response,registry-scanner,sysdig** [0bf9682](https://github.com/sysdiglabs/charts/commit/0bf96827ebf80d76aab61b8fa3d26b3903df220b): Improve KubeVersion Comparisons ([#1040](https://github.com/sysdiglabs/charts/issues/1040))
# v1.6.8
### Bug Fixes
* **agent** [6cefcd1](https://github.com/sysdiglabs/charts/commit/6cefcd1318c8054183afc72d8e76fd7075d0cc87): Fix dragent.yaml indentation for security block ([#1034](https://github.com/sysdiglabs/charts/issues/1034))
# v1.6.7
### Bug Fixes
* **agent** [4049502](https://github.com/sysdiglabs/charts/commit/40495021ac9daa2317b90a610f3081a43471dc0e): remove inline multiple checks that are not supported by helm 3.7 ([#1033](https://github.com/sysdiglabs/charts/issues/1033))
# v1.6.6
### Chores
* **admission-controller,agent,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig-deploy** [7f35eb1](https://github.com/sysdiglabs/charts/commit/7f35eb1f88d93fa59c2839e7fbb756e50a378bea): update helm unittest plugin ([#996](https://github.com/sysdiglabs/charts/issues/996))
# v1.6.5
### New Features
* **agent** [b97fbc8](https://github.com/sysdiglabs/charts/commit/b97fbc85a81f2d848230c63b6c49ae551551cd09): Add new monitor.enabled flag to agent chart ([#917](https://github.com/sysdiglabs/charts/issues/917))
# v1.6.4
### New Features
* **agent** [99a4b36](https://github.com/sysdiglabs/charts/commit/99a4b36bfd535264766b30ce176f4e244da0eb1f): Include /var/libs host volume mount ([#1009](https://github.com/sysdiglabs/charts/issues/1009))
# v1.6.3
### Chores
* **agent** [dc2a37a](https://github.com/sysdiglabs/charts/commit/dc2a37a2f4d63967e14874ee11c788eb7cd7fba1): bump agent version to 12.13.0 ([#1022](https://github.com/sysdiglabs/charts/issues/1022))
# v1.6.2
### New Features
* **agent** [d48ef54](https://github.com/sysdiglabs/charts/commit/d48ef54afb4c79c72d8b51a77d8e101f9d25a4f4): Add poddisruptionbudget permissions to the Agent clusterrole ([#968](https://github.com/sysdiglabs/charts/issues/968))
# v1.6.1
### Bug Fixes
* **agent** [9d7f5a4](https://github.com/sysdiglabs/charts/commit/9d7f5a43ff82ce2c6dac332c36146c2bda7516e7): Fix invalid comparison type ([#1002](https://github.com/sysdiglabs/charts/issues/1002))
# v1.6.0
### New Features
* **agent** [e3ed91f](https://github.com/sysdiglabs/charts/commit/e3ed91f82c6e5335fb56e2edb4d1f40803a16f10): Create Delegated Agent installation mechanism ([#945](https://github.com/sysdiglabs/charts/issues/945))
# v1.5.63
### Chores
* **agent** [e02fffc](https://github.com/sysdiglabs/charts/commit/e02fffce3c105b52742c7680fc1bf7d7f7765889): bump agent version to 12.12.1 ([#982](https://github.com/sysdiglabs/charts/issues/982))
# v1.5.62
### Chores
* **agent** [34ff1be](https://github.com/sysdiglabs/charts/commit/34ff1be89e4541582241b21f8790904ecf7b9f6b): bump agent version to 12.12.0 ([#974](https://github.com/sysdiglabs/charts/issues/974))
# v1.5.61
# v1.5.60
### Chores
* **agent** [f1d087f](https://github.com/sysdiglabs/charts/commit/f1d087f3533c361e30190af8cfddf29af97bc37b): bump agent version to 12.11.0 ([#927](https://github.com/sysdiglabs/charts/issues/927))
# v1.5.59
### Chores
* **agent,sysdig-deploy** [75ae713](https://github.com/sysdiglabs/charts/commit/75ae7139fa1bdb7693f0562015ddcff0a1a3f394): Update chart maintainers ([#919](https://github.com/sysdiglabs/charts/issues/919))
# v1.5.58
### Bug Fixes
* **agent** [a2891bc](https://github.com/sysdiglabs/charts/commit/a2891bc82b2cfef7be5da1d22f39f8b81b05c897): Fix agent.secure.enabled flag ([#858](https://github.com/sysdiglabs/charts/issues/858))
# v1.5.57
### New Features
* **agent,node-analyzer,rapid-response** [487b421](https://github.com/sysdiglabs/charts/commit/487b421c922e097047e5ca65c01cee466664daba): add Rancher-specific tolerations ([#884](https://github.com/sysdiglabs/charts/issues/884))
# v1.5.56
### Bug Fixes
* **agent** [6dcd65e](https://github.com/sysdiglabs/charts/commit/6dcd65ed1bc02e3c6929f0925167e803e820909b): Set agent node selector os and arch by k8s version ([#859](https://github.com/sysdiglabs/charts/issues/859))
# v1.5.55
### Documentation
* **agent,node-analyzer,sysdig,sysdig-stackdriver-bridge** [da18fe5](https://github.com/sysdiglabs/charts/commit/da18fe5e7225be9bbfc484d6dcb22987d7d08066): remove references of the deprecated --purge option for 'helm delete' ([#864](https://github.com/sysdiglabs/charts/issues/864))
# v1.5.54
### Documentation
* **agent,node-analyzer,sysdig** [bd37186](https://github.com/sysdiglabs/charts/commit/bd371864313e64d7a7ac07f79fe30f296b46d540): Remove references to Get Started in the READMEs ([#819](https://github.com/sysdiglabs/charts/issues/819))
# v1.5.53
### Chores
* **agent** [60531e5](https://github.com/sysdiglabs/charts/commit/60531e52a565b8dbf85c385d401e45661cbd54a5): bump agent version to 12.10.1
# v1.5.52
### Bug Fixes
* **agent** [ea56818](https://github.com/sysdiglabs/charts/commit/ea568182894e0803d92a9051bcd500792ee6bee2): Fix agent logPriority rendering ([#824](https://github.com/sysdiglabs/charts/issues/824))
# v1.5.51
### Bug Fixes
* **agent** [751015b](https://github.com/sysdiglabs/charts/commit/751015b713b0bd3a9a738f8e47d72cfe2167e70e): fix region us3 endpoints for agent and sysdig-deploy ([#823](https://github.com/sysdiglabs/charts/issues/823))
* **sysdig,agent** [096d6e4](https://github.com/sysdiglabs/charts/commit/096d6e4d0326f36357fec6ac61342c17e73b33ab): add extra secrets and tests ([#821](https://github.com/sysdiglabs/charts/issues/821))
# v1.5.50
### New Features
* **agent** [7df93a3](https://github.com/sysdiglabs/charts/commit/7df93a38409a902fe5372115bf8c545f84f804e9): add extra secrets ([#813](https://github.com/sysdiglabs/charts/issues/813))
# v1.5.49
### Chores
* **agent** [ede1c8e](https://github.com/sysdiglabs/charts/commit/ede1c8ebcacbf315814a272eb39f68150e1cc979): bump agent version to 12.10.0 ([#815](https://github.com/sysdiglabs/charts/issues/815))
# v1.5.48
### New Features
* **agent** [3975f58](https://github.com/sysdiglabs/charts/commit/3975f58a59bbcee90ead958939fd4722a8bf6e19): Add logPriority flag to agent chart ([#804](https://github.com/sysdiglabs/charts/issues/804))
# v1.5.47
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))


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
