resource "aws_route_table" "terra_private_route_table" {
  vpc_id = aws_vpc.terra_vpc.id

  tags = {
    Name = "${var.name}-terra_private_route_table"
  }
}


resource "aws_route" "private" {
  route_table_id            = aws_route_table.terra_private_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
  depends_on                = [aws_route_table.terra_private_route_table]
}


resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.terra_private_route_table.id
}


resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.terra_private_route_table.id
}