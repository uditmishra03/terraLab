variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-02dfbd4ff395f2a1b" # Default to a common Amazon Linux 2 AMI in us-east-1
  
}