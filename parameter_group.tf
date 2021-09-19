resource "aws_elasticache_parameter_group" "main" {
    name      = var.name
    family    = var.family

    parameter {
        name  = "cluster-enabled"
        value = var.cluster_mode ? "yes" : "no"
    }

    tags      = var.tags
}