resource "aws_route_table" "public-route-tb" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-route-tb"
  }
}

resource "aws_route" "publice-route" {
  route_table_id         = aws_route_table.public-route-tb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-route-tb.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-route-tb.id
}