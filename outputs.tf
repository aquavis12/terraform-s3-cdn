output "arn" {
  description = "ARN of the Bucket"
  value       = aws_s3_bucket.s3bucket1.arn
}

output "ID" {
  description = "Id of the Bucket"
  value       = aws_s3_bucket.s3bucket1.id
}

output "domain" {
  description = "domain of the bucket"
  value       = aws_s3_bucket.s3bucket1.bucket_regional_domain_name
}

output "cdnarn" {
  description = "Cloudfront arn"
  value       = aws_cloudfront_origin_access_identity.s3cdn.iam_arn
}

