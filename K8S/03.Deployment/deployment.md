# `Kubernetes Deployments`

Deployments are a powerful tool in Kubernetes for managing the lifecycle of your applications. 

* Deployment automate the process of deploying, updating , scaling and rolling update your apps(replicas).
* Deployment is controller thats handel replication 

## Key Features

* **Declarative Updates:** You define the desired state, and the Deployment figures out how to get there.
* **Rolling Updates:**  Updates your application gradually, minimizing downtime.
* **Rollbacks:**  Easily revert to previous versions if needed.
* **Self-Healing:** Automatically replaces failed Pods.
* **Scaling:** Easily adjust the number of replicas (Pods) running your application.

## Useful `kubectl` Commands

| Command | Description |
|---|---|
| `kubectl apply -f deployment.yaml` | Create a Deployment from a YAML file |
| `kubectl get deployments` | List all Deployments in your cluster |
| `kubectl describe deployment <deployment-name>` | Get detailed information about a Deployment |
| `kubectl rollout status deployment <deployment-name>` | Check the status of a rolling update |
| `kubectl rollout pause deployment <deployment-name>` | Pause a rolling update |
| `kubectl rollout resume deployment <deployment-name>` | Resume a paused rolling update |
| `kubectl rollout undo deployment <deployment-name>` | Roll back to a previous revision |
| `kubectl scale deployment <deployment-name> --replicas=<desired-number>` | Scale the number of Pods in a Deployment |
| `kubectl edit deployment <deployment-name>` | Edit an existing Deployment |
| `kubectl delete deployment <deployment-name>` | Delete a Deployment |

## Example `deployment.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
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
        image: my-image:latest
        ports:
        - containerPort: 8080