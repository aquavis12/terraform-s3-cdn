locals {
  s3_origin_id = "myS3Origin"
}

// to create the cloudfront origin access identity for the s3 bucket 
resource "aws_cloudfront_origin_access_identity" "s3cdn" {
  provider = aws
  comment  = "cf for s3 bucket"

}

resource "aws_cloudfront_distribution" "myCDN" {
  provider = aws

  origin {
    domain_name = aws_s3_bucket.s3bucket1.bucket_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.s3cdn.cloudfront_access_identity_path
    }

  }
  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3000
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "IN"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

}