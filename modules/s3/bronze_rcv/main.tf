resource "aws_s3_bucket" "bronze_rcv" {
  bucket = var.bucket_name

  tags = {
    Name        = "Bronze RCV Bucket"
    Environment = var.environment
    ManagedBy   = "OpenTofu"
  }
}

resource "aws_s3_bucket_versioning" "bronze_rcv" {
  bucket = aws_s3_bucket.bronze_rcv.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bronze_rcv" {
  bucket = aws_s3_bucket.bronze_rcv.id

  rule {
    id     = "DELETE Object 1 days after created"
    status = "Enabled"

    filter {
      prefix = "data/"
    }

    expiration {
      days = 1
    }

    noncurrent_version_expiration {
      noncurrent_days = 2
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bronze_rcv" {
  bucket = aws_s3_bucket.bronze_rcv.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "bronze_rcv" {
  bucket = aws_s3_bucket.bronze_rcv.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}