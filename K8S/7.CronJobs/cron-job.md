# `Kubernetes Cron Jobs`

Kubernetes Cron Jobs are used to `run tasks on a schedule`. They are useful for creating periodic and recurring tasks, like running backups or sending emails.

## Key Terms

- **CronJob**: A Kubernetes resource that runs jobs on a scheduled basis.
- **Job**: A Kubernetes resource that runs a pod to completion.
- **Schedule**: The cron format string that defines when the job should run.

## Cron Format

The schedule is defined using the cron format:
```
* * * * *
| | | | |
| | | | +--- Day of the week (0 - 7) (Sunday is both 0 and 7)
| | | +----- Month (1 - 12)
| | +------- Day of the month (1 - 31)
| +--------- Hour (0 - 23)
+----------- Minute (0 - 59)
```

## Example CronJob

Here is an example of a CronJob that runs a job every day at midnight:

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
    name: daily-job
spec:
    schedule: "0 0 * * *"
    jobTemplate:
        spec:
            template:
                spec:
                    containers:
                    - name: my-container
                        image: my-image
                        args:
                        - /bin/sh
                        - -c
                        - echo "Hello, World!"
                    restartPolicy: OnFailure
```

## Commands

- **Create a CronJob**:
    ```sh
    kubectl apply -f cron-job.yaml
    ```

- **List CronJobs**:
    ```sh
    kubectl get cronjobs
    ```

- **Delete a CronJob**:
    ```sh
    kubectl delete cronjob <cronjob-name>
    ```

- **View CronJob logs**:
    ```sh
    kubectl logs job/<job-name>
    ```

## References

- [Kubernetes Documentation: CronJob](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)