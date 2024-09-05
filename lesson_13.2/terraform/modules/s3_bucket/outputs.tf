
output "bucket_name" {
  value = yandex_storage_bucket.test.bucket
}
output "bucket_domain" {
  value = yandex_storage_bucket.test.bucket_domain_name
}
