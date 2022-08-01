terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
  
}

terraform {
  cloud {
    organization = "makenzi-prod"

    workspaces {
      name = "test"
    }
  }
}

  
variable "environment" {
    type        = string
    description = "environment to deploy to"
    default     = "dev"
  
}
