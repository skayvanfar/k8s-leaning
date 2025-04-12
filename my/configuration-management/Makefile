# Define the directory where the Kubernetes configuration files are stored
K8S_CONFIG_DIR=./k8s-configs/my-namespace

# The 'apply' target applies all Kubernetes resources
apply:
	kubectl apply -f $(K8S_CONFIG_DIR)/my-namespace.yaml
	kubectl apply -f $(K8S_CONFIG_DIR)

# The 'apply-all' target applies all YAML files in the directory
apply-all:
	# First apply the namespace.yaml
	kubectl apply -f $(K8S_CONFIG_DIR)/my-namespace.yaml

	# Retry loop to check if the namespace exists (just created)
	@echo "Waiting for namespace 'my-namespace' to be created..."
	@until kubectl get namespace my-namespace > /dev/null 2>&1; do \
		echo "Namespace 'my-namespace' not yet created, retrying..."; \
		sleep 5; \
	done

	# Then apply all other YAML files
	for file in $(K8S_CONFIG_DIR)/*.yaml; do \
	  if [ $$file != "$(K8S_CONFIG_DIR)/my-namespace.yaml" ]; then \
	    kubectl apply -f $$file; \
	  fi; \
	done