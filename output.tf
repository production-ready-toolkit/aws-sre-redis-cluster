output "security_group" {
    value = aws_security_group.main
}

output "parameter_group" {
    value = aws_elasticache_parameter_group.main
}

output "cluster" {
    sensitive = true
    value = aws_elasticache_replication_group.main
}