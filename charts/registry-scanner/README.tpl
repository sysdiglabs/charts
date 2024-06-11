<!--


DO NOT MODIFY THIS FILE (README.md) MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Chart: Registry Scanner

## Overview

{{ .Project.Name }} scans your images registry on a Kubernetes cluster .
{{ .Project.Description }}

Registry scanning provides an extra layer of defense between pipeline and runtime by checking:

- Newly discovered vulnerabilities in the software before being deployed.
- Third-party software that might  have been installed without going through pipeline scanning.


Follow the instructions in [Install Registry Scanner](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-registry-scanner/#installation) to deploy the Helm chart.  They include specific use cases for:

- JFrog Artifactory
- AWS ECR
- Harbor
- Quay IO
- IBM ICR
- Azure ACR
- Google GAR
- Google GCR
- OpenShift Internal Registry

Once installed, you can view the scan results in the [Vulnerabilities UI](https://docs.sysdig.com/en/docs/sysdig-secure/vulnerabilities/registry/) of Sysdig Secure.


### Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}

{{- if .Chart.Values }}

## Configuration Parameters

The following table lists the configurable parameters of the Sysdig Registry Scanner chart and their default values:

{{ .Chart.Values }}
{{- end }}
## On-Prem Deployment

If you are using a Sysdig on-prem version greater than 6.2, you need to configure legacy VM engine while setting up registry scanner.

Use the following command to deploy:

```
helm upgrade --install registry-scanner \
   --namespace sysdig-agent \
   --create-namespace \
   {{ with .Chart.Version }}--version={{.}}{{ end }} \
   --set config.secureBaseURL=<SYSDIG_SECURE_URL> \
   --set config.secureAPIToken=<SYSDIG_SECURE_API_TOKEN> \
   --set config.secureSkipTLS=true \
   --set config.registryURL=<REGISTRY_URL> \
   --set config.registryUser=admin \
   --set config.registryPassword=<REGISTRY_PASSWORD> \
  sysdig/registry-scanner
```

Use `config.secureSkipTLS=true` if you are using self-signed certificates.
