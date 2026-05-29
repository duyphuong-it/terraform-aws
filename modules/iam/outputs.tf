output "iam_username" {
  value = aws_iam_user.s3_uploader.name
}

output "access_key_id" {
  value = aws_iam_access_key.this.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.this.secret
  sensitive = true
}