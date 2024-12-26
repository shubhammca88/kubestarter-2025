# `Persistent Volumes` in Kubernetes

## Overview

A Persistent Volume (PV) in Kubernetes is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. PVs are resources in the cluster just like nodes are cluster resources. They are independent of the lifecycle of any individual pod that uses the PV.

<kbd>![imgae](/img/pv-pvc-k8s.png)</kbd>

## Key Terms

- **Persistent Volume (PV)**: A storage resource in a Kubernetes cluster.
- **Persistent Volume Claim (PVC)**: A request for storage by a user.
- **Storage Class**: A way to describe the "classes" of storage they offer.

## Commands

- **Create a PV**:
    ```sh
    kubectl apply -f pv.yaml
    ```

- **View PVs**:
    ```sh
    kubectl get pv
    ```

- **Describe a PV**:
    ```sh
    kubectl describe pv <pv-name>
    ```

- **Delete a PV**:
    ```sh
    kubectl delete pv <pv-name>
    ```

## Example YAML File

Here is an example of a Persistent Volume YAML file:

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
    name: example-pv
spec:
    capacity:
        storage: 10Gi
    accessModes:
        - ReadWriteOnce
    persistentVolumeReclaimPolicy: Retain
    hostPath:
        path: "/mnt/data"
```

And an example of a Persistent Volume Claim YAML file:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
    name: example-pvc
spec:
    accessModes:
        - ReadWriteOnce
    resources:
        requests:
            storage: 10Gi
```

## Conclusion

Persistent Volumes and Persistent Volume Claims are essential components in Kubernetes for `managing storage resources`. They provide a way to decouple storage from the lifecycle of pods, ensuring data persistence and stability.
