variable "region" {
  description = "Region to deploy the VMs"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone to deploy the VMs"
  type        = string
  default     = "us-central1-a"
}

variable "project_id" {
  description = "Google Cloud Project ID"
  default     = "spatial-arcadia-439908-d1"
  type        = string
}

# variable "ssh_keys" {
#   description = "SSH public key to be used for SSH access to the VMs"
#   type        = string
#   sensitive   = false
# }

