#!/bin/bash

# Delete existing Kubernetes configurations
kubectl delete -f service.yaml
kubectl delete -f deployment.yaml
kubectl delete -f ns.yaml

# Apply all Kubernetes configurations in the current directory
kubectl apply -f ns.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Port forward the nginx service
kubectl port-forward svc/nginx-service 8080:80 -n nginx

