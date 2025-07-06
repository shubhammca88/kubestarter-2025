# Kubernetes Horizontal Pod Autoscaler (HPA)

The Horizontal Pod Autoscaler (HPA) automatically scales the number of Pods in a deployment, replica set, or stateful set based on observed CPU utilization or other metrics.

## How HPA Works

1. **Metrics:** HPA monitors metrics like CPU utilization, memory usage, or custom metrics.
2. **Target:** You define a target value for the metric (e.g., average CPU utilization of 50%).
3. **Scaling:** HPA compares the current metric value to the target. If the current value exceeds the target, HPA increases the number of Pods; if it's below the target, HPA decreases the number of Pods.

## Benefits of HPA

* **Efficiency:** Automatically adjusts resources based on demand, optimizing resource utilization.
* **Availability:** Ensures your application can handle varying workloads.
* **Cost Savings:** Avoids over-provisioning resources by scaling down when demand is low.

## Creating an HPA

You can create an HPA using a YAML definition:

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: my-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-deployment
  minReplicas: 3
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50