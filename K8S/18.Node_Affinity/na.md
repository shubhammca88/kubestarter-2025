# Kubernetes Node Affinity: Scheduling Pods to Specific Nodes

Node affinity in Kubernetes allows you to constrain which nodes your pods can be scheduled on, based on labels applied to those nodes. This gives you more control over pod placement and helps optimize resource utilization.

## Why Use Node Affinity?

* **Performance Optimization:** Schedule pods close to resources they need, like specialized hardware (GPUs) or fast disks.
* **Workload Separation:** Isolate different types of workloads to specific nodes for security or performance reasons.
* **Data Locality:**  Place pods on nodes where their data resides, reducing latency and improving performance.
* **High Availability:** Spread pods across different availability zones or failure domains to improve resilience.

## Node Affinity Terms

* **RequiredDuringSchedulingIgnoredDuringExecution:**  This is a "hard" constraint. Pods *must* be scheduled on nodes matching the specified labels. If no matching node is available, the pod will remain pending.
* **PreferredDuringSchedulingIgnoredDuringExecution:** This is a "soft" or "preferred" constraint. Kubernetes will try to schedule pods on nodes matching the specified labels, but it's not mandatory. If no matching node is found, the pod may be scheduled on any available node.
* **nodeSelectorTerms:** A list of node selector requirements. All terms within a `nodeSelectorTerms` must be satisfied for a node to be considered a match.
* **matchExpressions:**  Allows you to specify more complex label matching rules using operators like `In`, `NotIn`, `Exists`, `DoesNotExist`, `Gt`, and `Lt`.
* **matchFields:**  Allows you to match node fields like `metadata.name` or `spec.nodeName`.

## Using Node Affinity in Pod Spec

You define node affinity in the `spec.affinity.nodeAffinity` section of your pod definition.

**Example `pod-with-node-affinity.yaml`:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: "node-type"
            operator: In
            values:
            - "high-memory"
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 1
        preference:
          matchExpressions:
          - key: "disk-type"
            operator: In
            values:
            - "ssd"
  containers:
  - name: my-container
    image: nginx:latest