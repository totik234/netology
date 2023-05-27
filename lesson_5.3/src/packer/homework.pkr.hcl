source "yandex" "image_1" {
  disk_type           = "network-ssd"
  folder_id           = ${var.folder_id}
  image_description   = "my custom ubuntu-20.04"
  image_family        = "ubuntu-2004-lts"
  image_name          = "ubuntu-2004-homework"
  source_image_family = "ubuntu-2004-lts"
  ssh_username        = "ubuntu"
  subnet_id           = ${var.subnet_id}
  token               = ${var.token}
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.image_1"]

  provisioner "shell" {
    inline = ["echo 'updating APT'", "sudo apt-get update -y"]
  }

}
