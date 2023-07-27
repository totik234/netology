resource "yandex_compute_disk" "disk_vm_1GB" {

  count = 3

  name = "${var.disk_vm_1GB.name}-${count.index + 1}"
  type = var.disk_vm_1GB.type
  size = var.disk_vm_1GB.size
  zone = var.default_zone
}

#создаем ВМ
resource "yandex_compute_instance" "vm_storage" {
  name        = var.words.storage
  platform_id = var.platform_id

  count = 1
  resources {
    cores         = var.vm_configs.vm_resources_20.cores
    memory        = var.vm_configs.vm_resources_20.memory
    core_fraction = var.vm_configs.vm_resources_20.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.boot_disk_config.type[0]
      size     = var.boot_disk_config.size
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk_vm_1GB.*.id
    content {
      disk_id = secondary_disk.value
    }
  }
  metadata = local.vm_metadata

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}
