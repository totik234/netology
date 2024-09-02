resource "yandex_lb_network_load_balancer" "foo" {
  name = "${var.project_name}-nlb"

  listener {
    name = "${var.project_name}-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = var.tg_id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
