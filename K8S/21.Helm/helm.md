# Helm: The Kubernetes Package Manager

Helm is a powerful tool that streamlines installing and managing applications on Kubernetes. It simplifies complex deployments, helps you manage application dependencies, and provides a way to version and share your Kubernetes applications.

## Why Use Helm?

* **Simplified Deployments:** Package your Kubernetes applications into charts, making them easy to install and manage.
* **Dependency Management:** Define and manage dependencies between different charts.
* **Version Control:** Track changes to your application deployments with versioned charts.
* **Reusability:** Share and reuse charts within your organization or with the community.
* **Reduced Complexity:** Simplify complex deployments with templating and configuration management.

## Helm Key Concepts

* **Chart:** A package of pre-configured Kubernetes resources (YAML files) that describe an application.
* **Repository:** A collection of charts stored in a central location.
* **Release:** A running instance of a chart in your Kubernetes cluster.
* **Values:**  A YAML file that provides configuration values for a chart.

## Helm Commands

Helm uses the `helm` command-line tool.

### Basic Commands

| Command | Description |
|---|---|
| `helm search repo <keyword>` | Search for charts in a repository. |
| `helm repo add <repo-name> <repo-url>` | Add a chart repository. |
| `helm repo update` | Update the local cache of available charts. |
| `helm install <release-name> <chart-name>` | Install a chart into your cluster. |
| `helm uninstall <release-name>` | Uninstall a release. |
| `helm list` | List all releases in your cluster. |
| `helm show values <chart-name>` | Show the default values for a chart. |
| `helm upgrade <release-name> <chart-name>` | Upgrade a release to a new version of a chart. |
| `helm rollback <release-name> <revision>` | Rollback a release to a previous revision. |
| `helm history <release-name>` | View the revision history of a release. |

### Chart Development Commands

| Command | Description |
|---|---|
| `helm create <chart-name>` | Create a new chart directory. |
| `helm lint <chart-name>` | Check a chart for potential issues. |
| `helm package <chart-name>` | Package a chart into a `.tgz` file. |
| `helm push <chart-package> <repo-name>` | Push a packaged chart to a repository. |

## Helm Charts

A Helm chart typically contains the following:

* `Chart.yaml`:  Metadata about the chart (name, version, description).
* `values.yaml`: Default configuration values for the chart.
* `templates/`: Directory containing Kubernetes resource definition templates.

## Helm Installation

helm install by script 

```bash 
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

chmod 700 get_helm.sh

./get_helm.sh
```
