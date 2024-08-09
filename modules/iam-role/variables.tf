variable "iam_role_name" {
    description = "iam role name for dev-s3"
    type = string
  
}
variable "iam_policy_name" {
    description = "iam policy name for dec-s3"
    type = string
  
}
variable "bucket_name" {
    description = "alice core dev s3"
    type = string
}
variable "assume_role_service" {
    description = "assume role service"
    type = string
  
}
variable "s3_bucket_arn" {
    description = "s3 bucket arm"
    type = string
  
}