terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.1.0"
    }
  }
}

resource "kubernetes_namespace" "apps" {
  metadata {
    name = "apps"
  }
}

resource "kubernetes_secret" "app_config" {
  metadata {
    name      = "app-config"
    namespace = kubernetes_namespace.apps.metadata[0].name
  }
  data = {
    ENV = "dev"
  }
}

