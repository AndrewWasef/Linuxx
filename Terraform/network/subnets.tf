resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-subnet1_CIDR_block
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1a"
  tags = {
    Name = "Public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-subnet2_CIDR_block
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1b"
  tags = {
    Name = "Public2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-subnet1_CIDR_block
  availability_zone = "eu-central-1a"
  tags = {
    Name = "Private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-subnet2_CIDR_block
  availability_zone = "eu-central-1b"
  tags = {
    Name = "Private2"
  }
}