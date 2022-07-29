variable "project_name" {
  type    = string
  default = "terraform-registry"
}

variable "region" {
  type        = string
  description = "region to deploy to"
  default     = "us-east-1"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

