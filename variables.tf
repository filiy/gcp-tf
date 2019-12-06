variable "gcp_project" {
    description = "GCP project name"
    default = "p-teckresources-tfe"
}

variable "machine_type" {
    description = "GCP machine type"
    default = "n1-standard-4"
}

variable "instance_name" {
    description = "GCP instance name"
    default = "demo"
}

variable "image" {
    description = "GCP image"
    default = "debian-cloud/debian-9"
}

provider "google" {
    project = "${var.gcp_project}"
    region = "us-west1"
}