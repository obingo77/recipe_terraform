<<<<<<< HEAD
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
=======
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
  #profile = "terraform"


}
>>>>>>> aa55691268ffdfb8d00930844341ee7e24c9483a
