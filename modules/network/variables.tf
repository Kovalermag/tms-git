variable "network_name" {
  description = "The name of the network to attach resources to"
  type        = string
  default     = "zabbix-network"
}

variable "subnetwork" {
  description = "The name of the subnetwork to attach resources to"
  type        = string
  default     = null
}

variable "static_ip" {
  description = "The static IP address to assign to the instance"
  type        = string
  default     = null
}


variable "region" {
  description = "Region to deploy the VMs"
  type        = string
  default     = "europe-central2"
}

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

variable "subnet_name" {
  default = "zabbix-subnetwork"
  type        = string
}