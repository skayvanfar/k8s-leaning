K8S_CONFIG_DIR=../k8s-configs/my-namespace

apply:
	kubectl apply -f $(K8S_CONFIG_DIR)

apply-all:
	for file in $(K8S_CONFIG_DIR)/*.yaml; do \
	  kubectl apply -f $$file; \
	done