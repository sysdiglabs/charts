# Host Shield Node Profiles

## Problem

The host shield runs as a DaemonSet - one pod per node. On clusters with mixed
node types (dense/heavy nodes alongside lighter ones), a single resource
configuration forces a trade-off: size for the heaviest node and waste resources
on lighter ones, or size for the lightest and risk OOMKilled on heavier nodes.

`host.profiles` solves this by letting a single Helm release deploy one
right-sized host shield DaemonSet per node type.

## How it works

A DaemonSet with a `nodeSelector` only runs on nodes whose labels match. By
declaring multiple profiles - each with its own `nodeSelector` and resource
overrides - you get N independently-sized DaemonSets from one release. Helm
does not need to know anything about your nodes at deploy time; the Kubernetes
scheduler handles placement at runtime.

```
Nodes labeled  sysdig.com/node-size=large   ->  DaemonSet shield-host-large   (1000m / 1000Mi)
Nodes labeled  sysdig.com/node-size=medium  ->  DaemonSet shield-host-medium  ( 900m /  900Mi)
Nodes labeled  sysdig.com/node-size=small   ->  DaemonSet shield-host-small   ( 800m /  800Mi)
```

Everything else - RBAC, ConfigMap, Secrets, the cluster shield Deployment -
remains singular. Only the host DaemonSet multiplies.

## Prerequisites: identify or add node labels

The label you use for targeting must be unique per node type (mutually
exclusive). On managed Kubernetes this label usually already exists:

| Platform | Label key                          |
|----------|------------------------------------|
| EKS      | `eks.amazonaws.com/nodegroup`      |
| GKE      | `cloud.google.com/gke-nodepool`    |
| AKS      | `agentpool`                        |
| Any      | `node.kubernetes.io/instance-type` |

Check your nodes:
```bash
kubectl get nodes --show-labels
# or filter by a specific key:
kubectl get nodes -L eks.amazonaws.com/nodegroup
kubectl get nodes -L cloud.google.com/gke-nodepool
```

If your nodes don't already have a distinguishing label, add one:
```bash
kubectl label node <node-name> sysdig.com/node-size=large
kubectl label node <node-name> sysdig.com/node-size=medium
kubectl label node <node-name> sysdig.com/node-size=small
```

> **Important:** each profile's `node_selector` must target a **disjoint** set
> of nodes. If two profiles can match the same node, two host shields will land
> on it and conflict over `hostNetwork`/`hostPID`.

## Configuration

Add `host.profiles` to your values file. The existing `host.resources`,
`host.node_selector`, `host.affinity`, and `host.tolerations` become the
**base** that every profile inherits from. A profile only needs to specify what
differs from the base.

```yaml
host:
  # Base resources - inherited by all profiles unless overridden
  resources:
    shield:
      limits:
        cpu: 1000m
        memory: 1Gi
      requests:
        cpu: 250m
        memory: 384Mi

  profiles:
    - name: large                         # required, unique, DNS-label safe
      node_selector:                      # required
        sysdig.com/node-size: large
      resources:                          # optional - only what differs from base
        shield:
          limits: { cpu: 1000m, memory: 1000Mi }
          requests: { cpu: 350m, memory: 400Mi }

    - name: medium
      node_selector:
        sysdig.com/node-size: medium
      resources:
        shield:
          limits: { cpu: 900m, memory: 900Mi }
          requests: { cpu: 250m, memory: 300Mi }

    - name: small
      node_selector:
        sysdig.com/node-size: small
      resources:
        shield:
          limits: { cpu: 800m, memory: 800Mi }
          requests: { cpu: 150m, memory: 200Mi }
```

Each profile can also override `affinity` and `tolerations` (both inherit from
the base when omitted). This is useful if, for example, a node pool carries a
taint that only the corresponding profile should tolerate.

```yaml
    - name: spot
      node_selector:
        node.kubernetes.io/instance-type: t3.medium
      tolerations:
        - key: spot
          operator: Exists
          effect: NoSchedule
      resources:
        shield:
          limits: { memory: 512Mi }
```

## Deployment

Profiles are supplied as a separate values file alongside your base values:

```bash
# Preview what will be deployed (no cluster changes)
helm template my-release aaronm-sysdig/shield \
  -f values-shield.yaml \
  -f values-shield-profiles.yaml \
  --show-only templates/host/daemonset.yaml

# Deploy
helm upgrade --install --create-namespace \
  -n sysdig-agent my-release aaronm-sysdig/shield \
  -f values-shield.yaml \
  -f values-shield-profiles.yaml
```

## Verifying deployment

```bash
# One DaemonSet per profile, each pinned to its node type
kubectl get daemonsets -n sysdig-agent

# Confirm each pod landed on the right node
kubectl get pods -n sysdig-agent -o wide | grep host

# Inspect resources on a specific pod
kubectl get pod <pod-name> -n sysdig-agent \
  -o jsonpath='{.spec.containers[0].resources}' | python3 -m json.tool
```

Expected output (3-profile example):
```
NAME                              DESIRED   CURRENT   READY   NODE SELECTOR
sysdig-agent-shield-host-large    1         1         1       sysdig.com/node-size=large
sysdig-agent-shield-host-medium   1         1         1       sysdig.com/node-size=medium
sysdig-agent-shield-host-small    1         1         1       sysdig.com/node-size=small
```

## Backward compatibility

`host.profiles` defaults to `[]`. When empty, the chart behaves exactly as
before - a single host DaemonSet with the base `host.resources`. Existing
deployments are unaffected until profiles are explicitly configured.

## Common patterns

**Two pools (heavy/light):**
```yaml
host:
  profiles:
    - name: heavy
      node_selector:
        eks.amazonaws.com/nodegroup: heavy-nodes
      resources:
        shield:
          limits: { memory: 2Gi }
          requests: { memory: 768Mi }
    - name: light
      node_selector:
        eks.amazonaws.com/nodegroup: light-nodes
      resources:
        shield:
          limits: { memory: 512Mi }
          requests: { memory: 192Mi }
```

**GKE node pools:**
```yaml
host:
  profiles:
    - name: standard
      node_selector:
        cloud.google.com/gke-nodepool: standard-pool
    - name: highmem
      node_selector:
        cloud.google.com/gke-nodepool: highmem-pool
      resources:
        shield:
          limits: { memory: 2Gi }
          requests: { memory: 1Gi }
```

**Instance type targeting:**
```yaml
host:
  profiles:
    - name: xlarge
      node_selector:
        node.kubernetes.io/instance-type: m5.4xlarge
      resources:
        shield:
          limits: { cpu: "2", memory: 2Gi }
          requests: { cpu: 500m, memory: 768Mi }
    - name: small
      node_selector:
        node.kubernetes.io/instance-type: t3.medium
      resources:
        shield:
          limits: { cpu: 500m, memory: 512Mi }
          requests: { cpu: 100m, memory: 192Mi }
```
