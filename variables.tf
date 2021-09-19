variable "name" {
    type        = string
    description = "The replication group identifier. This parameter is stored as a lowercase string"
}

variable "node_type" {
    type        = string
    description = "The instance class to be used. See AWS documentation for information on supported node types"
}

variable "redis_version" {
    type    = string
    default = "6.x"
}

variable "family" {
    type    = string
    default = "redis6.x"
}

variable "multi_az" {
    type    = bool
    default = true
}

variable "auth_token" {
    type    = string 
    default = null
}

variable "vpc" {
    type    = string
}

variable "subnets" {
    type    = list
}

variable "cluster_mode" {
    type    = bool
    default = true
}

variable "shards" {
    type    = number
    default = 1
}

variable "replicas_per_shard" {
    type    = number
    default = 2
}

variable "port" {
    type    = number
    default = 6379
}

variable "kms_key" {
    type    = string
    default = ""
}

variable "automatic_failover_enabled" {
    type    = bool
    default = true
}

variable "cidrs_to_allow" {
    type    = list
    default = []
}

variable "security_groups_to_allow" {
    type    = list
    default = []
}

variable "tags" {
    type    = map(any)
    default = {}
}