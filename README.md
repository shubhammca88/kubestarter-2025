# Kubernetes Starter Guide 2025

> Complete Kubernetes learning repository with practical examples, cluster setups, and real-world projects.

## Table of Contents
- [Kubernetes Architecture](#kubernetes-architecture)
- [Cluster Setup](#cluster-setup)
- [Core Components](#core-components)
- [Workloads & Controllers](#workloads--controllers)
- [Networking & Services](#networking--services)
- [Storage & Configuration](#storage--configuration)
- [Security & RBAC](#security--rbac)
- [Monitoring & Observability](#monitoring--observability)
- [Advanced Topics](#advanced-topics)
- [Projects & Examples](#projects--examples)
- [Quick Reference](#quick-reference)

## Kubernetes Architecture

Kubernetes (K8s) is an open-source container orchestration platform that automates deployment, scaling, and management of containerized applications across clusters of hosts.

<kbd>![Kubernetes Architecture](img/k8s-architecture.png)</kbd>

### Architecture Overview
- **Control Plane**: Manages the cluster state and makes global decisions
- **Worker Nodes**: Run application workloads in containers
- **etcd**: Distributed key-value store for cluster data
- **Network**: Pod-to-pod and service communication

## Cluster Setup

Multiple ways to set up Kubernetes clusters for different environments:

### Local Development
- **[Kind](Cluster/kind-cluster/)**: Kubernetes in Docker
- **[Minikube](Cluster/minikube-cluster/)**: Single-node local cluster
- **[Metrics Server](Cluster/kind-matrics-server/)**: Resource monitoring

### Cloud Deployment
- **[EKS](Cluster/EKS-cluster/)**: Amazon Elastic Kubernetes Service
- **Multi-cloud**: Support for various cloud providers

```bash
# Quick Kind cluster setup
kind create cluster --config=Cluster/kind-cluster/config.yml

# Minikube setup
minikube start --driver=docker
```

## Core Components

### Control Plane Components

#### API Server
- Central management entity and entry point for all REST commands
- Validates and configures data for API objects
- Serves as the frontend to the cluster's shared state

#### etcd
- Consistent and highly-available key-value store
- Stores all cluster data and configuration
- Backup and disaster recovery critical

#### Scheduler
- Watches for newly created Pods with no assigned node
- Selects optimal node based on resource requirements
- Considers constraints, affinity rules, and policies

#### Controller Manager
- Runs controller processes that regulate cluster state
- **Node Controller**: Monitors node health
- **Replication Controller**: Maintains correct number of pods
- **Endpoints Controller**: Populates service endpoints

#### Cloud Controller Manager
- Integrates with cloud provider APIs
- Manages cloud-specific resources (load balancers, storage)
- Separates cloud-dependent code from core Kubernetes

### Worker Node Components

#### kubelet
- Primary node agent that communicates with API server
- Manages Pod lifecycle and container health
- Reports node and Pod status to control plane

#### kube-proxy
- Network proxy maintaining network rules
- Enables service abstraction and load balancing
- Implements Kubernetes Service concept

#### Container Runtime
- Software responsible for running containers
- **containerd**: Industry-standard runtime
- **CRI-O**: Lightweight alternative
- **Docker**: Traditional but being phased out

## Workloads & Controllers

### [Namespaces](K8S/01.Namespace/)
Logical cluster partitioning for resource isolation

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: production
  labels:
    environment: prod
```

### [Pods](K8S/02.Pod/)
Smallest deployable units containing one or more containers

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
  - name: nginx
    image: nginx:1.21
    ports:
    - containerPort: 80
```

### [Deployments](K8S/03.Deployment/)
Manage stateless applications with rolling updates

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21
```

### [ReplicaSets](K8S/04.ReplicaSets/)
Ensure specified number of pod replicas

### [DaemonSets](K8S/05.DaemonSet/)
Run pods on every node (logging, monitoring agents)

### [StatefulSets](K8S/10.Statefullset/)
Manage stateful applications with persistent storage

### [Jobs & CronJobs](K8S/06.Jobs/)
- **Jobs**: Run pods to completion
- **CronJobs**: Schedule recurring tasks

## Networking & Services

### [Services](K8S/08.Service/)
Stable network endpoints for pod communication

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
  - port: 80
    targetPort: 80
  type: ClusterIP
```

**Service Types:**
- **ClusterIP**: Internal cluster communication
- **NodePort**: External access via node ports
- **LoadBalancer**: Cloud provider load balancer
- **ExternalName**: DNS CNAME mapping

### [Ingress](Projects/ingress-k8s/)
HTTP/HTTPS routing and SSL termination

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-ingress
spec:
  rules:
  - host: app.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: app-service
            port:
              number: 80
```

## Storage & Configuration

### [Persistent Volumes](K8S/09.PV/)
Cluster-wide storage resources independent of pod lifecycle

<kbd>![PV-PVC Architecture](img/pv-pvc-k8s.png)</kbd>

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-storage
spec:
  capacity:
    storage: 10Gi
  accessModes:
  - ReadWriteOnce
  hostPath:
    path: /data
```

### [ConfigMaps](K8S/11.Configmap/)
Store non-confidential configuration data

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  database_url: "postgresql://localhost:5432/mydb"
  debug_mode: "true"
```

### [Secrets](K8S/12.Secrets/)
Store sensitive information (passwords, tokens, keys)

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: app-secret
type: Opaque
data:
  username: YWRtaW4=  # base64 encoded
  password: MWYyZDFlMmU2N2Rm  # base64 encoded
```

## Security & RBAC

### [Role-Based Access Control](K8S/19.RBAC/)
Fine-grained access control for cluster resources

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

### [Resource Quotas](K8S/13.Resource%20Quotas/)
Limit resource consumption per namespace

### Network Policies
Control traffic flow between pods

## Monitoring & Observability

### [Kubernetes Monitoring](K8S-Monitoring/)
Comprehensive monitoring setup with Prometheus and Grafana

<kbd>![Prometheus vs Grafana](img/prometheus%20_vs_grafrana.png)</kbd>

```bash
# Install Prometheus Stack
helm install prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --set prometheus.service.nodePort=30000 \
  --set grafana.service.nodePort=31000
```

### [Health Checks](K8S/14.Probes/)
- **Liveness Probes**: Restart unhealthy containers
- **Readiness Probes**: Control traffic routing
- **Startup Probes**: Handle slow-starting containers

## Advanced Topics

### [Horizontal Pod Autoscaler](K8S/16.HPA/)
Automatic scaling based on CPU/memory metrics

### [Vertical Pod Autoscaler](K8S/17.VPA/)
Automatic resource request/limit adjustment

### [Taints & Tolerations](K8S/15.Taints_Tolerations/)
Control pod scheduling on specific nodes

### [Node Affinity](K8S/18.Node_Affinity/)
Advanced pod placement rules

### [Custom Resource Definitions](K8S/20.Custom-Resources-Defination/)
Extend Kubernetes API with custom resources

### [Helm Package Manager](K8S/21.Helm/)
Kubernetes application package management

### [Init Containers](K8S/22.Init-conrainer/)
Specialized containers that run before app containers

### [Sidecar Containers](K8S/23.Sidecar-container/)
Helper containers that extend main application functionality

### [Service Mesh with Istio](istio/)
Advanced traffic management, security, and observability

## Projects & Examples

### Production-Ready Applications
- **[Full-Stack Chat App](Projects/full-stack_chatApp/)**: Complete MERN stack with K8s deployment
- **[MySQL StatefulSet](Projects/mysql-k8s/)**: Database deployment with persistent storage
- **[Kubernetes Dashboard](Projects/kubernetes-dashboard/)**: Web-based cluster management UI

### Scaling & Performance
- **[HPA with Apache](Projects/hpa-apache-k8s/)**: Horizontal Pod Autoscaler demo
- **[VPA with Apache](Projects/vpa-apache-k8s/)**: Vertical Pod Autoscaler demo

### Security Examples
- **[RBAC with Apache](Projects/role-apache-k8s/)**: Role-based access control implementation

### Helm Charts
- **[Apache Helm Chart](Projects/apache-helm/)**: Custom Helm chart development

## Quick Reference

### Essential kubectl Commands

```bash
# Cluster Info
kubectl cluster-info
kubectl get nodes

# Workloads
kubectl get pods,svc,deploy -A
kubectl describe pod <pod-name>
kubectl logs <pod-name> -f

# Apply Configurations
kubectl apply -f <file.yaml>
kubectl delete -f <file.yaml>

# Scaling
kubectl scale deployment <name> --replicas=5

# Port Forwarding
kubectl port-forward svc/<service-name> 8080:80

# Debugging
kubectl exec -it <pod-name> -- /bin/bash
kubectl top nodes
kubectl top pods
```

### Key Features

- **Self-Healing**: Automatic container restart and rescheduling
- **Load Balancing**: Traffic distribution across healthy pods
- **Auto-Scaling**: Dynamic resource adjustment based on demand
- **Rolling Updates**: Zero-downtime application deployments
- **Service Discovery**: Automatic service registration and discovery
- **Storage Orchestration**: Automatic storage provisioning and mounting
- **Secret Management**: Secure handling of sensitive configuration
- **Multi-Cloud**: Consistent deployment across different environments

---

## Getting Started

1. **Set up a local cluster**: Start with [Kind](Cluster/kind-cluster/) or [Minikube](Cluster/minikube-cluster/)
2. **Learn core concepts**: Work through [K8S examples](K8S/) in order
3. **Deploy applications**: Try the [Projects](Projects/) for hands-on experience
4. **Monitor your cluster**: Set up [monitoring](K8S-Monitoring/) with Prometheus/Grafana
5. **Explore advanced topics**: Dive into RBAC, networking, and custom resources

## Contributing

Feel free to contribute examples, improvements, or additional projects to this repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.