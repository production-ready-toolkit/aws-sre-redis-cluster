variable "name" {
    type        = string
    description = "The replication group identifier. This parameter is stored as a lowercase string"
}

variable "node_type" {
    type        = string
    description = "The instance class to be used. See AWS documentation for information on supported node types"
}

variable "redis_version" {
    description = "Redis release version. See AWS documentation for information"
    type        = string
    default     = "6.x"
}

variable "family" {
    description = "Redis release parameter group version. See AWS documentation for information"
    type    = string
    default = "redis6.x"
}

variable "multi_az" {
    description = "Enable multi-az replication"
    type    = bool
    default = true
}

variable "auth_token" {
    type    = string 
    default = null
}

variable "vpc" {
    description = "VPC ID"
    type        = string
}

variable "subnets" {
    description = "List with subnet ID's to create a subnet group"
    type        = list
}

variable "cluster_mode" {
    description = "Create a native Redis cluster"
    type        = bool
    default     = true
}

variable "shards" {
    description = "Number of node groups (shards) for this Redis"
    type        = number
    default     = 1
}

variable "replicas_per_shard" {
    description = "Number of replica nodes in each node group. Valid values are 0 to 5"
    type        = number
    default     = 2
}

variable "port" {
    description = "The port number on which each of the cache nodes will accept connections."
    type        = number
    default     = 6379
}

variable "kms_key" {
    description = "The ARN of the key that you wish to use if encrypting at rest"
    type        = string
    default     = ""
}

variable "automatic_failover_enabled" {
    description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails"
    type        = bool
    default     = true
}

variable "cidrs_to_allow" {
    description = "A list with CIDR's to enable on ingress and egress"
    type        = list
    default     = []
}

variable "security_groups_to_allow" {
    description = "A list with security group ID's to enable on ingress and egress"
    type        = list
    default     = []
}

variable "tags" {
    type    = map(any)
    default = {}
}