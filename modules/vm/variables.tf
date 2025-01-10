

# variable "region" {
#   description = "Region to deploy the VMs"
#   type        = string
#   default     = "us-central1"
# }

variable "zone" {
  description = "Zone to deploy the VMs"
  type        = string
  default     = "europe-central2-a"
}

variable "ssh_keys" {
  description = "SSH public key to be used for SSH access to the VMs"
  type        = string
  sensitive   = false
}

variable "disk_size" {
  description = "Disk size in GB"
  type = number
  default = 20
}

variable "vm_count" {
  description = "Number of Zabbix agent VMs to create"
  type        = number
  default     = 1
}

variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnetwork"
  type        = string
}

variable "vm_machine_type" {
  description = "Machine type for VMs"
  type        = string
  default     = "e2-medium"
}

variable "vm_image" {
  description = "Image for VMs"
  type        = string
  default     = "debian-cloud/debian-11"
}