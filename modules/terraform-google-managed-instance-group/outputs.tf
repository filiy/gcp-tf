output instance_group {
  description = "Instance group output"
  value       = "${google_compute_region_instance_group_manager.default}"
}

output instance_group_template {
  description = "Instance group tempalte output"
  value       = "${google_compute_instance_template.default}"
}

output external_ip {
  description = "external ip"
  value       = "${data.google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
}

output internal_ip {
  description = "internal ip"
  value       = "${data.google_compute_instance.default.network_interface[0].network_ip}"
}