output "backend_bucket_name" {
  value = module.s3_tf_backend.bucket_name
}
output "backend_bucket_arn" {
  value = module.s3_tf_backend.bucket_arn
}

output "bronze_bucket_name" {
  value = module.s3_bronze_rcv.bucket_name
}
output "bronze_bucket_arn" {
  value = module.s3_bronze_rcv.bucket_arn
}