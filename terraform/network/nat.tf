resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "${var.name}-terra_nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}