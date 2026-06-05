module "s3_tf_backend" {
  source = "./modules/s3/tf_backend"

  bucket_name = var.backend_bucket_name
  environment = var.environment
}

module "dynamodb_metadata_pipeline" {
  source = "./modules/dynamodb/metadata_pipeline"

  environment = var.environment
  system_name = var.system_name
}