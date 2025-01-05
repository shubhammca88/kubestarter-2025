# Kubernetes Metrics Server: Monitoring Resource Usage

The Metrics Server is a crucial component in Kubernetes that provides resource usage data for Pods and nodes. This data is essential for autoscaling and monitoring the performance of your applications.

## What Does the Metrics Server Do?

* **Collects resource metrics:** Gathers CPU and memory usage data from kubelets running on each node.
* **Exposes metrics via API:** Makes this data available through the Kubernetes API server.
* **Used for autoscaling:** The Horizontal Pod Autoscaler (HPA) relies on Metrics Server data to scale deployments.
* **Provides real-time insights:** Enables you to monitor resource consumption in real-time using `kubectl top`.

## Why Use the Metrics Server?

* **Essential for autoscaling:**  HPA needs resource usage data to make scaling decisions.
* **Real-time monitoring:**  Provides up-to-date information on resource consumption.
* **Lightweight and efficient:** Minimal overhead on your cluster.
* **Easy to deploy:**  Simple installation and configuration.

## Accessing Metrics with `kubectl`

| Command | Description |
|---|---|
| `kubectl top nodes` | View resource usage of nodes. |
| `kubectl top pods` | View resource usage of pods in the current namespace. |
| `kubectl top pods --all-namespaces` | View resource usage of pods across all namespaces. |

## Deploying the Metrics Server

The Metrics Server is often included by default in managed Kubernetes offerings. If you need to install it manually, you can use `kubectl apply` with a YAML manifest:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: metrics-server
spec:
  selector:
    matchLabels:
      k8s-app: metrics-server
  template:
    metadata:
      labels:
        k8s-app: metrics-server
    spec:
      serviceAccountName: metrics-server
      containers:
      - name: metrics-server
        image: k8s.gcr.io/metrics-server/metrics-server:v0.6.1 
        args:
        - --cert-dir=/tmp
        - --secure-port=4443
        ports:
        - name: https
          containerPort: 4443
          protocol: TCP