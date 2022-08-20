resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.public_1_cidr

  tags = {
    Name = "${var.name}-Public_1"
  }
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.public_2_cidr

  tags = {
    Name = "${var.name}-Public_2"
  }
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true
}


resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.private_1_cidr

  tags = {
    Name = "${var.name}-Private_1"
  }
  availability_zone = "${var.region}a"
}


resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.private_2_cidr

  tags = {
    Name = "${var.name}-Private_2"
  }
  availability_zone = "${var.region}b"
}