# main.tf

provider "null" {
  # Using the 'null' provider to execute shell commands to control Minikube
}

resource "null_resource" "minikube_start" {
  provisioner "local-exec" {
    command = <<-EOT
      minikube start --driver=docker
      # Wait for Minikube to be fully initialized (this can be adjusted based on your environment)
      minikube kubectl -- get nodes
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "minikube_stop" {
  provisioner "local-exec" {
    command = "minikube stop"
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [null_resource.minikube_start]  # Ensure Minikube is started before stopping it
}

output "minikube_ip" {
  value = "http://$(minikube ip):30080"  # Exposed port from your service
}