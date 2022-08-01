data "aws_availability_zones" "available" {
  state  = "available"
  #names   = "opt-in-status"
  #values = [opt-in-not-required]

}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "3.7.0"
  name                 = var.project_name
  cidr                 = var.cidr_block
  azs                  = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets      = local.private_subnets
  public_subnets       = local.public_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = false
  enable_dns_hostnames = true
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}
locals {
  private_subnets = [
    cidrsubnet(var.cidr_block, 8, 1),
    cidrsubnet(var.cidr_block, 8, 2),
    cidrsubnet(var.cidr_block, 8, 3)
  ]
  public_subnets = [
    cidrsubnet(var.cidr_block, 8, 4),
    cidrsubnet(var.cidr_block, 8, 5),
    cidrsubnet(var.cidr_block, 8, 6)
  ]



}


