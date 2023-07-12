locals {
  vm_web_instance_name = "${var.words.netology}-${var.words.develop}-${var.words.platform}-${var.words.web}"
  vm_db_instance_name = "${var.words.netology}-${var.words.develop}-${var.words.platform}-${var.words.db}"
  vm_metadata={
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}