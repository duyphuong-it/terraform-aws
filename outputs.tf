output "backend_bucket_name" {
  value = module.s3_tf_backend.bucket_name
}

output "backend_bucket_arn" {
  value = module.s3_tf_backend.bucket_arn
}