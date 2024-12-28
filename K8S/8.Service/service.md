# Kubernetes Service

Service is an abstraction that allows you to expose a set of Pods (your application) on the network. It acts as a stable entry point to your application, even if the Pods backing it change or are rescheduled.

## Types of Services

1. **ClusterIP**: Exposes the Service on an internal IP in the cluster. This is the default type.
2. **NodePort**: Exposes the Service on each Node's IP at a static port.
3. **LoadBalancer**: Exposes the Service externally using a cloud provider's load balancer.
4. **ExternalName**: Maps the Service to the contents of the externalName field (e.g., `foo.bar.example.com`).

## Basic structure of a Service YAML file
```yml
apiVersion: v1
kind: Service
metadata:
  name: my-service 
spec:
  selector:
    app: my-app  # Connect to pods with this label
  ports:
  - protocol: TCP   
    port: 80      # Port the Service listens on
    targetPort: 8080 # Port the pods are listening on
  type: LoadBalancer # Or ClusterIP, NodePort
```

## Creating a Service

To create a Service, you can use the following command:

```bash
kubectl expose deployment <deployment-name> --type=<service-type> --name=<service-name>
```

Replace `<deployment-name>`, `<service-type>`, and `<service-name>` with your specific values.

## Example

Here is an example of creating a ClusterIP Service for a deployment named `my-deployment`:

```bash
kubectl expose deployment my-deployment --type=ClusterIP --name=my-service
```

This will create a Service named `my-service` that targets the Pods of `my-deployment`.

## YAML Definition

You can also define a Service using a YAML file. Below is an example of a ClusterIP Service definition:

```yaml
apiVersion: v1
kind: Service
metadata:
    name: my-service
spec:
    selector:
        app: my-app
    ports:
        - protocol: TCP
            port: 80
            targetPort: 80
```

# Usefull service command

| Command | Description |
|---|---|
| `kubectl apply -f service.yaml` | Create a Service from a YAML file. |
| `kubectl get services` | List all Services in your cluster. |
| `kubectl describe service <service-name>` | Get detailed information about a Service. |
| `kubectl edit service <service-name>` | Edit an existing Service. |
| `kubectl delete service <service-name>` | Delete a Service. |