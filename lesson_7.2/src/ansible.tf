resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    { webservers = yandex_compute_instance.count_vm,
      databases  = yandex_compute_instance.main_and_replica,
      storage    = yandex_compute_instance.vm_storage
    })

  filename = "${abspath(path.module)}/hosts.cfg"
}

# resource "local_file" "hosts_conf" {
#   content = templatefile("${path.module}/ansible.tftpl",
#     { web = yandex_compute_instance.web ,
#       databases = yandex_compute_instance.databases,
#       storage = yandex_compute_instance.storage  })

#   filename = "${abspath(path.module)}/hosts"
# }

output "output_storage" {
  value = yandex_compute_instance.vm_storage
}
output "output_databases" {
  value = yandex_compute_instance.main_and_replica
}