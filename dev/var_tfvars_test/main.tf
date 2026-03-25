provider "aws" {
  region = var.region
}

resource "random_id" "generate_hex" {
  byte_length = 4
  
}

locals  {
     instance_name = "tf-instance-${random_id.generate_hex.hex}"
}

# output "test_local_instance_name" {
#   description = "The name of the EC2 instance created using local variable"
#   value       = local.instance_name
  
# }

resource "aws_instance" "var_test_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  tags = {
        Name = local.instance_name
  }
}
