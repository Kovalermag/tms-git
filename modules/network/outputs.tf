output "network_name" {
  value = google_compute_network.network_name.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnet_name.name
}

# output "zabbix_static_ip" {
#   value = google_compute_address.zabbix_static_ip.address
# }

output "allow_http" {
  value = google_compute_firewall.allow_http.id
}

# output "static_ip" {
#   value = google_compute_address.zabbix_static_ip.address
# }