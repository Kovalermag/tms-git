FROM ubuntu:20.04
RUN apt-get update && \
    apt-get install -y nginx curl
RUN mkdir -p /app/static
COPY nginx.conf /etc/nginx/
COPY app/static/*  /var/www/html/
EXPOSE 80/tcp
# ENTRYPOINT ["-p" "8080:80"]
CMD ["nginx", "-g", "daemon off;"]