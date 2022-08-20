output "vpc_id" {
  value = aws_vpc.terra_vpc.id
}

output "public_1_id" {
  value = aws_subnet.public_1.id
}

output "public_2_id" {
  value = aws_subnet.public_2.id
}

output "private_1_id" {
  value = aws_subnet.private_1.id
}

output "private_2_id" {
  value = aws_subnet.private_2.id
}

output "public_route_table_id" {
  value = aws_route_table.terra_public_route_table.id
}


output "private_route_table_id" {
  value = aws_route_table.terra_private_route_table.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_id" {
  value = aws_nat_gateway.nat.id
}

output "eip_id" {
  value = aws_eip.lb.id
}