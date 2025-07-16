#!/bin/bash

# Update package lists
sudo apt update

# Install required packages
sudo apt install -y curl apt-transport-https ca-certificates gnupg

# Download the latest kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Make kubectl executable
chmod +x kubectl

# Move kubectl to PATH
sudo mv kubectl /usr/local/bin/

# Verify installation
kubectl version --client

echo "kubectl installed successfully!"