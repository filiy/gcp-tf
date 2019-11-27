provider "google" {
}

module "instance-group" {
  source                    = "./modules/terraform-google-managed-instance-group"
  template_name             = var.template_name
  group_name                = var.group_name
  base_name                 = var.base_name
  project                   = var.project
  region                    = var.region
  compute_image             = var.compute_image
  machine_type              = var.machine_type
  disk_size_gb              = var.disk_size
  size                      = var.startup_size
  network                   = var.network
  subnetwork                = var.subnetwork
  subnetwork_project        = var.subnetwork_project
  service_port              = var.service_port
  service_port_name         = var.service_port_name
  service_port_admin        = var.service_port_admin
  service_port_admin_name   = var.service_port_admin_name
  ssh_user                  = var.ssh_user
  ssh_key_path              = var.ssh_key_path
  ssh_key_pub               = var.ssh_key_pub
}