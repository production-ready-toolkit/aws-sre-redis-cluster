resource "aws_elasticache_subnet_group" "main" {
    name       = format("%s", var.name)
    subnet_ids = var.subnets
    tags       = var.tags
}