module "s3_tf_backend" {
  source = "./modules/s3/tf_backend"

  bucket_name = var.backend_bucket_name
  environment = var.environment
}

module "s3_bronze_rcv" {
  source = "./modules/s3/bronze_rcv"

  bucket_name = var.bronze_bucket_name
  environment = var.environment
}

module "lambda_trigger" {
  source = "./modules/lambda/lambda_trigger"

  environment       = var.environment
  bronze_bucket_arn = module.s3_bronze_rcv.bucket_arn
}

module "s3_bronze_event_lambda_notification" {
  source = "./modules/s3/bronze_rcv/notifications"

  lambda_arn       = module.lambda_trigger.lambda_arn
  bronze_bucket_id = module.s3_bronze_rcv.bucket_id

  depends_on = [module.s3_bronze_rcv, module.lambda_trigger]
}