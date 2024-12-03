resource "kubernetes_ingress" "example" {
  metadata {
    name      = "example-ingress"
    namespace = "default"
  }

  spec {
    rule {
      http {
        path {
          path    = "/"
          backend {
            service_name = "example-service"
            service_port = 80
          }
        }
      }
    }
  }
}