provider "aws" {
    region = "us-east-1"
  
}

module "ec2_instance" {
  source = "./modules/ec2"

  ami_id        = "ami-02dfbd4ff395f2a1b" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type  = "t2.micro"
  name           = "dev-ec2-instance"
  instance_count = 3
  
}