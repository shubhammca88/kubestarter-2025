#!/bin/bash

# Install kind-cluster
# For AMD64 / x86_64 (linux)
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# install kubectl 
VERSION="v1.32.0"
URL="https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl"
INSTALL_DIR="/usr/local/bin"

curl -LO "$URL"
chmod +x kubectl
sudo mv kubectl $INSTALL_DIR/
kubectl version --client

rm -f kubectl
rm -rf kind

echo "kind & kubectl installation complete."

# -----------------------------Linux--------------------------------------
# chmod 777 installing_kindcluster.sh   (for permision)
# ./installing_kindcluster.sh     (for install )

# ----------------------verify---------------------------------------------
# kind version
# kubectl version
# docker --version