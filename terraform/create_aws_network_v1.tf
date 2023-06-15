  provider "aws" {
    region     = "us-east-1"
  }

resource "aws_vpc" "main" {
  cidr_block = "10.0.10.0/24"
  tags = {
    Name = "Application Testing"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Subnet 1"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "main"
  }
}

resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.subnet1.id
  allocation_id = aws_eip.nat.id
}

resource "aws_eip" "nat" {
    domain = "vpc"
}

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id
  subnet_ids = [aws_subnet.subnet1.id]

  ingress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/24"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
  }

  egress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/24"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
  }

  tags = {
    Name = "main"
  }
}

resource "aws_security_group" "main" {
  name   = "main"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "main"
  }
}
