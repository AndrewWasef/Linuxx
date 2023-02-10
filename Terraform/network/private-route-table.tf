resource "aws_route_table" "private-route-tb" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-route-tb"
  }
}

resource "aws_route" "private-route" {
  route_table_id         = aws_route_table.private-route-tb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw1.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-route-tb.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-route-tb.id
}