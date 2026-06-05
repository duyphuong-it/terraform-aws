output "backend_bucket_name" {
  value = module.s3_tf_backend.bucket_name
}

output "backend_bucket_arn" {
  value = module.s3_tf_backend.bucket_arn
}

output "job_tracking_table_name" {
  value = module.dynamodb_metadata_pipeline.job_tracking_table_name
}

output "table_list_table_name" {
  value = module.dynamodb_metadata_pipeline.table_list_table_name
}

output "table_info_bronze_table_name" {
  value = module.dynamodb_metadata_pipeline.table_info_bronze_table_name
}

output "table_info_silver_table_name" {
  value = module.dynamodb_metadata_pipeline.table_info_silver_table_name
}