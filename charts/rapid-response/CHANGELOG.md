# Chart: Rapid Response

## Change Log

## v0.2.2
### Minor changes
* bump image tag to 0.3.4

## v0.2.1

### Minor changes

* Removed trailing spaces

## v0.2.0

### Major change

* Deprecated the usage of `skipTlsVerifyCertificate`, for enabling/disabling the certificate verification use `sslVerifyCertificate` instead
For compatibility purposes `skipTlsVerifyCertificate` is still available in this release

## v0.1.1

### Bugfix

* Fixed an issue that was causing k8s secrets to get generated with uppercase characters

## v0.1.0

### First release

* Deploy only Sysdig Rapid Response daemonset and associated resources
* Use global common values for access key
