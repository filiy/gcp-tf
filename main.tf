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

data "google_iam_policy" "admin" {
  binding {
    role = "roles/iap.httpsResourceAccessor"
    members = [
      "user:jane@example.com",
    ]
  }
}
