# `Deployment YAML File`

This document provides an example deployment YAML file and explains key terms used in the configuration. YAML files are widely used for configuration management in software deployment and orchestration tools such as Kubernetes and Docker Compose.

## Example Deployment YAML File

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: example-deployment
  labels:
    app: example-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: example-app
  template:
    metadata:
      labels:
        app: example-app
    spec:
      containers:
      - name: example-container
        image: example-image:1.0.0
        ports:
        - containerPort: 8080
        env:
        - name: ENVIRONMENT
          value: "production"
        resources:
          requests:
            memory: "64Mi"
            cpu: "250m"
          limits:
            memory: "128Mi"
            cpu: "500m"
      restartPolicy: Always
```

## Terms Explained

### 1. `apiVersion`
Specifies the API version of the resource. For example, `apps/v1` indicates the version for deployment resources.

### 2. `kind`
Defines the type of Kubernetes object being created, such as `Deployment`, `Service`, or `Pod`.

### 3. `metadata`
Holds metadata about the resource, including:
- `name`: The unique identifier for the resource.
- `labels`: Key-value pairs used for organizing and selecting resources.

### 4. `spec`
Defines the desired state of the resource. For deployments, this includes:

#### `replicas`
Specifies the number of pod replicas to maintain.

#### `selector`
Determines which pods the deployment manages using matching labels.

#### `template`
Describes the pods to create, including metadata and the specification of containers.

### 5. `containers`
Lists the containers within the pod. Each container configuration includes:

#### `name`
Unique name for the container within the pod.

#### `image`
Specifies the container image, including the name and tag (e.g., `example-image:1.0.0`).

#### `ports`
Defines ports that the container exposes.

#### `env`
Environment variables to be injected into the container.

#### `resources`
Resource management settings, including:
- `requests`: Minimum resources the container needs.
- `limits`: Maximum resources the container can use.

### 6. `restartPolicy`
Defines the policy for restarting the container. Common values include `Always`, `OnFailure`, and `Never`.

---

## Notes
- Modify the `name`, `image`, and `replicas` fields as per your deployment requirements.
- Ensure the specified image is available in your container registry.
- Adjust resource requests and limits to optimize performance and cost.
