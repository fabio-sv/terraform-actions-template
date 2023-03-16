terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "af-south-1"
  access_key = ""
  secret_key = ""
}

data "tls_certificate" "thumbprint" {
  url = var.github_cert_url
}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = var.audience
  thumbprint_list = [data.tls_certificate.thumbprint.certificates[0].sha1_fingerprint]
  url             = var.identity_provider
}

resource "aws_iam_role" "github_assume_role_trust_relationship" {
  name                = "GithubActionsAssumeRole"
  managed_policy_arns = var.managed_policy_arns

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Federated = aws_iam_openid_connect_provider.oidc_provider.id
        },
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
          },
          StringLike = {
            "token.actions.githubusercontent.com:sub" : "repo:${var.github_org_name}:ref:refs/heads/main"
          }
        }
      }
    ]
  })
}
