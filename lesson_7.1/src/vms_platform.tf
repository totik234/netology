### image

variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Образ ВМ"
}


variable "words" {
  type = map(string)
  default = {
    "netology" = "netology"
    "develop"  = "develop"
    "platform" = "platform"
    "web"      = "web"
    "db"       = "db"
  }
}

variable "vm_configs" {
  type = map(map(number))
  default = {
    "vm_web_resources" = {
      "cores"         = 2
      "memory"        = 2
      "core_fraction" = 5
    }
    "vm_db_resources" = {
      "cores"         = 2
      "memory"        = 2
      "core_fraction" = 20
    }
  }
}


### vm_web


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Платформа"
}


### vm_db

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Платформа"
}
