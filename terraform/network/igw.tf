resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terra_vpc.id

  tags = {
    Name = "${var.name}-terra_igw"
  }
}