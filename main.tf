terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "test-tf-state-container"    # your bucket
    key    = "tl-state/terraform.tfstate" # your key
    region = "af-south-1"
  }
}

provider "aws" {
  region = "af-south-1"
}
