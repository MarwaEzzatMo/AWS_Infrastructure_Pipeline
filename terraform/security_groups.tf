resource "aws_security_group" "public" {
  name        = "allow ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "ssh from everywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-terra_public"
  }
}

resource "aws_security_group" "private" {
  name        = "allow ssh and 3000"
  description = "Allow ssh and 3000 inbound traffic"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

    ingress {
    description = "80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-terra_private"
  }
}


resource "aws_security_group" "elastic-cache-sg" {
  name        = "allow 6379"
  description = "Allow 6379 inbound traffic"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "6379 from everywhere"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-elastic-cache-terra_public"
  }
}


resource "aws_security_group" "rds_sg" {
  name        = "allow 3306"
  description = "Allow 3306"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "3306 from vpc"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-rds_sg"
  }
}


resource "aws_security_group" "alb_sg" {
  name        = "alb sg"
  description = "alb sg"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "80 from everywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-alb_sg"
  }
}