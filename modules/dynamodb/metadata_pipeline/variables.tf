variable "environment" {
  description = "The environment for the DynamoDB metadata pipeline (e.g., dev, staging, prod)"
  type        = string
}

variable "system_name" {
  description = "The name of the system for the DynamoDB metadata pipeline"
  type        = string
}