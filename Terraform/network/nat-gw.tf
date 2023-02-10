resource "aws_eip" "nat_eip" {
}

resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "gw NAT"
  }


  depends_on = [aws_internet_gateway.igw]
}