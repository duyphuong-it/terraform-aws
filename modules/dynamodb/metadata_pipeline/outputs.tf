output "job_tracking_table_name" {
  value = aws_dynamodb_table.job_tracking.name
}

output "job_tracking_table_arn" {
    value = aws_dynamodb_table.job_tracking.arn
}

output "table_list_table_name" {
  value = aws_dynamodb_table.table_list.name
}

output "table_list_table_arn" {
  value = aws_dynamodb_table.table_list.arn
}

output "table_info_bronze_table_name" {
  value = aws_dynamodb_table.table_info_bronze.name
}

output "table_info_bronze_table_arn" {
  value = aws_dynamodb_table.table_info_bronze.arn
}

output "table_info_silver_table_name" {
  value = aws_dynamodb_table.table_info_silver.name
}

output "table_info_silver_table_arn" {
  value = aws_dynamodb_table.table_info_silver.arn
}