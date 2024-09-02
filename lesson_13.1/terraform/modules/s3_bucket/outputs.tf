
output "bucket_name" {
  value = yandex_storage_bucket.test.bucket
}

output "cat" {
  value = yandex_storage_object.cat-picture.key
}

output "bucket_domain" {
  value = yandex_storage_bucket.test.bucket_domain_name
}
