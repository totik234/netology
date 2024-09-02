output "tg_id" {
  value = yandex_compute_instance_group.ig.load_balancer[0].target_group_id
}
