# `Kubernetes Pods`

Pods are the smallest deployable units and can contain one or more containers that share resources.

## Why Use Pods?

* **Simplified deployment:** Manage applications as single units instead of individual containers.
* **Co-location:** Keep related containers together on the same machine.
* **Resource sharing:** Allow containers within a Pod to easily share data and network connections.

## Useful `kubectl` Commands

| Command | Description |
|---|---|
| `kubectl get pods` | List all Pods in your cluster |
| `kubectl get pods -n <namespace>` | List all Pods in your cluster |
| `kubectl describe pod <pod-name>` | Get detailed information about a Pod |
| `kubectl describe pod <pod-name> -n <namespace>` | Get detailed information about a Pod |
| `kubectl logs <pod-name>` | View the logs from a Pod |
| `kubectl exec -it <pod-name> -- bash` |  Open a shell inside a Pod |
| `kubectl delete pod <pod-name>` | Delete a Pod |
| `kubectl port-forward <pod-name> <local-port>:<pod-port>` | Forward a local port to a port on the Pod |


## Pod Lifecycle

Pods go through various states during their lifecycle:

* **Pending:** The Pod has been created but not yet scheduled to a node.
* **Running:** The Pod has been scheduled to a node and all containers are running.
* **Succeeded:** All containers in the Pod have terminated successfully.
* **Failed:** One or more containers in the Pod have terminated with a failure.
* **Unknown:** The state of the Pod cannot be determined.


## Important Notes

* Pods are typically managed by higher-level controllers like Deployments and ReplicaSets.
* Pods are ephemeral; they can be created and destroyed quickly. Controllers ensure application availability despite Pod failures.

## Example:

If you have a Pod named my-app-pod and you want to see its logs, you would use:

```bash
kubectl logs my-app-pod
```

## Important notes:

* Pods are usually managed by higher-level controllers like Deployments and ReplicaSets.
* When a Pod is deleted, all the containers inside it are also deleted.
* Pods are ephemeral, meaning they can be created and destroyed quickly. This is why you use controllers to ensure your application stays running even if Pods fail.