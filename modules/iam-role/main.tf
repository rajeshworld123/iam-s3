resource "aws_iam_role" "dev_s3_access_role" {
    name = var.iam_role_name
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}
resource "aws_iam_policy" "dev_s3_access_policy" {
      name        = "${var.iam_role_name}-s3-access"
      description = "S3 access policy for the application role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = [
          var.s3_bucket_arn,
          "${var.s3_bucket_arn}/*"
        ]
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "dev_s3_policy_attachment" {
  role       = aws_iam_role.dev_s3_access_role.name
  policy_arn = aws_iam_policy.dev_s3_access_role.arn
}