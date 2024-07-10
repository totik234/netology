terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.123.0"
    }
  }
}

provider "yandex" {
  zone = var.default_zone
}
