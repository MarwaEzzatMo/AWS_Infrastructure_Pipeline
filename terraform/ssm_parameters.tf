resource "aws_ssm_parameter" "rds_endpoint" {
  name        = "/${var.name}/database/endpoint"
  description = "rds endpoint"
  type        = "SecureString"
  value       = aws_db_instance.terra-rds.address

  tags = {
    environment = "${var.name}"
  }
}


resource "aws_ssm_parameter" "redis_endpoint" {
  name        = "/${var.name}/redis/endpoint"
  description = "redis endpoint"
  type        = "SecureString"
  value       = aws_elasticache_replication_group.elastic_redis_cluster.primary_endpoint_address

  tags = {
    environment = "${var.name}"
  }
}

