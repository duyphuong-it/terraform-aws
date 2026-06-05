locals {
    name_prefix = "${var.environment}-${var.system_name}"
}

resource "aws_dynamodb_table" "job_tracking" {
    name           = "${local.name_prefix}-job-tracking"
    billing_mode   = "PAY_PER_REQUEST"

    hash_key  = "job_id"
    
    attribute {
        name = "job_id"
        type = "S"
    }

    attribute {
        name = "table_name"
        type = "S"
    }

    attribute {
        name = "start_time"
        type = "S"
    }

    global_secondary_index {
        name               = "table_name_start_time-index"
        hash_key           = "table_name"
        range_key          = "start_time"
        projection_type    = "ALL"
    }

    point_in_time_recovery {
        enabled = true
    }

    server_side_encryption {
        enabled = true
    }

    tags = {
        Name = "${local.name_prefix}-job-tracking"
        System     = var.system_name
        Environment = var.environment
        MangagedBy   = "OpenTofu"
        Purpose      = "Pipeline jobs execution tracking" 
    }
}

resource "aws_dynamodb_table" "table_list" {
    name           = "${local.name_prefix}-table-list"
    billing_mode   = "PAY_PER_REQUEST"

    hash_key  = "table_name"
    
    attribute {
        name = "table_name"
        type = "S"
    }

    point_in_time_recovery {
        enabled = true
    }

    server_side_encryption {
        enabled = true
    }

    tags = {
        Name = "${local.name_prefix}-table-list"
        System     = var.system_name
        Environment = var.environment
        MangagedBy   = "OpenTofu"
        Purpose      = "Pipeline metadata storage" 
    }
}

resource "aws_dynamodb_table" "table_info_bronze" {
    name           = "${local.name_prefix}-table-info-bronze"
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

    point_in_time_recovery {
        enabled = true
    }

    server_side_encryption {
        enabled = true
    }

    tags = {
        Name = "${local.name_prefix}-table-info-bronze"
        System     = var.system_name
        Environment = var.environment
        MangagedBy   = "OpenTofu"
        Purpose      = "Bronze layer column metadata" 
    }
}

resource "aws_dynamodb_table" "table_info_silver" {
    name           = "${local.name_prefix}-table-info-silver"
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

    point_in_time_recovery {
        enabled = true
    }

    server_side_encryption {
        enabled = true
    }

    tags = {
        Name = "${local.name_prefix}-table-info-silver"
        System     = var.system_name
        Environment = var.environment
        MangagedBy   = "OpenTofu"
        Purpose      = "Silver layer column metadata" 
    }
}