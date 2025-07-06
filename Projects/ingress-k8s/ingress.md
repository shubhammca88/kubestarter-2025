# Kubernetes Ingress: A Single Entry Point for Your Cluster

Ingress in Kubernetes acts as a gateway for external traffic, routing it to the appropriate services within your cluster. It provides a single entry point for managing external access to your applications, simplifying routing and making your deployments more secure.

## Ingress Architecture

Below is a high-level architecture diagram of Kubernetes Ingress:

![Kubernetes Ingress Architecture](https://miro.medium.com/v2/resize:fit:2000/1*AgWCYOe3yMevVfzT_1EHog.png)


## How Ingress Works

Ingress involves two main components:

* **Ingress Resource:** A Kubernetes object that defines routing rules for incoming traffic.
* **Ingress Controller:**  A pod that runs within your cluster and implements the Ingress resource, typically using a load balancer or reverse proxy. Popular Ingress controllers include Nginx, Traefik, and Istio.

**Useful `kubectl` commands:**

| Command | Description |
|---|---|
| `kubectl apply -f ingress.yaml` | Create an Ingress resource from a YAML file. |
| `kubectl get ingress` | List all Ingress resources in your cluster. |
| `kubectl describe ingress <ingress-name>` | Get detailed information about an Ingress resource. |
| `kubectl edit ingress <ingress-name>` | Edit an existing Ingress resource. |
| `kubectl delete ingress <ingress-name>` | Delete an Ingress resource. |
| `kubectl get ingress -o wide` |  List Ingress resources with more details (including address). |
| `kubectl describe ingress <ingress-name> -n <namespace>` | Get detailed information about an Ingress resource in a specific namespace. |

## Creating an Ingress Resource

Here's a basic example of an Ingress resource defined in a YAML file:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
spec:
  rules:
  - host: myapp.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: my-service
            port:
              number: 80