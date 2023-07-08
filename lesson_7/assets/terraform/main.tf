terraform {
  required_providers {
    virtualbox = {
      source = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
}

provider "virtualbox" {
  delay      = 60
  mintimeout = 5
}

resource "virtualbox_vm" "vm1" {
  name   = "centos-7.0"
  image = "./centos-7.0-x86_64.box"
  cpus      = 1
  memory    = "512 mib"

  network_adapter {
    type           = "nat"
    device         = "IntelPro1000MTDesktop"
    host_interface = "vboxnet1"
  }
}