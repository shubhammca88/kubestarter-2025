# Kubernetes Architecture Explained

This document explains the key components and features of a Kubernetes cluster in simple terms.

## Table of Contents
- [Control Plane (Master Node Components)](#control-plane-master-node-components)
  - [API Server](#api-server)
  - [etcd](#etcd)
  - [Scheduler](#scheduler)
  - [Controller Manager](#controller-manager)
  - [Cloud Controller Manager](#cloud-controller-manager)
- [Worker Node Components](#worker-node-components)
  - [kubelet](#kubelet)
  - [kube-proxy](#kube-proxy)
  - [Container Runtime](#container-runtime)
- [Other Components](#other-components)
  - [Pod](#pod)
  - [Service](#service)
  - [Volume](#volume)
  - [Namespace](#namespace)
  - [Ingress](#ingress)
- [Key Features of Kubernetes](#key-features-of-kubernetes)
  - [Self-Healing](#self-healing)
  - [Load Balancing](#load-balancing)
  - [Scalability](#scalability)
  - [Automated Rollouts and Rollbacks](#automated-rollouts-and-rollbacks)
  - [Resource Optimization](#resource-optimization)
  - [Multi-Cloud Support](#multi-cloud-support)

## Control Plane (Master Node Components)

### API Server
The API Server is the "front desk" of Kubernetes. It handles all requests to the cluster and processes them.

### etcd
etcd is the "database" of Kubernetes, storing information about the cluster, such as nodes, pods, and their statuses.

### Scheduler
The Scheduler decides which machine (Node) should run your containers, considering resource needs and constraints.

### Controller Manager
A collection of controllers that ensure the cluster’s desired state matches the actual state. For example, it restarts crashed Pods.

### Cloud Controller Manager
This component interacts with cloud providers (like AWS or Azure) to handle tasks such as load balancers and persistent storage.

## Worker Node Components

### kubelet
The kubelet ensures containers on the node are running and healthy.

### kube-proxy
kube-proxy manages network communication between Pods and external clients, routing traffic efficiently.

### Container Runtime
The software that runs containers. Popular options include Docker and containerd.

## Other Components

### Pod
The smallest deployable unit in Kubernetes, consisting of one or more containers.

### Service
Provides a stable "address" for Pods, allowing reliable communication between application parts.

### Volume
A way to attach storage to a Pod for persistent data.

### Namespace
A method to divide resources among teams or projects, like folders on a computer.

### Ingress
Manages external access to services, controlling how HTTP and HTTPS traffic is routed.

## Key Features of Kubernetes

### Self-Healing
Kubernetes automatically replaces and reschedules containers if they crash or fail.

### Load Balancing
Distributes traffic across Pods to ensure high availability and reliability.

### Scalability
Easily scale applications up or down based on demand.

### Automated Rollouts and Rollbacks
Kubernetes can update applications without downtime and revert changes if something goes wrong.

### Resource Optimization
Efficiently schedules containers to make the best use of available resources.

### Multi-Cloud Support
Works seamlessly across on-premises, public, or hybrid cloud environments.
