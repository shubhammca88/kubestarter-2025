# Kubernetes Taints and Tolerations

Taints and tolerations work together in Kubernetes to control where Pods can be scheduled. They provide a way to repel or attract Pods to specific nodes.

## Taints

* **Purpose:**  Taints are applied to nodes to mark them as unsuitable for certain Pods. They act as "keep off" signals.
* **How they work:** A taint is a key-value pair assigned to a node. Pods that don't have a matching toleration for the taint cannot be scheduled on that node.
* **Use cases:**
    * Dedicate nodes for specific workloads (e.g., high-performance applications).
    * Prevent Pods from being scheduled on nodes with insufficient resources or hardware.
    * Isolate Pods with special requirements.

## Tolerations

* **Purpose:** Tolerations are added to Pods to allow them to be scheduled on tainted nodes. They act as "exceptions" to the taint.
* **How they work:** A toleration must match the key and effect of a taint to allow scheduling.
* **Use cases:**
    * Allow specific Pods to run on dedicated nodes.
    * Override default scheduling behavior.

## Taint Effects

* **NoSchedule:**  Pods without a matching toleration cannot be scheduled on the tainted node.
* **PreferNoSchedule:**  Kubernetes tries to avoid scheduling Pods on the tainted node, but it's not strictly enforced.
* **NoExecute:**  Pods without a matching toleration are evicted from the tainted node if they are already running there.

## Applying Taints

* **Using `kubectl taint`:**
   ```bash
   kubectl taint nodes <node-name> key=value:NoSchedule
   kubectl taint nodes <node-name> key=value:PreferNoSchedule
   kubectl taint nodes <node-name> key=value:NoExecute