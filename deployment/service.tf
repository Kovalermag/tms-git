resource "kubernetes_service" "example" {
  metadata {
    name      = "example-service"
    namespace = "default"
    labels = {
      app = "example"
    }
  }

  spec {
    selector = {
      app = "example"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
