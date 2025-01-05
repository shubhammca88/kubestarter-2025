# Kubernetes Resource Quotas

Resource Quotas in Kubernetes allow administrators to limit the consumption of compute resources (CPU, memory) and object counts (Pods, Services, PersistentVolumeClaims, etc.) within a namespace.

## Why Use Resource Quotas?

* **Prevent Resource Starvation:**  Ensure that a single namespace doesn't consume all available resources, preventing others from deploying their applications.
* **Fair Resource Allocation:** Divide resources fairly among different teams or projects.
* **Limit Object Counts:** Restrict the number of objects created in a namespace to prevent clutter and ensure efficient resource utilization.

## Defining Resource Quotas

Resource Quotas are defined using a `ResourceQuota` object in a YAML file. This file specifies limits for various resources and object counts.

**Example `resource-quota.yaml`:**

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: my-resource-quota
spec:
  hard:
    requests.cpu: "1"
    requests.memory: 1Gi
    limits.cpu: "2"
    limits.memory: 2Gi
    pods: "10"
    services: "5"
    persistentvolumeclaims: "4"
    configmaps: "10"
    secrets: "5"
    replicationcontrollers: "2"