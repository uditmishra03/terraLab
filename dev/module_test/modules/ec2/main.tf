resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count = var.instance_count

  tags = {
    Name = "${var.name}-${count.index}"
  }
}