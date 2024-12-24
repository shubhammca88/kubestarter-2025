# Kubernetes Namespaces

## Explanation

* **apiVersion:** This specifies the Kubernetes API version to use. For namespaces, it's `v1`.
* **kind:** This indicates that you're defining a Namespace object.
* **metadata:** This section contains metadata about the namespace, such as its name.

## How to use it

**Example:**# Creating a Namespace in Kubernetes

This document outlines how to create a namespace called `my-namespace` in your Kubernetes cluster.

## Important Notes

* **Naming Conventions:** Choose names that are descriptive and follow Kubernetes naming conventions (lowercase, alphanumeric characters, hyphens).
* **Resource Management:** Namespaces help you organize and manage resources in your cluster. You can use them to:
    * Divide cluster resources between multiple users or teams.
    * Apply resource quotas to limit resource consumption.
    * Control access to resources using Role-Based Access Control (RBAC).

## kubectl Commands

* Use `kubectl get namespaces` to list all namespaces in your cluster.
* Use `kubectl describe namespace <namespace-name>` to get more details about a specific namespace.

To create a namespace named `my-namespace`, you would save the following code in `namespace.yaml`:

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: my-namespace
```

Then , run command

```bash
 kubectl apply -f namespace.yaml
```
This command will create a namespace called `my-namespace` in your Kubernetes cluster.


## Useful `kubectl-namespace` Commands
- **List all namespaces:**
  ```bash
  kubectl get namespaces
  ```
- **Create specific namespace:**
  ```bash
  kubectl create namespace <namespace-name>
  ```
- **Get details about a specific namespace:**
  ```bash
  kubectl describe namespace <namespace-name>
  ```
