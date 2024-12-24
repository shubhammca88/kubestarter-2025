#!/bin/bash
# Update your package lists & getting the latest version and dependencies
sudo apt update

# Install some basic required packages
sudo apt install -y curl wget apt-transport-https

# Minikube can run a Kubernetes cluster either in a VM or locally via Docker. This guide demonstrates the Docker method.
# sudo apt install -y docker.io
# sudo systemctl enable --now docker
# sudo usermod -aG docker $USER && newgrp docker

# Download the Minikube binary using curl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Executable and move it into your path
chmod +x minikube
sudo mv minikube /usr/local/bin/

# Start Minikube
minikube start --driver=docker --vm=true 

# Minikube status
minikube status