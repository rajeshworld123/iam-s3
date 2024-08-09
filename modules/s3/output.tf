output "bucket_name" {
  value = aws_s3_bucket.dev_s3.bucket
}
output "s3_bucket_arn" {
  value = aws_s3_bucket.dev_s3.arn
}
output "s3_bucket_id" {
  value = aws_s3_bucket.dev_s3.id
}
#output "iam_role_name" {
# value = aws_iam_role.s3_access_role.name
#}

#output "kms_key_id" {
#  value = aws_kms_key.s3_kms_key.id
#}