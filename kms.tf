resource "aws_kms_key" "main" {
    description                 = var.name
    key_usage                   = "ENCRYPT_DECRYPT"
    customer_master_key_spec    = "SYMMETRIC_DEFAULT"

    tags                        = var.tags
    enable_key_rotation         = true
}