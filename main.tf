module "s3_tf_backend" {
  source = "./modules/s3/tf_backend"

  bucket_name = var.backend_bucket_name
  environment = var.environment
}

module "dynamodb" {
  source = "./modules/dynamodb"

  dynamodb_table_name = var.dynamodb_table_name
  environment = var.environment
}