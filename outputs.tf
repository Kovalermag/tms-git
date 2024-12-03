output "cluster_endpoint" {
  description = "Endpoint for the Kubernetes cluster"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_name" {
  description = "Name of the Kubernetes cluster"
  value       = google_container_cluster.primary.name
}

