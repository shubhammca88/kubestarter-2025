# Minikube

Single-node Kubernetes cluster for local development.

## Installation

```bash
# Linux
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# macOS
brew install minikube

# Windows
choco install minikube
```

## Basic Commands

```bash
# Start cluster
minikube start
minikube start --driver=docker
minikube start --memory=4096 --cpus=2

# Cluster info
minikube status
minikube ip
minikube version
kubectl config get-contexts    # Check current cluster

# Stop/Delete
minikube stop
minikube delete

# Dashboard
minikube dashboard
```

## Addons

Addons extend Minikube with additional features like ingress controllers, monitoring, and storage.

```bash
# List addons
minikube addons list

# Enable addons
minikube addons enable ingress          # HTTP/HTTPS routing
minikube addons enable metrics-server    # Resource monitoring
minikube addons enable dashboard         # Web UI

# Disable addons
minikube addons disable ingress
```

## Multi-Node Setup

Why increase nodes?
- **High Availability**: Distribute workloads across multiple nodes
- **Testing**: Simulate production multi-node environments
- **Load Distribution**: Spread pods across different nodes
- **Node Failure Testing**: Test app behavior when nodes fail

```bash
# Start cluster with multiple nodes
minikube start --nodes=3
minikube start --nodes=3 --memory=4096 --cpus=2

# Add nodes to existing cluster
minikube node add
minikube node add --worker

# CPU/Memory usage
kubectl top nodes 

# List nodes
minikube node list               # Minikube-specific view
kubectl get nodes                # view roles status , age

# Delete specific node
minikube node delete <node-name>
```

## Node Role Management

```bash
# Add role labels to nodes
kubectl label node minikube-m02 node-role.kubernetes.io/worker=worker

# Add custom roles
kubectl label node minikube-m02 node-role.kubernetes.io/database=database

# Remove role labels
kubectl label node minikube-m02 node-role.kubernetes.io/worker-

# View node labels
kubectl get nodes --show-labels
kubectl describe node minikube-m02
```

**Note:** Roles are just labels - they don't change node functionality, only help with organization and scheduling.
``

## Service Access

Why use `minikube service`?
- **Easy Access**: Automatically opens services in browser
- **URL Generation**: Gets the correct NodePort URL
- **No Manual Port Mapping**: Handles port forwarding automatically
- **Local Development**: Simplifies testing services locally

```bash
# List all services with URLs
minikube service list

# Get service URL
minikube service <service-name> --url

# Open service in browser
minikube service <service-name>

# Tunnel for LoadBalancer services
minikube tunnel
```

**Alternative methods:**
```bash
# Manual port forwarding
kubectl port-forward service/<service-name> 8080:80

# Get NodePort manually
kubectl get service <service-name>
minikube ip  # Then access http://<minikube-ip>:<nodeport>
```

## Q&A

**Q: Is Minikube a pod?**
A: No. Minikube is a **cluster** (single-node). Pods run **inside** the cluster.

**Q: What is a cluster?**
A: A cluster is a set of nodes that run Kubernetes. Minikube creates a 1-node cluster.

**Q: What runs where?**
- **Minikube** = The cluster (infrastructure)
- **Pods** = Your applications (run inside the cluster)
- **Nodes** = Machines in the cluster (Minikube has 1 node)