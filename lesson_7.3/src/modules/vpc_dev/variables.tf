variable "env_name" {
  type        = string
  description = "VPC network&subnet name"
}
variable "zone" {
  type        = string
}
variable "cidr" {
  type        = list(string)
}
