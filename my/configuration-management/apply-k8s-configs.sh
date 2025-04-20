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

# Wait for the PersistentVolumeClaim to be bound
kubectl wait --for=condition=bound --timeout=600s pvc/my-pvc -n my-namespace

# Now you can safely run the Job
kubectl apply -f "$CONFIG_DIR/content-writer-job.yaml"
