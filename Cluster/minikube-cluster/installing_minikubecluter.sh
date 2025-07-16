#!/bin/bash
# Update your package lists & getting the latest version and dependencies
sudo apt update

# Install some basic required packages
sudo apt install -y curl wget apt-transport-https

# Install and configure Docker
# sudo apt install -y docker.io
# sudo systemctl enable --now docker
# sudo usermod -aG docker $USER && newgrp docker

# Download the Minikube binary using curl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Make executable and move it into your path
chmod 755 minikube
sudo mv minikube /usr/local/bin/

# Start Minikube
minikube start --driver=docker

# Minikube status
minikube status

# To uninstall Minikube
# minikube delete
# sudo rm /usr/local/bin/minikube
