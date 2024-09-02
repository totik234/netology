variable "project_name" {
  type = string
}

variable "default_zone" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}

variable "image_id" {
  type = string
}

variable "bucket_domain" {
  type = string
}

variable "cat" {
  type = string
}
