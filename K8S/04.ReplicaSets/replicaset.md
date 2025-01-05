# Kubernetes ReplicaSets

ReplicaSets ensure a specified number of identical Pods are always running in your Kubernetes cluster.

You can use ReplicaSets directly, Deployments offer a higher level of abstraction and make it much easier to manage your applications in Kubernetes. 

## Key Features

* **High Availability:**  Keeps your application running even if Pods fail.
* **Scalability:** Easily adjust the number of running Pods.
* **Self-Healing:** Automatically replaces failed Pods.
* **Rolling Updates:**  Helps with smooth application updates.

## Useful `kubectl` Commands

| Command                                 | Description                                    |
|------------------------------------------|------------------------------------------------|
| `kubectl apply -f replicaset.yaml`       | Create a ReplicaSet from a YAML file.         |
| `kubectl get replicasets`                | List all ReplicaSets.                         |
| `kubectl describe replicaset <name>`      | Show details about a specific ReplicaSet.     |
| `kubectl scale replicaset <name> --replicas=<number>` | Scale a ReplicaSet to a desired number of Pods. |
| `kubectl delete replicaset <name>`      | Delete a ReplicaSet.                          |
| `kubectl edit replicaset <name>`         | Edit an existing ReplicaSet.                  |

## Example `replicaset.yaml`

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-replicaset
spec:
  replicas: 3 
  selector:
    matchLabels:
      app: my-app 
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: nginx:latest