resource "aws_dynamodb_table" "job_tracking" {
  name           = "${var.environment}-job-tracking"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key  = "job_id"

  attribute {
    name = "job_id"
    type = "S"
  }

  attribute {
    name = "status"
    type = "S"
  }

  global_secondary_index {
    name               = "status-index"
    hash_key           = "status"
    projection_type    = "ALL"
  }

  attribute {
    name = "file_type"
    type = "S"
  }

  global_secondary_index {
    name               = "file_type-index"
    hash_key           = "file_type"
    projection_type    = "ALL"
  }

}

resource "aws_dynamodb_table" "table_definition" {
    name           = "${var.environment}-table-definition-info"
    billing_mode   = "PAY_PER_REQUEST"

    hash_key  = "table_name"
    range_key = "column_name"
    
    attribute {
        name = "table_name"
        type = "S"
    }

    attribute {
        name = "column_name"
        type = "S"
    }
}