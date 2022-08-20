resource "aws_elasticache_subnet_group" "terra-cache-subnet-group" {
  name       = "terra-cache-subnet-group"
  subnet_ids = [module.network.private_1_id, module.network.private_2_id]

  tags = {
    Name = "My Terra DB subnet group"
  }
}


# resource "aws_elasticache_cluster" "elastic_cache_redis" {
#   cluster_id           = "terra-redis-cluster"
#   engine               = "redis"
#   node_type            = "cache.t2.micro"
#   num_cache_nodes      = 1
#   engine_version       = "6.x"
#   port                 = 6379
#   subnet_group_name = aws_elasticache_subnet_group.terra-cache-subnet-group.name
#   security_group_ids = [aws_security_group.elastic-cache-sg.id]
# }


resource "aws_elasticache_replication_group" "elastic_redis_cluster" {
  automatic_failover_enabled  = true
  subnet_group_name = aws_elasticache_subnet_group.terra-cache-subnet-group.name
  replication_group_id        = "tf-rep-group-1"
  description = "elastiCache Redis Cluster"
  node_type                   = "cache.${var.instance_type}"
  num_cache_clusters       = 2
  port                        = 6379
  engine_version       = "6.x"
  security_group_ids = [aws_security_group.elastic-cache-sg.id]
}
