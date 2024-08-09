variable "region" {
    description = "default region"
    type = string
    default = "eu-central-1"
  
}
variable "profile" {
    description = "aws profile"
    type = string
    default = "terraform"
  
}
variable "bucket_name" {
    description = "s3 bucket"
    type = string
    default = "alice-core-dev-documents"
  
}
variable "kms_key_id" {
    description = "kms key id for server side encryption"
    type = string
  
}
variable "iam_role_name" {
    description = "default region"
    type = string
  
}
variable "aws_profile" {
    description = "aws profile"
    type = string
    default = "terraform"
  
}