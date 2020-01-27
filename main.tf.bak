terraform {
  backend "remote" {
    hostname = "tfe.filiy.team.arctiq.ca" 
    token = "e6r1GOPwYNzGRQ.atlasv1.IBYVeizznQBRqBea5Y3y1LqzqBH4LwUYbFr1vHO7ZGLJdwsc7m7Ap0WHlyvorLXdyoI"
    organization = "arctiq-lab"

    workspaces {
      name = "gcp-vm"
    }
  }
}


resource "google_compute_instance" "demo" {
    name = "${var.instance_name}"
    machine_type = "${var.machine_type}"
    zone = "us-west1-b"

    boot_disk {
        initialize_params {
            image = "${var.image}"
        }
    }

    network_interface {
        network = "default"

        access_config {
            // Ephemeral IP
        }
    }

}

resource "null_resource" "gcloud" {
  provisioner "local-exec" {
    command = "gcloud version"
  }
}
