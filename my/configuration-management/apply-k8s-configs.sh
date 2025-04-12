#!/bin/bash

# Path to the directory containing YAML files
CONFIG_DIR="./k8s-configs/my-namespace"

# Apply the namespace first
kubectl apply -f ./k8s-configs/my-namespace/my-namespace.yaml

# Wait for the namespace to be created (you can increase the timeout if needed)
kubectl wait --for=condition=Established namespace/my-namespace --timeout=1s

# Apply all YAML files in the directory
for file in $CONFIG_DIR/*.yaml; do
  kubectl apply -f "$file"
done