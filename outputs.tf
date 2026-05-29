output "bucket_name" {
  value = module.s3.bucket_name
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}

output "iam_username" {
  value = module.iam.iam_username
}

output "access_key_id" {
  value = module.iam.access_key_id
}

output "secret_access_key" {
  value     = module.iam.secret_access_key
  sensitive = true
}