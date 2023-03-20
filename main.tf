terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "" # your bucket
    key    = "" # your key
    region = "af-south-1"
  }
}

provider "aws" {
  region = "af-south-1"
}
