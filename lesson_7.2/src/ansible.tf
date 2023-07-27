resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    { webservers = yandex_compute_instance.count_vm,
      databases  = yandex_compute_instance.main_and_replica,
      storage    = yandex_compute_instance.vm_storage
    })

  filename = "${abspath(path.module)}/hosts.cfg"
}

output "output_storage" {
  value = yandex_compute_instance.vm_storage
}
output "output_databases" {
  value = yandex_compute_instance.main_and_replica
}