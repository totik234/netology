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

###common vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "your_ssh_ed25519_key"
  description = "ssh-keygen -t ed25519"
}

###example vm_web var
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "example vm_web_ prefix"
}

###example vm_db var
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "example vm_db_ prefix"
}

variable "ssh_public_keys" {
  type        = list(string)
  description = ""
  default = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPXmhw8Z72tEeCJ7M/q1Yr8NUflzwcdehG4qBPvModvk+PXxUpo60A+v5zswg8cMk8jThbDcOL9dwMeQBS23ArbiuteFaHN2q4yTbLn3LtLkwFaHzI3BRq4wKmmirCm32Z9P9xe0ZagQp97M2RuKmaMnHIMCxzwpPSYn1hTbxrncXYV1K9IqUv6SqSas2vFuRoIhOuJkzeeY2Ypno7grImPYFzk2Jt7vbZp3iS7DjfrEcWd1KkSl8nhoWnffJtH3m00JhYt9xPeCszbMafXWgNdZunCkGCwnAAzFxzZP91gZnwneVFgp0CK8qG8MkROR6o3+6cbW2NrEzj4YIVgrM0AFawSwFDEr+CiEdKHlNH5hI574b/UUJMHVL1A9wKpUYnQV0YoWdteDi2mwGYMkAYkDC3DjHg+0Swab9NU/D+AUDqngfZxkJdJn6CHIn9kOSQAuoLFJFqozFMPOzNCXhJS255a5as5Zr/WsmTB4TLMNPhV4LMmpKS00zdF0kmoyU= udjin@yoga7",
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtPnfjgdy85DXfFCEQBTA9syvs906biuj9kkVL2mjm1E+MEz1HGF/6FMNdeeWyFc3ks2qyXVSl1lVuV54fcUbo88UyQUvoj9p5U1+Y3vV+Ed7z3XN7IkHzHmJjfDaEySBT0upGQTQ2VkTJUxqEqsbJN2oAxDEPd+ltF0ecDDPrWfsnmQPTBeiaE+XUKqPg3wR8Lu8Iy20/9pf6+qjHwvFUWmneRLT6xJghpru8P/MYILo3cq3uvcWb7umHwh9aMBz6D/KNgLifTz0abSb/JrHkPjLhCec4z35qxDe9Ocsubtd4J/X3fRsh7qNYJwLsGoEmvixZCPJ3tDn8g0j7Z2tONQXkRTCRgEP4hI3z6+5MtRWQZ6E+MuhOASpAom7Ql3tFvYWsNAp/KyvXydSob3bHBe3UjnbXCIl+T9z9+GgHfEsyw+B3wuy5LknOjBu5lhn3dREIyJYcVJORwOMFAKm8mRd6ceiRjlykGrppLj26yq+y4IzZJFUEpbRvJ0b/HVE=",
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDI5CA/GU+lkF0L7SP1kQud/R9e0BiEDyt+SbIRjfuIrV8f3MLft446LZOavCstVKD6Xlgxg3D6YxcEH+w8fX3iGS9fRE5koUmpbvquJ+LFnoooIBOc/BorisNJzlY82sWD1l4b2hO9q675aFNmqGIjY9ai35eosX+ciCfHMV7wFItDfA4ygJycNkNUFC8VyM78vwJQ/xoY+B13NiU/oBxB1pd17iFifpUllt4FA6nBlQZU85jE8itmf1slr0z4coRnRsBrEa5Vi+Md2GNzUsqaoVJQmDyw3wb25ITPK3zM+2IG/c8vHfJApI79nLg44ZWK7cvX1vFpQVoOaua1IspYXdPFrH6u97qfrarppfBdvp2zu474d93u4hFSvE4CFygi/tjT4ikwaPE3/3AloV3RCMGbGQ1gX4zfRlvBMmsdfOsUEqbaOIFH7RSl32HARX64oNUbyHhipV+qdXjOhwJQVBxMPlTOLXURYFsokG25jmy7aQIbFp0cTdcFLiax4jk="
  ]
}
variable "packages_vm" {
  type = list(string)
  description = ""
  default = [ "nginx", "vim" ]
}

