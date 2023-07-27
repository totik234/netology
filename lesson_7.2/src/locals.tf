locals {
  
  vm_metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
  vm_web_instance_name = "${var.words.netology}-${var.words.develop}-${var.words.platform}-${var.words.web}"
}
