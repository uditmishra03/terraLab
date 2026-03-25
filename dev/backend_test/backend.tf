terraform {
    backend "s3" {
        path = "terraform.tfstate"
        bucket = "terralab-terraform-state"
        region = "us-east-1"
        key = "dev/backend_test/terraform.tfstate"
        encrypt = true
        dynamodb_table = "values-lock-table"
    }
}