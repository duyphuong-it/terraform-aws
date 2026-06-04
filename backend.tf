terraform {
  backend "s3" {
    bucket       = var.backend_bucket_name
    key          = var.main_state_file_key
    region       = var.aws_region
    encrypt      = true
    use_lockfile = true
  }
}