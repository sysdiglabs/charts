<!--


DO NOT MODIFY THIS FILE (README.md) MANUALLY!!

IT'S AUTO-GENERATED vía README.tpl with pre-comit plugin
this is under construction so it must be launched manually

in the project root, run:
$ pre-commit install
$ pre-commit run -a

-->

# Registry Scanner

{{ .Project.Name }} scans your images registry on a Kubernetes cluster .
{{ .Project.Description }}

## Overview

The Container Registry Scanner allows you to integrate Sysdig Secure with different image registries. Registry scanning provides an extra layer of defense between pipeline and runtime by checking:

- Newly discovered vulnerabilities in the software before being deployed.
- Third-party software that might  have been installed without going through pipeline scanning.


Follow the instructions in [Install Registry Scanner](https://docs.sysdig.com/en/docs/installation/sysdig-secure/install-registry-scanner/#installation) to deploy the Helm chart.  They include specific use cases for:

- JFrog Artifactory
- AWS ECR
- Harbor
- Quay IO
- IBM ICR
- Azure ACR

Once installed, you can view the scan results in the [Vulnerabilities UI](https://docs.sysdig.com/en/docs/sysdig-secure/vulnerabilities/registry/) of Sysdig Secure.


### Prerequisites
{{ range .Prerequisites }}
- {{ . }}
{{- end }}


## Configuration Parameters

The following table lists the configurable parameters of the Sysdig Registry Scanner chart and their default values:

{{ .Chart.Values }}

{{- end }}
