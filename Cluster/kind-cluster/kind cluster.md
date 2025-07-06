# kind: `Kubernetes IN Docker`

kind is a tool that provides a simple way to run local Kubernetes clusters using Docker container "nodes". It's particularly useful for local development, testing, and CI/CD pipelines.

## Why Use kind?

* **Easy Setup:**  Quickly create a Kubernetes cluster on your local machine with a single command.
* **Lightweight:**  kind clusters are lightweight and consume fewer resources compared to other local Kubernetes solutions.
* **Fast:**  Creating and deleting kind clusters is fast, making it ideal for iterative development and testing.
* **Reproducible:**  kind clusters are reproducible, ensuring consistency across different environments.
* **Integration with Docker:**  Leverages your existing Docker installation, simplifying setup and management.

## kind Key Concepts

* **Cluster:** A set of Docker containers that form a Kubernetes cluster.
* **Node:** A Docker container that acts as a node in the kind cluster.
* **Config:** A YAML file that defines the configuration of the kind cluster (number of nodes, Kubernetes version, etc.).

## kind Commands

kind uses the `kind` command-line tool.

### Basic Commands

| Command | Description |
|---|---|
| `kind cluster-info` | verify the cluster is running |
| `kind create cluster` | default create a new kind cluster. |
| `kind create cluster --name=<cluster-name> --config=kind-config.yaml` | Create a cluster with a specific configuration file. |
| `kind get clusters` | List all kind clusters. |
| `kind delete cluster` | Delete the default kind cluster. |
| `kind delete cluster --name <cluster-name>` | Delete a specific kind cluster. |
| `kind export logs` | Export cluster logs to a directory. |

### Advanced Commands

| Command | Description |
|---|---|
| `kind load docker-image <image-name>` | Load a Docker image into a kind cluster. |
| `kind build node-image` | Build a custom node image for your kind cluster. |
| `kind get kubeconfig` | Get the kubeconfig for a kind cluster. |

## kind Configuration

You can customize the kind cluster configuration using a YAML file.

**Example `kind-config.yaml`:**

```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
  replicas: 2