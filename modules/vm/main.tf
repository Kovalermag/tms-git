
resource "google_compute_instance" "zabbix_agent" {
  count        = var.vm_count
  name         = "zabbix-agent-${count.index + 1}"
  machine_type = var.vm_machine_type
  zone         = var.zone
  tags         = ["https-server", "http-server", "lb-health-check"]
  

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.vm_image
      size  = var.disk_size
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
      
    }
  }
  
     metadata = {
     ssh-keys = "debian:${file("C:/Users/Mi/.ssh/id_rsa.pub")}"
  }

#   metadata_startup_script = <<-EOT
#     #!/bin/bash
#     apt-get update && apt-get install -y docker.io docker-compose || exit 1
#     mkdir /opt/zabbix-agent
#     echo '${file("${path.module}/agent-docker-compose.yaml")}' > /opt/zabbix-agent/docker-compose.yaml
#     cd /opt/zabbix-agent && docker-compose up -d
#   EOT
# }

# Для передачи файла
  connection {
  type        = "ssh"
  user        = "debian"              # Имя пользователя для подключения
  private_key = file("C:/Users/Mi/.ssh/id_rsa") # Путь к приватному ключу
  host        = self.network_interface[0].access_config[0].nat_ip # Используем публичный IP
  }

  # Передаем файл до выполнения скрипта
  provisioner "file" {
    source      = "${path.module}/agent-docker-compose.yaml"
    destination = "/home/debian/docker-compose.yaml"
  }

# Автоматизация 
  metadata_startup_script = file("${path.module}/user_data.sh")
}   

output "instance_ips" {
  value = [for instance in google_compute_instance.zabbix_agent : instance.network_interface[0].access_config[0].nat_ip]
}

# output "instance_ip" {
#   value = [for instance in google_compute_instance.zabbix_agent : instance.network_interface[0].access_config[0].nat_ip if instance.network_interface[0].access_config != []]
# }
