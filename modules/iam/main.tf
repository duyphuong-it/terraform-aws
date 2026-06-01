# Tạo IAM user
resource "aws_iam_user" "s3_uploader" {
  name = "${var.environment}-s3-uploader"

  tags = {
    Environment = var.environment
    ManagedBy   = "OpenTofu"
  }
}

# Tạo IAM Policy
resource "aws_iam_policy" "s3_upload_policy" {
  name = "${var.environment}-s3-upload-policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = [
          "arn:aws:s3:::${var.bucket_name}"
        ]
      },

      {
        Effect = "Allow"

        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ]

        Resource = [
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}

# Attach Policy vào User
resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.s3_uploader.name
  policy_arn = aws_iam_policy.s3_upload_policy.arn
}

# IAM Access key
resource "aws_iam_access_key" "this" {
  user = aws_iam_user.s3_uploader.name
}

# Service params store / secrets manager