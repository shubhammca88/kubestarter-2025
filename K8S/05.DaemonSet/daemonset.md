# `Kubernetes DaemonSets`

DaemonSets ensure a copy of your ``Pod runs on every node`` (or a selected set of nodes) in your Kubernetes cluster. They are perfect for tasks that need to run directly on the node itself.

## Common Use Cases

* **Log collection:**  Deploying logging agents to gather logs from all nodes.
* **Monitoring:** Running monitoring agents to collect node-level metrics.
* **Network plugins:** Installing network components on every node for Pod communication.
* **Storage:** Running storage drivers or agents on nodes.

## Key Features

* **One Pod per node:**  Guarantees a single Pod instance on each node.
* **Automatic deployment:**  Deploys Pods to new nodes as they join the cluster.
* **Node-specific tasks:** Ideal for tasks that require direct access to node resources.

## Useful `kubectl` Commands

| Command | Description |
|---|---|
| `kubectl apply -f daemonset.yaml` | Create a DaemonSet from a YAML file |
| `kubectl get daemonsets` | List all DaemonSets in your cluster |
| `kubectl describe daemonset <daemonset-name>` | Get detailed information about a DaemonSet |
| `kubectl edit daemonset <daemonset-name>` | Edit an existing DaemonSet |
| `kubectl delete daemonset <daemonset-name>` | Delete a DaemonSet |
| `kubectl logs -f <daemonset-pod-name>` | View logs from a DaemonSet Pod (you'll need to find the Pod name first) |

## Example `daemonset.yaml`

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: my-daemonset
spec:
  selector:
    matchLabels:
      app: my-daemonset-app
  template:
    metadata:
      labels:
        app: my-daemonset-app
    spec:
      containers:
      - name: my-container
        image: my-daemonset-image:latest