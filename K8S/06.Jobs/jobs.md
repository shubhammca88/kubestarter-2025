# `Kubernetes Jobs`

Jobs in Kubernetes are responsible for running finite tasks to completion. They create one or more Pods and ensure that a specified number of them successfully terminate.

## Use Cases

* **Batch processing:** Handling large datasets, running ETL pipelines, or performing image manipulation.
* **One-off tasks:** Running scripts, backups, or reports.
* **CI/CD pipelines:** Executing build, test, and deployment tasks.

## Key Features

* **Reliable execution:** Ensures tasks are completed even if Pods fail or are restarted.
* **Parallelism:** Allows you to specify how many Pods should run concurrently.
* **Completion tracking:** Tracks the successful completion of Pods and provides status updates.
* **Cleanup:** Automatically cleans up associated Pods after Job completion.

## Useful `kubectl` Commands

| Command | Description |
|---|---|
| `kubectl apply -f job.yaml` | Create a Job from a YAML file |
| `kubectl get jobs` | List all Jobs in your cluster |
| `kubectl describe job <job-name>` | Get detailed information about a Job |
| `kubectl logs <job-name>` | View logs from the Pods created by a Job |
| `kubectl delete job <job-name>` | Delete a Job |

## Example `job.yaml`

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: my-job
spec:
  template:
    spec:
      containers:
      - name: my-container
        image: my-image:latest
        command: ["my-command", "arg1", "arg2"]
      restartPolicy: Never
```