# Define the backend for storing Terraform state
terraform {
  backend "s3" {
    bucket         = "chichao-s3" # Replace with an actual S3 bucket name
    key            = "terraform/state/dynamodb-table.tfstate"
    region         = "ap-southeast-1" # Replace with your bucket's region
    dynamodb_table = "terraform-lock-table"
  }
}