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

module "sqs" {
  source = "./modules/sqs"

  environment = var.environment
  bucket_arn  = module.s3.bucket_arn
}

module "lambda" {
  source = "./modules/lambda"

  environment = var.environment

  queue_arn = module.sqs.queue_arn
  queue_url = module.sqs.queue_url
}

module "notifications" {
  source = "./modules/notifications"

  bucket_name = module.s3.bucket_name
  queue_arn   = module.sqs.queue_arn

  depends_on = [
    module.sqs
  ]
}