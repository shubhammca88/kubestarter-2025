# `Kubernetes StatefulSets`

StatefulSets are a Kubernetes workload API object used to manage stateful applications. They provide guarantees about the ordering and uniqueness of Pods, making them ideal for applications that require persistent storage, stable network identities, and ordered deployments.

## Why Use StatefulSets?

* **Stable, unique network identifiers:** Each Pod in a StatefulSet gets a predictable and stable hostname (e.g., `my-statefulset-0`, `my-statefulset-1`, `my-statefulset-2`). This is crucial for applications that need to maintain stable network connections.
* **Ordered deployment and scaling:** Pods are deployed and scaled in a predictable order, ensuring that dependencies are met and data is initialized correctly.
* **Ordered termination and deletion:** Pods are terminated and deleted in reverse order, preventing data loss and ensuring a graceful shutdown.
* **Persistent storage:** StatefulSets can use PersistentVolumeClaims to provide persistent storage to each Pod, allowing data to be retained even if a Pod is rescheduled or terminated.

## Key Components of a StatefulSet

* **serviceName:**  Specifies the name of a Headless Service that will be associated with the StatefulSet. Headless Services are used to provide unique network identities to each Pod in the StatefulSet.
* **replicas:** The desired number of replicas (Pods) for the StatefulSet.
* **selector:** Used to match Pods to this StatefulSet.
* **template:** Defines the Pod template for the StatefulSet, including container specifications, labels, and resource requests.
* **volumeClaimTemplates:** Defines PersistentVolumeClaims (PVCs) that will be created for each Pod, providing persistent storage.

## Managing StatefulSets with `kubectl`

| Command | Description |
|---|---|
| `kubectl apply -f statefulset.yaml` | Create a StatefulSet from a YAML file. |
| `kubectl get statefulsets` | List all StatefulSets in your cluster. |
| `kubectl describe statefulset <statefulset-name>` | Get detailed information about a StatefulSet. |
| `kubectl edit statefulset <statefulset-name>` | Edit an existing StatefulSet. |
| `kubectl delete statefulset <statefulset-name>` | Delete a StatefulSet. |
| `kubectl scale statefulset <statefulset-name> --replicas=<number>` | Scale the number of replicas in a StatefulSet. |

## Example `statefulset.yaml`

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: my-statefulset
spec:
  serviceName: "my-service"  # Headless Service name
  replicas: 3                # Number of replicas
  selector:
    matchLabels:
      app: my-app           # Label to select Pods
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: my-image:latest
        ports:
        - containerPort: 8080
  volumeClaimTemplates:
  - metadata:
      name: my-persistent-volume
    spec:
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: 1Gi