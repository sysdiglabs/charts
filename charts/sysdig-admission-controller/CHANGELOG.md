# Changelog

## 2020-11-17 Charts v1.2.1 app v1.2.1

### Minor changes

- Update README.md

## 2020-09-02 Charts v1.2.0 app v1.2.0

### Major changes

- Run container evaluation in parallel
- Add support for metadata evaluation phase - you can create rules to evaluate the image information and scan status (before retrieving Scan Report)
- Update to OpenPolicyAgent 0.23.2 

## 2020-08-18 Charts v1.1.6 app v1.1.0

### Minor changes

- Use existing extension-apiserver-authentication-reader in kube-system instead of creating a new one. Thanks to @dragon3 for the PR.

## 2020-07-16 Charts v1.1.5 app v1.1.0

### Minor changes

- Make charts compatible with Kubernetes 1.14

## 2020-07-10 Charts v1.1.4 app v1.1.0

### Minor changes

- Overwrite NS label on pre-install, so it does not fail if already labelled
- Make SecurityContextConstraint compatible with Openshift 4.3

## 2020-06-26 Charts v1.1.3 app v1.1.0

### Minor changes

- Add pre-install hook in charts to automatically label admission controller namespace

## 2020-06-26 Charts v1.1.2 app v1.1.0

### Minor changes

- Add support for Openshift by deploying SecurityContextConstraint in Helm charts

## 2020-06-25 Charts v1.1.1 app v1.1.0

- Allow overriding registry in Helm Charts using `global.imageRegistry` for airgapped installs

## 2020-05-27 Charts v1.1.0 app v1.1.0

- Allow "check-scan" option in preScanPolicies to check scan result if available, but don't trigger a new scan

## 2020-05-14 Charts v1.0.4 app v1.0.1

- Fix glitch in namespace evaluation. Namespace can be in the object, or in the AdmissionReview (and object namespace be blank in that case)

## 2020-05-13 Charts v1.0.3, app v1.0.1

- Add proxy support

## 2020-05-13 Charts v1.0.1, app v1.0.0

- Fix: use object namespace instead of AdmissionReview namespace for evaluation 

## 2020-05-12 Chart v1.0.0, app v1.0.0

- Rebranding to sysdig-admission-controller
- Simplified README.md move technical details to docs/Advanced.md

## 2020-05-07 v0.2.0 

- New pre-scan evaluation phase to make decissions before triggering image scan
- Complete rewrite of evaluation rules
- Include full set of automated testing for the rego rules

## 2020-04-09 v0.1.2

- Fix UID permission mismatch that made the container fail on some environments
- Require sysdigSecureToken in values.yaml or fail

## 2020-04-02 v0.1.1 

- Add some more debug information
- fix some default rules in helm charts

## v0.1.0

Initial release
