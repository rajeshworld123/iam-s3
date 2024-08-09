output "iam_role_name" {
  value = aws_iam_role.dev_s3_access_role.name
}

output "iam_policy_arn" {
  value = aws_iam_policy.dev_s3_access_policy.arn
}
