variable "identity_provider" {
  description = "The URL of the identity provider."
  type        = string
  default     = "https://token.actions.githubusercontent.com"
}

variable "github_cert_url" {
  description = "The URL of the Github Certification URL."
  type        = string
  default     = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

variable "audience" {
  description = "A list of client IDs (also know as an audience)."
  type        = list(string)
  default     = ["sts.amazonaws.com"]
}

variable "managed_policy_arns" {
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role."
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
}

variable "github_org_name" {
  description = "Name of the Github Organisation and Github Repository where the Github Actions will be triggered. (eg. octo-org/octo-repo)"
  type        = string
  default     = "VFS-Digital-Channels/static-ui-cicd-test"
}

