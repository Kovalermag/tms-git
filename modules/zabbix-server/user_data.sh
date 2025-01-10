#!/bin/bash
# Логирование
exec > /var/log/startup-script.log 2>&1 || echo "Failed to redirect logs"
echo "Running as user: $(whoami)"
echo "Effective UID: $(id -u)"
echo "$(date) - Running startup script..."

# Установка Docker
ls -l /home/debian/docker-compose.yaml || echo 'File not found'
sudo apt-get update && sudo apt-get install -y docker.io docker-compose
docker-compose --version || echo 'Docker Compose not found'
docker-compose -f /home/debian/docker-compose.yaml up -d

# Установка Nginx
apt-get update
apt-get install -y nginx

# Настройка Nginx
cat << EOF > /etc/nginx/sites-available/default
server {
    listen 443;

    # Редирект с HTTPS на HTTP
    return 301 http://$host$request_uri;
}

server {
    listen 80;

    # Обработчик запросов на HTTP
    location / {
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
    }

    # Обработчик стандартной страницы Nginx
    location /nginx-status {
        root /usr/share/nginx/html;
        index index.html;
    }
}
EOF

# Перезапуск Nginx
systemctl enable nginx
systemctl restart nginx || echo "Failed to restart Nginx"
echo "$(date) - Nginx configured and restarted."

echo "$(date) - Startup script completed successfully."

# Установка Prometheus
docker run --name prometheus -d -p 0.0.0.0:9090:9090 prom/prometheus
