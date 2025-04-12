#!/bin/bash

# Path to the directory containing YAML files
CONFIG_DIR="./k8s-configs/my-namespace"

# Apply all YAML files in the directory
for file in $CONFIG_DIR/*.yaml; do
  kubectl apply -f "$file"
done