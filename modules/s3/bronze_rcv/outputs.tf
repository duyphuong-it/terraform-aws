output "bucket_name" {
  value = aws_s3_bucket.bronze_rcv.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.bronze_rcv.arn
}

output "bucket_id" {
  value = aws_s3_bucket.bronze_rcv.id
}