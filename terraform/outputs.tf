#outputs from network module

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_1_id" {
  value = module.network.public_1_id
}

output "public_2_id" {
  value = module.network.public_2_id
}

output "private_1_id" {
  value = module.network.private_1_id
}

output "private_2_id" {
  value = module.network.private_2_id
}

output "public_route_table_id" {
  value = module.network.public_route_table_id
}


output "private_route_table_id" {
  value = module.network.private_route_table_id
}

output "igw_id" {
  value = module.network.igw_id
}

output "nat_id" {
  value = module.network.nat_id
}

output "eip_id" {
  value = module.network.eip_id
}

#outputs from root module

output "public_vpc_security_group_ids" {
  value = aws_security_group.public.id
}


output "private_vpc_security_group_ids" {
  value = aws_security_group.private.id
}

# output "key_pair_name" {
#   value = aws_key_pair.public_key_pair.key_name
# }

output "instance_public" {
  value = aws_instance.bastion.public_ip
}


output "instance_private" {
  value = aws_instance.application.private_ip
}


output "rds_endpoint" {
  value = aws_db_instance.terra-rds.address
}


# output "rds_username" {
#   value = aws_db_instance.terra-rds.username
# }


# output "rds_password" {
#   value = aws_db_instance.terra-rds.password
#   sensitive = true
# }


output "rds_port" {
  value = aws_db_instance.terra-rds.port
}


output "redis_port" {
  value = aws_elasticache_replication_group.elastic_redis_cluster.port
}


output "redis_cluster_endpoint" {
  value = aws_elasticache_replication_group.elastic_redis_cluster.primary_endpoint_address
}