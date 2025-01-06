# Kubernetes Custom Resource Definitions (CRDs): Extending the Kubernetes API

Custom Resource Definitions (CRDs) are the foundation for extending the Kubernetes API. They allow you to define your own resource types, adding new objects to Kubernetes alongside built-in resources like Pods and Deployments.

## Why Use CRDs?

* **Extend Kubernetes Functionality:** Manage new types of objects specific to your needs, such as databases, message queues, or custom applications.
* **Declarative Management:** Define the desired state of your custom resources, and Kubernetes will ensure it's maintained.
* **Integration with Kubernetes Ecosystem:** Leverage Kubernetes features like controllers, RBAC, and the API server for your custom resources.
* **Code Reusability:** Package and share your CRDs and custom resources with others.

## Key CRD Concepts

* **Group:**  A logical grouping for your custom resources (e.g., `example.com`).
* **Version:**  A specific version of your custom resource definition (e.g., `v1`).
* **Scope:**  Whether the custom resource is namespaced (available within a specific namespace) or cluster-scoped (available across the entire cluster).
* **Names:** Defines the plural, singular, kind, and short names for your custom resource.
* **Schema:**  Defines the structure and validation rules for your custom resource using OpenAPIv3 schema.

## Defining a CRD

CRDs are defined using YAML files.

**Example `crd.yaml`:**

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: [invalid URL removed]
spec:
  group: [invalid URL removed]
  versions:
  - name: v1
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        properties:
          spec:
            type: object
            properties:
              cronSpec:
                type: string
              image:
                type: string
              replicas:
                type: integer
  scope: Namespaced
  names:
    plural: crontabs
    singular: crontab
    kind: CronTab
    shortNames:
    - ct