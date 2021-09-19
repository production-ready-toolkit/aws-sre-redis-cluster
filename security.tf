resource "aws_security_group" "main" {
    name      = format("%s", var.name)
    description = var.name
    vpc_id    = var.vpc
    tags      = var.tags
}

resource "aws_security_group_rule" "inbound_cidrs" {
    type              = "ingress"
    from_port         = var.port
    to_port           = var.port
    protocol          = "tcp"

    cidr_blocks       = length(var.cidrs_to_allow) > 0 ? var.cidrs_to_allow : data.aws_vpc.main.cidr_block_associations[*].cidr_block

    security_group_id = aws_security_group.main.id
}

resource "aws_security_group_rule" "inbound_sgs" {
    count                       = length(var.security_groups_to_allow)

    type                        = "ingress"
    from_port                   = var.port
    to_port                     = var.port
    protocol                    = "tcp"
    source_security_group_id    = var.security_groups_to_allow[count.index]

    security_group_id           = aws_security_group.main.id
}

resource "aws_security_group_rule" "outbound_cidrs" {
    type                        = "egress"
    from_port                   = 0
    to_port                     = 0
    protocol                    = "tcp"

    cidr_blocks                 = length(var.cidrs_to_allow) > 0 ? var.cidrs_to_allow : data.aws_vpc.main.cidr_block_associations[*].cidr_block

    security_group_id           = aws_security_group.main.id
}

resource "aws_security_group_rule" "outbound_sgs" {
    count                       = length(var.security_groups_to_allow)

    type                        = "egress"
    from_port                   = 0
    to_port                     = 0
    protocol                    = "tcp"
    source_security_group_id    = var.security_groups_to_allow[count.index]

    security_group_id           = aws_security_group.main.id
}