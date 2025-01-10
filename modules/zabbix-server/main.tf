resource "google_compute_instance" "zabbix_server" {
  count        = var.vm_count
  name         = "zabbix-server-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = var.zone
  tags         = ["https-server", "http-server", "lb-health-check"]
  
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20 # var.disk_size
      type = "pd-standard"

    }
  }

  scheduling {
    preemptible                 = true
    automatic_restart           = false
    provisioning_model          = "SPOT"
    instance_termination_action = "STOP"
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name
    
    access_config {
      # nat_ip = var.static_ip
    }
  }

  metadata = {
  ssh-keys = "debian:${file("C:/Users/Mi/.ssh/id_rsa.pub")}"
}

  connection {
  type        = "ssh"
  user        = "debian"              # Имя пользователя для подключения
  private_key = file("C:/Users/Mi/.ssh/id_rsa") # Путь к приватному ключу
  host        = self.network_interface[0].access_config[0].nat_ip # Используем публичный IP
  }

 # Передаем файл до выполнения скрипта
  provisioner "file" {
    source      = "${path.module}/zabbix-docker-compose.yaml"
    destination = "/home/debian/docker-compose.yaml"
  }

# Автоматизация 
  metadata_startup_script = file("${path.module}/user_data.sh")
}   

# resource "tls_private_key" "ssh_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

output "instance_ip" {
  value = [for instance in google_compute_instance.zabbix_server : instance.network_interface[0].access_config[0].nat_ip]
 # value = [for instance in google_compute_instance.zabbix_agent  : instance.network_interface[0].access_config[0].nat_ip]
}

