output "zabbix_server_ip" {
  value = module.zabbix_server.instance_ip
}

output "agent_ips" {
  value = module.vm_agents.instance_ips
}

output "vm_ssh_private_key" {
  description = "private key"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

# variable "network_name" {
#   description = "Name of the network"
#   type        = string
# }

# variable "subnet_name" {
#   description = "Name of the subnetwork"
#   type        = string
# }