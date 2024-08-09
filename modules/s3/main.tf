resource "aws_s3_bucket" "dev_s3" {
  bucket = var.bucket_name
  tags = {
    Name        = "Alice-Core"
    Environment = "Dev"
  }
}
resource "aws_kms_key" "s3_kms_key" {
  description             = "KMS key for S3 server-side encryption"
  deletion_window_in_days = 10
}
#resource "aws_s3_bucket_acl" "dev_s3_acl" {
#  bucket = aws_s3_bucket.dev_s3.id
#  acl    = "private"
#}
resource "aws_s3_bucket_versioning" "dev_s3_versioning" {
  bucket = aws_s3_bucket.dev_s3.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "dev_s3_object_lock" {
  bucket = aws_s3_bucket.dev_s3.id
    rule {
      default_retention {
        mode  = "GOVERNANCE"  # or "COMPLIANCE"
        days  = 1825
      }
    }
  }
  resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.dev_s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_policy" "documents_policy" {
  bucket = aws_s3_bucket.dev_s3.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.iam_role_arn
        }
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = [
          "${aws_s3_bucket.dev_s3.arn}",
          "${aws_s3_bucket.dev_s3.arn}/*"
        ]
      }
    ]
  })
}