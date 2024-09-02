resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = false
  numeric = true
  special = false
}
locals {
  postfix = random_string.unique_id.result
}
