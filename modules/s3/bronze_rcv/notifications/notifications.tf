resource "aws_s3_bucket_notification" "this" {

  bucket = var.bronze_bucket_id

  lambda_function {

    lambda_function_arn = var.lambda_arn

    events = [
      "s3:ObjectCreated:*"
    ]
  }
}