resource "kubernetes_deployment" "example" {
  metadata {
    name      = "example-deployment"
    namespace = "default"
    labels = {
      app = "example"
    }
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "example"
      }
    }
    template {
      metadata {
        labels = {
          app = "example"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
