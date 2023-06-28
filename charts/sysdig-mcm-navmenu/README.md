# Sysdig MCM Nav Menu integration

These helm charts deploy a couple of services and an Ingress with the labels and annotations that are required to create links in the MCM top-left Burger menu.

* "Sysdig Secure" menu entry is created inside "Administer" menu
* "Sysdig Monitor" entry is created inside "Monitor health"

The ingress entry does not seem to work for ExternalService (unable to resolve service), so a nginx pod is deployed with a couple of redirect rules to redirect the user to Secure or Monitor SaaS URLs.

## Verify the integrity and origin
Sysdig Helm Charts are signed so users can verify the integrity and origin of each chart, the steps are as follows:

### Import the Public Key

```console
$ curl -o "/tmp/sysdig_public.gpg" "https://charts.sysdig.com/public.gpg"
$ gpg --import /tmp/sysdig_public.gpg
```

### Verify the chart

To check the integrity and the origin of the charts you can now append the `--verify` flag to the `install`, `upgrade` and `pull` helm commands.
