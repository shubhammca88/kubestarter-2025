# Kubernetes ConfigMaps
ConfigMaps in Kubernetes provide a way to store and manage configuration data separately from your application's code. This allows you to easily modify configuration without rebuilding your container images.

## Why Use ConfigMaps?

* **Separation of Concerns:**  Decouples configuration from code, making applications more portable and easier to manage.
* **Flexibility:**  Allows you to update configuration without rebuilding or redeploying your application.
* **Environment-Specific Configuration:**  Enables you to easily configure applications for different environments (development, staging, production).
* **Secrets Management:** Can be used to store non-sensitive configuration data, keeping it separate from secrets.

## Types of ConfigMaps

* **Literal values:**  Define configuration data directly in the ConfigMap definition.
* **From files:**  Load configuration data from files.
* **From directories:**  Load configuration data from directories.

## Accessing ConfigMaps in Pods

* **Environment variables:**  Inject ConfigMap data as environment variables.
* **Volume mounts:**  Mount ConfigMap data as a volume within the Pod.

## Managing ConfigMaps with `kubectl`

| Command | Description |
|---|---|
| `kubectl create configmap <configmap-name> --from-literal=key=value` | Create a ConfigMap from literal values. |
| `kubectl create configmap <configmap-name> --from-file=<file-name>` | Create a ConfigMap from a file. |
| `kubectl get configmaps` | List all ConfigMaps in your cluster. |
| `kubectl describe configmap <configmap-name>` | Get detailed information about a ConfigMap. |
| `kubectl edit configmap <configmap-name>` | Edit an existing ConfigMap. |
| `kubectl delete configmap <configmap-name>` | Delete a ConfigMap. |

## Example `configmap.yaml`

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  database_host: my-database-host
  database_port: "3306"