provider "aws" {
  region = "us-east-1"
}

resource "random_id" "suffix" {
  byte_length = 4
  
}


resource "aws_kms_key" "s3_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}


resource "aws_s3_bucket" "s3_bkt_with_version_encryption" {
    bucket = "my-tf-test-bucket-${random_id.suffix.hex}"

}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bkt_sse" {
  bucket = aws_s3_bucket.s3_bkt_with_version_encryption.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}


output "s3_bucket_arn" {
  description = "value of the ARN of the S3 bucket created with versioning and encryption"
  value = aws_s3_bucket.s3_bkt_with_version_encryption.arn

}