###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

### image
variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Образ ВМ"
}

###ssh vars
variable "vms_ssh_root_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}

variable "platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Платформа"
}

variable "boot_disk_config" {
  type    = object({ size = number, type = list(string) })
  default = { size = 5, type = ["network-hdd", "network-ssd"] }
}

variable "vm_configs" {
  type = map(map(number))
  default = {
    "vm_resources_20" = {
      "cores"         = 2
      "memory"        = 1
      "core_fraction" = 20
    }
  }
}

variable "words" {
  type = map(string)
  default = {
    "netology" = "netology"
    "develop"  = "develop"
    "platform" = "platform"
    "web"      = "web"
    "db"       = "db"
    "storage"  = "storage"
  }
}

variable "for_each_vm" {
  type = list(object({ vm_name = string, cpu = number, ram = number, disk = number, core_fraction = number }))
  default = [
    {
      vm_name       = "main",
      cpu           = 4,
      ram           = 4,
      disk          = 10,
      core_fraction = 20
    },
    {
      vm_name       = "replica",
      cpu           = 4,
      ram           = 4,
      disk          = 10,
      core_fraction = 5
    }
  ]
}
variable "disk_vm_1GB" {
  type = object({
    name = string
    size = number
    type = string
  })
  default = {
    name = "disk"
    size = 1
    type = "network-hdd"
  }
}
