provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
  for_each = var.instance_names

  tags = {
    Name = each.key
  }
}

output "ec2_instance_ids" {
  value = [for instance in aws_instance.ec2_instance : instance.id]
}