variable "region" {
    description = "The AWS region to create resources in."
    type        = string
    default     = "us-east-1"
}

variable "instance_count" {
    description = "The number of EC2 instances to create."
    type        = number
    default     = 3
  
}