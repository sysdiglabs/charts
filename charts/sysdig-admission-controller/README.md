# Chart: Sysdig Admission Controller

This chart deploys the Sysdig Admission Controller on your cluster.

See the [Sysdig Admission Controller documentation](https://sysdiglabs.github.io/sysdig-admission-controller/) for more details and installation instructions.

## Quick installation guide

1. Create a *values.yaml* overriding the desired settings. The **sysdigSecureToken** value is mandatory.
2. Create a namespace for the admission controller deployment, **add the label imagechecks.admission.sysdig.com/skip=true to the namespace**

```
$ kubectl create ns sysdig-admission-controller
$ kubectl label ns sysdig-admission-controller imagechecks.admission.sysdig.com/skip=true
```

⚠️ **Warning** ⚠️: Don't forget adding the label **imagechecks.admission.sysdig.com/skip=true** to the namespace where the Admission controller will be deployed.

3. Add Sysdig Helm charts repository:

```
$ helm repo add sysdiglabs https://sysdiglabs.github.io/charts/
```

4. Deploy the admission controller:

```
$ helm install -n sysdig-admission-controller sysdig-admission-controller -f values.yaml sysdiglabs/sysdig-admission-controller
```

Check [Sysdig Admission Controller documentation](https://sysdiglabs.github.io/sysdig-admission-controller/) for more information.