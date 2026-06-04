module "s3_tf_backend" {
  source = "./modules/s3/tf_backend"

  bucket_name = var.backend_bucket_name
  environment = var.environment
}
