#provider "aws" {
#  region  = var.aws_region
#  profile = var.aws_profile  # Only if you're using a specific profile
#}
provider "aws" {
    profile = "terraform"
    region = "eu-central-1"
}
module "iam" {
  source          = "./modules/iam"
  iam_role_name   = var.iam_role_name
  s3_bucket_arn   = module.s3.s3_bucket_arn
}

module "s3" {
  source = "./modules/s3"
}

output "bucket_name" {
  value = module.s3.bucket_name
}

output "iam_role_arn" {
  value = module.iam.role_arn
}
output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}