
resource "aws_elasticache_replication_group" "main" {
    replication_group_id            = var.name
    replication_group_description   = var.name
    node_type                       = var.node_type
    engine                          = "redis"
    engine_version                  = var.redis_version

    port                            = var.port
    parameter_group_name            = aws_elasticache_parameter_group.main.name

    automatic_failover_enabled      = var.automatic_failover_enabled

    subnet_group_name               = aws_elasticache_subnet_group.main.id

    transit_encryption_enabled      = true
    multi_az_enabled                = var.multi_az

    at_rest_encryption_enabled      = true
    kms_key_id                      = var.kms_key != "" ? var.kms_key : aws_kms_key.main.arn

    auth_token                      = var.auth_token

    cluster_mode {
        replicas_per_node_group = var.replicas_per_shard
        num_node_groups         = var.shards
    }

    tags = var.tags
}