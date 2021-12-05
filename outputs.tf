output "vm-external-ip" {
  value = google_compute_instance.first-instance.network_interface[0].access_config[0].nat_ip
  description = "Instance external ip address"
}