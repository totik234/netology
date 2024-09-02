module "vpc" {
  source          = "./modules/vpc"
  project_name    = var.project_name
  default_zone    = var.default_zone
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "s3_bucket" {
  source       = "./modules/s3_bucket"
  project_name = var.project_name
  default_zone = var.default_zone
  file_path    = "${path.root}/../assets/img/cat.png"
}

module "compute_group" {
  source             = "./modules/compute_group"
  project_name       = var.project_name
  default_zone       = var.default_zone
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = [module.vpc.private_subnet_id]
  public_subnet_ids  = [module.vpc.public_subnet_id]
  image_id           = var.image_id
  depends_on         = [module.s3_bucket, module.vpc]
  bucket_domain      = module.s3_bucket.bucket_domain
  cat                = module.s3_bucket.cat
}

module "nlb" {
  source       = "./modules/nlb"
  project_name = var.project_name
  default_zone = var.default_zone
  tg_id        = module.compute_group.tg_id
  depends_on   = [module.compute_group]
}
