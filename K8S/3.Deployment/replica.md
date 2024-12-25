# `Replica in Kubernetes`

In Kubernetes (k8s), a ReplicaSet ensures that a specified number of pod replicas are running at any given time. 

Think of it like this: you have an application that needs to be highly available. To achieve this, you want multiple instances of it running concurrently. A ReplicaSet helps you do exactly that. It ensures that the desired number of pods (each running your application) are always up and running. If a pod fails, the ReplicaSet automatically creates a new one to replace it.

## Key features of ReplicaSets:

* **Self-healing:** Automatically replaces failed pods.
* **Scaling:** Easily increase or decrease the number of replicas.
* **Continuous availability:** Ensures your application remains accessible even if some pods fail.

## usefull command
create repicas & scaled 
```bash
kubectl scale deployment/nginx-deploy -n nginx --replicas=1
```
## `Rolling update`
In Kubernetes, a rolling update is a deployment strategy that allows you to update your application (deployed as Pods) with zero downtime. It does this by incrementally replacing old Pods with new ones.

## Uefull command 
```bash
kubectl set image deployment/<pods_name> image:image:update
```

## How Rolling Updates Work

* **New ReplicaSet:** When you update a Deployment, Kubernetes creates a new ReplicaSet for the updated version of your application.
* **Gradual Rollout:** The new ReplicaSet starts creating Pods with the updated version.
* **Controlled Termination:** Kubernetes gradually terminates Pods managed by the old ReplicaSet, while ensuring that MaxUnavailable is not exceeded.
* **Rollback:** If there's an issue with the update, you can easily roll back to the previous version of your application.

## Benefits of Rolling Updates

* **Zero Downtime:** Ensures continuous availability of your application during updates.
* **Controlled Rollout:** Provides fine-grained control over the update process.
* **Easy Rollback:** Allows you to quickly revert to a previous version if needed.
* **Reduced Risk:** Minimizes the impact of faulty updates by incrementally rolling out changes.

## Example

* Imagine you have a Deployment with 5 Pods running an older version of your application. You want to update to a new version using a rolling update.
Kubernetes will create a new ReplicaSet for the updated version.
It might create 1 new Pod (depending on MaxSurge).
Once the new Pod is healthy, it will terminate 1 old Pod.
This process continues until all Pods are updated to the new version.