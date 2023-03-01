# Sysdig MCM Nav Menu integration

These helm charts deploy a couple of services and an Ingress with the labels and annotations that are required to create links in the MCM top-left Burger menu.

* "Sysdig Secure" menu entry is created inside "Administer" menu
* "Sysdig Monitor" entry is created inside "Monitor health"

The ingress entry does not seem to work for ExternalService (unable to resolve service), so a nginx pod is deployed with a couple of redirect rules to redirect the user to Secure or Monitor SaaS URLs.
