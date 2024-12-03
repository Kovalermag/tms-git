provider "google" {
  project = var.project
  region  = var.region
}

provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}

data "google_client_config" "default" {}

resource "google_container_cluster" "primary" {
  name               = "my-k8s-cluster"
  location           = var.region
  initial_node_count = 2

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = 20
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

output "kubeconfig_host" {
  value = google_container_cluster.primary.endpoint
}
