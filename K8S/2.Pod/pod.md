# `Kubernetes Pod YAML`

## Overview
This YAML file defines a Kubernetes Pod, the smallest deployable unit in Kubernetes.

## Key Sections
1. **apiVersion**: Specifies the API version used (`v1` for basic objects like Pods).
2. **kind**: Defines the resource type, in this case, a `Pod`.
3. **metadata**: Provides metadata about the pod:
   - `name`: Unique name of the pod (`my-pod`).
   - `labels`: Key-value pairs to help organize and manage resources (`app: my-app`).

4. **spec**: Contains the pod's desired state, including:
   - `containers`: A list of containers inside the pod. Each container has:
     - `name`: Identifier for the container (`my-container`).
     - `image`: Docker image to run (`nginx:latest`).
     - `ports`: Specifies the port(s) the container listens on (port `80` in this case).
## Create pod 
To create the pod using yml file 
```yml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
  labels:
    app: my-app
spec:
  containers:
  - name: my-container
    image: nginx:latest
    ports:
    - containerPort: 80
```

## Deployment
To create this pod, run the following command:
```bash
kubectl apply -f pod.yaml
```
## Verification
After deployment, verify the pod's status using:
```bash
kubectl get pods
```
## Verification
more information pods 
```bash
kubectl get pods -o wide
```