resource "aws_sqs_queue" "dlq" {
  name = "${var.environment}-ingestion-dlq"
}

resource "aws_sqs_queue" "main" {
  name = "${var.environment}-ingestion-queue"

  visibility_timeout_seconds = 60

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue_policy" "allow_s3" {
  queue_url = aws_sqs_queue.main.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "AllowS3SendMessage"
        Effect = "Allow"

        Principal = {
          Service = "s3.amazonaws.com"
        }

        Action = "sqs:SendMessage"

        Resource = aws_sqs_queue.main.arn

        Condition = {
          ArnEquals = {
            "aws:SourceArn" = var.bucket_arn
          }
        }
      }
    ]
  })
}