module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
  environment = var.environment
}

module "iam" {
  source = "./modules/iam"

  bucket_name = var.bucket_name
  environment = var.environment
}