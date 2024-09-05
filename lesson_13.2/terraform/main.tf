module "s3_bucket" {
  source       = "./modules/s3_bucket"
  project_name = var.project_name
  default_zone = var.default_zone
  file_path    = "${path.root}/../assets/img/cat.png"
}
