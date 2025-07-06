# Kubernetes Probes

Kubernetes probes are used to monitor the health of your containers. They help Kubernetes determine if a container is running correctly and how to react if it's not. There are three main types of probes:

## 1. Liveness Probe

* **Purpose:** Checks if a container is running correctly. If the probe fails, Kubernetes restarts the container.
* **How it works:** Performs an action (HTTP request, command execution, TCP socket check) within the container at regular intervals.
* **Example:** Check if a web server is responding to requests on port 8080.

## 2. Readiness Probe

* **Purpose:** Checks if a container is ready to serve traffic. If the probe fails, Kubernetes stops sending traffic to the container.
* **How it works:** Similar to liveness probes, it performs an action to determine if the container is ready.
* **Example:** Check if a database connection is established before allowing traffic to the application.

## 3. Startup Probe

* **Purpose:** Checks if a container has started successfully.  Useful for containers with slow startup times.
* **How it works:**  Performs an action to determine if the container has initialized correctly. If the probe fails, Kubernetes restarts the container.
* **Example:** Check if a long-running initialization process within the container has completed.

## Probe Configuration

Probes are defined in your Pod's YAML configuration file. Here's a basic example:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: my-image
    livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 15
      periodSeconds: 20
    readinessProbe:
      tcpSocket:
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 10
    startupProbe:
      exec:
        command: ["cat", "/tmp/ready"]
      failureThreshold: 30
      periodSeconds: 10