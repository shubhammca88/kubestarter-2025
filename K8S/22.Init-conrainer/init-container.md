# Kubernetes Init Containers: Performing Setup Tasks Before Your Application Starts

Init containers in Kubernetes are specialized containers that run before the main containers in a pod. They are used to perform setup tasks, such as initializing databases, configuring the environment, or downloading necessary files, before your application starts.

## Why Use Init Containers?

* **Separate Setup Logic:**  Keep your application container focused on its primary task, while offloading setup and initialization logic to init containers.
* **Dependency Management:** Ensure that necessary dependencies are met before your application starts.
* **Configuration and Initialization:** Perform tasks like setting up environment variables, creating configuration files, or initializing databases.
* **Increased Reliability:**  Improve the reliability of your application deployments by ensuring that all prerequisites are met.

## How Init Containers Work

1. **Run to Completion:** Init containers always run to completion before the main containers start.
2. **Sequential Execution:**  If you have multiple init containers, they run in the order they are defined in the pod specification.
3. **Shared Volume Mounts:** Init containers can share volume mounts with the main containers, allowing them to access and modify files.
4. **Status and Error Handling:** Kubernetes tracks the status of init containers, and if any init container fails, the pod will restart until all init containers succeed.

## Defining Init Containers

You define init containers in the `spec.initContainers` section of your pod definition.

**Example `pod-with-init-containers.yaml`:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  initContainers:
  - name: init-mydb
    image: busybox
    command: ['sh', '-c', 'echo -e "CREATE DATABASE mydb;\nGRANT ALL PRIVILEGES ON mydb.* TO \'user\'@\'%\' IDENTIFIED BY \'password\';" > /tmp/setup.sql']
    volumeMounts:
    - name: config-volume
      mountPath: /tmp
  - name: init-myservice
    image: busybox
    command: ['sh', '-c', 'until nslookup myservice; do echo waiting for myservice; sleep 2; done;']
  containers:
  - name: my-app
    image: my-app-image
    volumeMounts:
    - name: config-volume
      mountPath: /tmp
  volumes:
  - name: config-volume
    emptyDir: {}