# data "yandex_client_config" "client" {}

resource "yandex_vpc_network" "default" {
  name = "${var.project_name}-vpc"
}

resource "yandex_vpc_subnet" "public" {
  name           = "${var.project_name}-subnet-public"
  network_id     = yandex_vpc_network.default.id
  zone           = var.default_zone
  v4_cidr_blocks = var.public_subnets
}

resource "yandex_vpc_subnet" "private" {
  name           = "${var.project_name}-subnet-private"
  network_id     = yandex_vpc_network.default.id
  zone           = var.default_zone
  v4_cidr_blocks = var.private_subnets
  # route_table_id = yandex_vpc_route_table.private.id
}
