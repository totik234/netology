resource "yandex_compute_instance" "main_and_replica" {
  depends_on = [yandex_compute_instance.count_vm]

  for_each = {for vm in var.for_each_vm: vm.vm_name => vm}

  name        = each.value.vm_name
  platform_id = var.platform_id

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.boot_disk_config.type[0]
      size     = each.value.disk
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
