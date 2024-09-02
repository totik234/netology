data "yandex_client_config" "client" {}

resource "yandex_iam_service_account" "sa-ig" {
  name = "${var.project_name}-sa-ig"
}

resource "yandex_resourcemanager_folder_iam_member" "ig-admin" {
  folder_id = data.yandex_client_config.client.folder_id
  role      = "admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa-ig.id}"
}

resource "yandex_compute_instance_group" "ig" {
  name               = "${var.project_name}-ig"
  folder_id          = data.yandex_client_config.client.folder_id
  service_account_id = yandex_iam_service_account.sa-ig.id

  instance_template {
    service_account_id = yandex_iam_service_account.sa-ig.id

    boot_disk {
      initialize_params {
        image_id = var.image_id
        size     = 20
      }
    }


    resources {
      cores  = 2
      memory = 2
    }

    network_interface {
      network_id = var.vpc_id
      subnet_ids = var.public_subnet_ids
      nat        = true
    }

    metadata = {
      ssh-keys  = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
      user-data = <<EOF
#!/bin/bash
  echo '<html><img src="http://${var.bucket_domain}/${var.cat}"   alt="Picture with cat"
  width="800"
  height="auto"/></html>' > /var/www/html/index.html
EOF
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  deploy_policy {
    max_expansion   = 2
    max_unavailable = 2
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  health_check {
    http_options {
      port = 80
      path = "/"
    }
  }

  load_balancer {
    target_group_name = "${var.project_name}-tg-group"
  }

}
