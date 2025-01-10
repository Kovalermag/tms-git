variable "network_name" {
  description = "The name of the network to attach resources to"
  type        = string
  default     = "default"
}

variable "subnet_name" {
  description = "The name of the subnetwork to attach resources to"
  type        = string
  default     = null
}

variable "static_ip" {
  description = "The static IP address to assign to the instance"
  type        = string
  default     = null
}


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

# variable "ssh_keys" {
#   description = "SSH public key to be used for SSH access to the VMs"
#   type        = string
#   sensitive   = false
# }

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

variable "ssh_keys" {
  description = "Public SSH key for accessing the VM"
  type        = string
  }
