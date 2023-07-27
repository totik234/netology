resource "yandex_compute_instance" "main_and_replica" {
  depends_on = [yandex_compute_instance.count_vm]
  for_each =toset(["0","1"])

  name        = var.for_each_vm[each.key].vm_name
  platform_id = var.platform_id

  resources {
    cores         = var.for_each_vm[each.key].cpu
    memory        = var.for_each_vm[each.key].ram
    core_fraction = var.for_each_vm[each.key].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.boot_disk_config.type[0]
      size     = var.for_each_vm[each.key].disk
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
