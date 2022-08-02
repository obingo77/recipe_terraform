resource "aws_kms_key" "eks" {
  description             = "EKS KMS key"
  deletion_window_in_days = 1
  enable_key_rotation     = true
  is_enabled              = true

}
