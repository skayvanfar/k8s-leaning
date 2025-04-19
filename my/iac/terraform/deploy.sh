#!/bin/bash

# Step 1: Apply Terraform to manage infrastructure (Minikube, VMs, etc.)
terraform apply -auto-approve

# Step 2: Apply Kubernetes resources (deployment, service, etc.)
kubectl apply -f ./k8s-configs/my-namespace/