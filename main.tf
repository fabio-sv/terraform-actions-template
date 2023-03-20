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

# resource "aws_iam_role" "test_role" {
#   name = "TestRole"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.x	
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   tags = {
#     tag-key = "tag-value"
#   }
# }
