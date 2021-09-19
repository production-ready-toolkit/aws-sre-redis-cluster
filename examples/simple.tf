module "compliance_redis" {
    source = "github.com/msfidelis/aws-sre-redis-cluster"

    name        = "app-x-redis"
    node_type   = "cache.t2.micro"

    vpc         = "vpc-ba8b92c1"

    shards              = 2
    replicas_per_shard  = 3

    subnets     = [
        "subnet-1198752f",
        "subnet-c832eeaf",
        "subnet-f634adf9"
    ]

    tags        = {
        "environment" = "production"
    }
}