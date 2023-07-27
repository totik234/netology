#создаем 2 идентичные ВМ
resource "yandex_compute_instance" "count_vm" {
  name        = "${local.vm_web_instance_name}-${count.index + 1}"
  platform_id = var.platform_id
  
  count = 2

  resources {
    cores  = var.vm_configs.vm_resources_20.cores
    memory = var.vm_configs.vm_resources_20.memory
    core_fraction = var.vm_configs.vm_resources_20.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = var.boot_disk_config.type[0]
      size = var.boot_disk_config.size
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