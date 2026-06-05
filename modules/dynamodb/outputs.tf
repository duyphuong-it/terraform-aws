output "job_tracking_table" {
    value = aws_dynamodb_table.job_tracking.name
}

output "table_definition_table" {
    value = aws_dynamodb_table.table_definition.name
}