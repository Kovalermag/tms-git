provider "google" {
  credentials = file("mygcp-creds.json")
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "zabbix_server" {
  source          = "./modules/zabbix-server"
  # static_ip       = module.network.zabbix_static_ip
  zone            = var.zone
  network_name    = module.network.network_name
  subnet_name     = module.network.subnet_name
  depends_on      = [module.network.allow_http, module.network.allow_https]
  ssh_keys = "debian:${file("C:/Users/Mi/.ssh/id_rsa.pub")}"
  
  
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "vm_agents" {
  source      = "./modules/vm"
  zone        = var.zone
  #vm_count    = 2
  # network_name   = var.network_name
  # subnet_name    = var.subnet_name
  network_name    = module.network.network_name
  subnet_name     = module.network.subnet_name
  ssh_keys = "debian:${file("C:/Users/Mi/.ssh/id_rsa.pub")}"
  #"ubuntu:${tls_private_key.ssh_key.public_key_openssh}"
  
}

module "network" {
  source         = "./modules/network"
  network_name = "zabbix-network"
  subnet_name  = "zabbix-subnetwork"
  # network_name   = module.network.network_name
  # subnetwork     = module.network.subnet_name
  region         = var.region
  ssh_keys = "debian:${file("C:/Users/Mi/.ssh/id_rsa.pub")}"
}