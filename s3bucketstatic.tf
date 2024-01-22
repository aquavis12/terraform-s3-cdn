provider "aws" {
  region     = var.Region_aws
  access_key = var.access_key
  secret_key = var.secret_key
}

// this block of code is used to create a s3 bucket and tag
resource "aws_s3_bucket" "s3bucket1" {
  bucket        = var.bucket_name
  tags          = var.tags
  force_destroy = true
}

// to enable the public access
resource "aws_s3_bucket_public_access_block" "publicaccessenable" {
  bucket = aws_s3_bucket.s3bucket1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

//this makes enable versioning
resource "aws_s3_bucket_versioning" "versioning_enabling" {
  bucket = aws_s3_bucket.s3bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}

// static web hosting 
# resource "aws_s3_bucket_website_configuration" "webconfig" {
#   bucket = aws_s3_bucket.s3bucket1.id

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "error.html"
#   }

# }


resource "aws_s3_bucket_policy" "publicbucketpolicy" {
  bucket = aws_s3_bucket.s3bucket1.id
  policy = data.aws_iam_policy_document.publicbucketpolicy.json
}

data "aws_iam_policy_document" "publicbucketpolicy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.s3cdn.iam_arn]
    }

    actions = [
      "s3:GetObject",
    ]
    resources = [
      "arn:aws:s3:::vishnubucket2024/*",
    ]

  }
}
