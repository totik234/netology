output "vpc_id" {
  value = yandex_vpc_network.default.id
}
output "public_subnet_id" {
  value = yandex_vpc_subnet.public.id
}
output "private_subnet_id" {
  value = yandex_vpc_subnet.private.id
}
