output "userdata" {
  value = "\n${data.template_file.cloudinit.rendered}"
}
output "vm" {
  value = module.test-vm.external_ip_address
}