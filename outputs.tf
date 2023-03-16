output "role_name" {
  description = "Name of the IAM Role."
  value       = aws_iam_role.github_assume_role_trust_relationship.name
}
