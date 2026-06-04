resource "aws_s3_bucket_notification" "this" {
  bucket = var.bucket_name

  queue {
    queue_arn = var.queue_arn
    events    = ["s3:ObjectCreated:*"]
  }
}
