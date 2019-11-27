variable project {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = ""
}

variable region {
  description = "Region for cloud resources."
  default     = "us-central1"
}

variable network {
  description = "Name of the network to deploy instances to."
  default     = "default"
}

variable subnetwork {
  description = "The subnetwork to deploy to"
  default     = "default"
}

variable subnetwork_project {
  description = "The subnetwork to deploy to"
  default     = "default"
}

variable template_name {
  description = "Name of the instance template."
}

variable group_name {
  description = "Name of the managed instance group."
}

variable base_name {
  description = "Base name of the managed instances."
}

variable size {
  description = "Target size of the managed instance group."
  default     = 1
}

variable startup_script {
  description = "Content of startup-script metadata passed to the instance template."
  default     = ""
}

variable can_ip_forward {
  description = "Allow ip forwarding."
  default     = false
}

variable machine_type {
  description = "Machine type for the VMs in the instance group."
  default     = "f1-micro"
}

variable compute_image {
  description = "Image used for compute VMs."
  default     = "centos-7-v20190905"
}

variable wait_for_instances {
  description = "Wait for all instances to be created/updated before returning"
  default     = true
}

variable service_port {
  description = "Port the service is listening on."
}

variable service_port_name {
  description = "Name of the port the service is listening on."
}

variable service_port_admin {
  description = "Port the service is listening on."
}

variable service_port_admin_name {
  description = "Name of the port the service is listening on."
}

variable target_tags {
  description = "Tag added to instances for firewall and networking."
  default     = "tfe-compute"
}

variable instance_labels {
  description = "Labels added to instances."
  type        = "map"
  default     = {project = "tfe"}
}

variable service_account_email {
  description = "The email of the service account for the instance template."
  default     = "default"
}

variable disk_auto_delete {
  description = "Whether or not the disk should be auto-deleted."
  default     = true
}

variable disk_type {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable disk_size_gb {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
}

variable mode {
  description = "The mode in which to attach this disk, either READ_WRITE or READ_ONLY."
  default     = "READ_WRITE"
}

variable "preemptible" {
  description = "Use preemptible instances - lower price but short-lived instances. See https://cloud.google.com/compute/docs/instances/preemptible for more details"
  default     = "false"
}

variable "automatic_restart" {
  description = "Automatically restart the instance if terminated by GCP - Set to false if using preemptible instances"
  default     = "true"
}

variable "host_maintenance" {
  description = "Defines the maintenance behavior for this instance"
  default     = "MIGRATE"
}

variable "ssh_user" {}
variable "ssh_key_path" {}
variable "ssh_key_pub" {}