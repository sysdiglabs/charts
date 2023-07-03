# Chart: Cloud Connector

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.


## Change Log
# v0.8.1
* fix for "found definition of rule called <rule> in append mode before the definition of the actual rule"

# v0.8.0
### New Features
* **admission-controller,agent,cloud-bench,cloud-connector,cloud-scanning,harbor-scanner-sysdig-secure,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig,sysdig-deploy,sysdig-mcm-navmenu,sysdig-stackdriver-bridge** [5d99a03d](https://github.com/sysdiglabs/charts/commit/5d99a03dced132b4771dde1ce5b90b63c518b408): use a PGP private key to sign charts on release ([#1170](https://github.com/sysdiglabs/charts/issues/1170))

# v0.7.25
* fix: CVE-2023-2253
* chore(internal): filter out non-related rules files from policies response

# v0.7.24
* chore: bump scanning/v2/pkg to latest version with correct cache import
* chore: bump docker dependency, Including fix for github.com/docker/docker CVE-2023-28840 Go vulnerability
* fix: exceptions for falco engine
* fix: gcp resourceMgr instantiation
* feat: compile rules binary statically
* feat: add query parameter to include preview rules data
* feat: conform scan result labels to what reporting expects
* feat: feat: enable retrier for registry
* fix: make loader append exceptions even if the original did not contain one
* fix: use insecure skip tls flag in image fetcher, if provided
* feat: add support for reverse falco exception appending
* docs: logs for registry-scanner
* chore: remove xnet vulns
* chore: remove unused eks/k8s image scanner
* feat: return the account when authenticating on ecr
# v0.7.23
# v0.7.22
### Chores
* **cloud-connector** [9d3702d](https://github.com/sysdiglabs/charts/commit/9d3702d745ccbc1d280b7f20c4fff93de33b2a45): Update version to 0.16.26 ([#898](https://github.com/sysdiglabs/charts/issues/898))
# v0.7.21
### Chores
* **cloud-connector** [91d27cd](https://github.com/sysdiglabs/charts/commit/91d27cd64a4021a20ec17e0e03ab6650811ca227): Update version to 0.16.25 ([#891](https://github.com/sysdiglabs/charts/issues/891))
# v0.7.20
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))

# cloud-connector-0.16.22

Features
Disable bruteforce until explicitly specified

# cloud-connector-0.7.16

## Documentation
- changelog addition
