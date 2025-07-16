# kubectl - Kubernetes Command Line Tool

## What is kubectl?
kubectl is the command-line interface for running commands against Kubernetes clusters.

## Installation
```bash
chmod +x install_kubectl.sh
./install_kubectl.sh
```

## Essential Commands

### Cluster Info
```bash
kubectl cluster-info                    # Display cluster information
kubectl get nodes                       # List all nodes
kubectl version                         # Show client and server versions
```

### Pod Management
```bash
kubectl get pods                        # List pods in current namespace
kubectl get pods -A                     # List pods in all namespaces
kubectl describe pod <pod-name>         # Show pod details
kubectl logs <pod-name>                 # View pod logs
kubectl exec -it <pod-name> -- /bin/bash # Execute commands in pod
kubectl delete pod <pod-name>           # Delete a pod
```

### Deployment Management
```bash
kubectl get deployments                 # List deployments
kubectl create deployment <name> --image=<image> # Create deployment
kubectl scale deployment <name> --replicas=3     # Scale deployment
kubectl delete deployment <name>        # Delete deployment
```

### Service Management
```bash
kubectl get services                    # List services
kubectl expose deployment <name> --port=80 # Expose deployment as service
kubectl delete service <name>           # Delete service
```

### Namespace Management
```bash
kubectl get namespaces                  # List namespaces
kubectl create namespace <name>         # Create namespace
kubectl config set-context --current --namespace=<name> # Switch namespace
```

### Apply/Delete Resources
```bash
kubectl apply -f <file.yaml>            # Apply configuration from file
kubectl delete -f <file.yaml>           # Delete resources from file
kubectl get all                         # List all resources
```

### Debugging
```bash
kubectl describe <resource> <name>      # Show detailed resource info
kubectl port-forward <pod-name> 8080:80 # Forward local port to pod
kubectl top nodes                       # Show node resource usage
kubectl top pods                        # Show pod resource usage
```