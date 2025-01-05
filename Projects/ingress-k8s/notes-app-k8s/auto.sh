#!/bin/bash

cd /home/shubham/Documents/kubestarter-2025/k8s-project/ingress-k8s/notes-app-k8s

# Apply all Kubernetes configurations in the current directory
# kubectl apply -f ns.yml 
kubectl apply -f deployment.yml
kubectl apply -f service.yml

echo "Deployment, Service and Namespace created successfully"

# # Delete all Kubernetes configurations in the current directory
# kubectl delete -f ns.yml 
# kubectl delete -f deployment.yml
# kubectl delete -f service.yml

# echo "Deployment, Service and Namespace deleted successfully"
