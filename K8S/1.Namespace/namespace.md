# Kubernetes Namespaces

Namespaces are a way to divide your Kubernetes cluster into virtual and physical partitions, allowing you to organize and isolate resources.

## Why Use Namespaces?

* **Organization:** Group resources by teams, projects, or environments (e.g., dev, test, prod).
* **Resource Quotas:** Limit resource consumption per namespace to prevent resource contention.
* **Access Control:** Enhance security by restricting access to resources within specific namespaces.


## Useful `kubectl` Commands

| Command | Description |
|---|---|
| `kubectl get namespaces` | List all namespaces in your cluster |
| `kubectl create namespace <namespace-name>` | Create a new namespace |
| `kubectl describe namespace <namespace-name>` | Get details about a namespace |
| `kubectl delete namespace <namespace-name>` | Delete a namespace |
| `kubectl get pods -n <namespace-name>` | List Pods in a specific namespace |
| `kubectl apply -f my-resource.yaml -n <namespace-name>` | Create a resource in a specific namespace |
| `kubectl config set-context --current --namespace=<namespace-name>` | Set the default namespace for your current context |


## Best Practices

* Use descriptive names for your namespaces (e.g., "team-a", "project-x", "production").
* Establish clear naming conventions for namespaces within your organization.
* Consider using resource quotas to prevent resource overuse in a namespace.
* Implement role-based access control (RBAC) to restrict access to namespaces.


## Important Notes

* The "default" namespace is used if you don't specify one.
* Namespaces help prevent naming collisions between resources.


This markdown file provides a concise overview of Kubernetes Namespaces. You can use it as a starting point for your own documentation or learning materials.