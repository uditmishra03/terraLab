variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  description = "The name tag for the instance"
  type        = string
  default     = "MyInstance"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}