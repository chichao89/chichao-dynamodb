# Create a DynamoDB table
resource "aws_dynamodb_table" "basic_table" {
  name           = "chichao-table"
  billing_mode   = "PAY_PER_REQUEST" # No provisioned capacity required
  hash_key       = "ISBN"
  range_key      = "genre" 

  # Define the attributes
  attribute {
    name = "ISBN"
    type = "S" # String type
  }

  attribute {
    name = "genre"
    type = "S" # String type

  }

  tags = {
    Environment = "Dev"
    Name        = "ExampleDynamoDBTable"
  }
}

# DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "state_lock_table" {
  name           = "terraform-lock-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  # Define the attributes
  attribute {
    name = "LockID"
    type = "S" # String type
  }

  tags = {
    Environment = "Terraform"
    Purpose     = "State Locking"
  }
}