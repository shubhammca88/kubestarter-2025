# Kubernetes RBAC: Securing Your Cluster with Role-Based Access Control

Role-Based Access Control (RBAC) in Kubernetes is a powerful method for controlling access to your cluster's resources. It allows you to define fine-grained permissions and ensure that only authorized users, groups, and service accounts can perform specific actions.

## Why Use RBAC?

* **Enhanced Security:** Protect your cluster from unauthorized access and potential threats.
* **Compliance:**  Meet organizational and regulatory security requirements.
* **Least Privilege Principle:** Grant users and service accounts only the necessary permissions to perform their tasks.
* **Flexibility:** Define roles and permissions that align with your organizational structure and workflows.
* **Improved Auditability:** Track and monitor actions performed within the cluster.

## RBAC Core Components

* **Subject:** An entity that can perform actions in the cluster. This can be a user, a group of users, or a service account.
* **Role:**  A collection of rules that define permissions within a specific namespace.
* **ClusterRole:**  Similar to a Role, but it defines permissions across the entire cluster, including all namespaces.
* **RoleBinding:** Grants the permissions defined in a Role to a Subject within a namespace.
* **ClusterRoleBinding:** Grants the permissions defined in a ClusterRole to a Subject across the entire cluster.

## Defining Roles and RoleBindings

Roles and RoleBindings are defined using YAML files.

**Example `role.yaml`:**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: my-namespace
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

**Example `rolebinding.yaml`:**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: my-namespace
subjects:
- kind: User
  name: jane # Name of the user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```