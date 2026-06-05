data "archive_file" "lambda_zip" {
  type = "zip"

  source_dir = "${path.module}/lambda_src"

  output_path = "${path.module}/build/lambda.zip"
}