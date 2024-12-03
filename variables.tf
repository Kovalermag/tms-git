variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for the Kubernetes cluster"
  type        = string
  default     = "europe-west3"
}

variable "node_machine_type" {
  description = "Machine type for Kubernetes nodes"
  type        = string
  default     = "e2-medium"
}
