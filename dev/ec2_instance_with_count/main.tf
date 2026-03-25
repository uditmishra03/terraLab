provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2_instance" {
  count         = var.instance_count
  ami           = "ami-02dfbd4ff395f2a1b" # Amazon Linux 2 AMI in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "dev-ec2-${count.index + 1}"
  }
  
}

resource "aws_instance" "outside_tf" {
  ami           = "ami-02dfbd4ff395f2a1b" # Amazon Linux 2 AMI in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "dev-outside-ec2"
  }
}