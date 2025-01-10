resource "google_compute_network" "network_name" {
  name = var.network_name
  
}

resource "google_compute_subnetwork" "subnet_name" {
  name          = var.subnet_name
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.network_name.id
}

# resource "google_compute_address" "zabbix_static_ip" {
#   name   = "zabbix-server-ip"
#   region = var.region
# }

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.network_name.id

  allow {
     protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["443","22", "80", "10051", "10050", "8080", "9090"]
  }
  source_ranges = ["0.0.0.0/0"]  
  target_tags = ["http-server", "https-server", "http-server", "lb-health-check"]
}