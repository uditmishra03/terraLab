provider "aws" {
    region = var.region
  
}

resource "aws_vpc" "dev-main-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dev-main-vpc"
  }
}

resource "aws_subnet" "dev-public-subnet" {
  vpc_id     = aws_vpc.dev-main-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dev-public-subnet"
  }
}

resource "aws_subnet" "dev-private-subnet" {
  vpc_id     = aws_vpc.dev-main-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "dev-private-subnet"
  }
}

resource "aws_internet_gateway" "dev-main-igw" {
  vpc_id = aws_vpc.dev-main-vpc.id

  tags = {
    Name = "dev-main-igw"
  }
}

resource "aws_route_table" "dev-main-rt" {
  vpc_id = aws_vpc.dev-main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-main-igw.id
  }
}

resource "aws_route_table_association" "dev-public-subnet" {
  subnet_id      = aws_subnet.dev-public-subnet.id
  route_table_id = aws_route_table.dev-main-rt.id
}



resource "aws_eip" "dev-main-eip" {
  domain = "vpc"

  tags = {
    Name = "dev-main-eip"
  }
}

# resource "aws_nat_gateway" "dev-main-nat" {
#   allocation_id = aws_eip.dev-main-eip.id
#   subnet_id    = aws_subnet.dev-private-subnet.id

#   tags = {
#     Name = "dev-main-nat"
#   }
# }

resource "aws_route_table" "dev-private-rt" {
  vpc_id = aws_vpc.dev-main-vpc.id
  # No default route to internet or NAT gateway for private subnet
}

resource "aws_route_table_association" "dev-private-subnet" {
  subnet_id      = aws_subnet.dev-private-subnet.id
  route_table_id = aws_route_table.dev-private-rt.id
}