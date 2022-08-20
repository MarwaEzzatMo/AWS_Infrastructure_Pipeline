resource "aws_route_table" "terra_public_route_table" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "${var.name}-terra_public_route_table"
  }
}


resource "aws_route" "public" {
  route_table_id            = aws_route_table.terra_public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  depends_on                = [aws_route_table.terra_public_route_table]
}


resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.terra_public_route_table.id
}


resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.terra_public_route_table.id
}