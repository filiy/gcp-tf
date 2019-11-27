resource "google_compute_instance_template" "default" {
  project                 = "${var.project}"
  name                    = "${var.template_name}"
  machine_type            = "${var.machine_type}"
  region                  = "${var.region}"
  tags                    = ["${var.target_tags}"]
  labels                  = "${var.instance_labels}"
  can_ip_forward          = "${var.can_ip_forward}"

  network_interface {
    network             = "${var.network}"
    subnetwork          = "${var.subnetwork}"
    subnetwork_project  = "${var.subnetwork_project}"
    access_config {}
  }

  disk {
    auto_delete  = "${var.disk_auto_delete}"
    boot         = true
    source_image = "${var.compute_image}"
    type         = "PERSISTENT"
    disk_type    = "${var.disk_type}"
    disk_size_gb = "${var.disk_size_gb}"
    mode         = "${var.mode}"
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file("${var.ssh_key_path}${var.ssh_key_pub}")}"
  }

  scheduling {
    preemptible         = "${var.preemptible}"
    automatic_restart   = "${var.automatic_restart}"
    on_host_maintenance = "${var.host_maintenance}"
  }
}

resource "google_compute_region_instance_group_manager" "default" {
  project            = "${var.project}"
  name               = "${var.group_name}"
  target_size        = "${var.size}"
  wait_for_instances = "${var.wait_for_instances}"
  base_instance_name = "${var.base_name}"
  region             = "${var.region}"

  named_port {
   name = "${var.service_port_name}"
   port = "${var.service_port}"
  }
  named_port { 
   name = "${var.service_port_admin_name}"
   port = "${var.service_port_admin}"
  }
    
  version {
    instance_template = google_compute_instance_template.default.self_link
  }

}

data "google_compute_region_instance_group" "default" {
  self_link = "${google_compute_region_instance_group_manager.default.instance_group}"
}

data "google_compute_instance" "default" {
  self_link = "${data.google_compute_region_instance_group.default.instances[0].instance}" 
}