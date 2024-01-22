variable "bucket_name" {
  description = "Name of the S3 Bucket and make sure its unique"
  type        = string
}

variable "tags" {
  description = "Tags to set on buckets"
  type        = map(string)
  default = {
  }
}
variable "Region_aws" {
  description = "Name your aws region "
  type        = string
}
variable "access_key" {
  description = "My Access Key"
  type        = string
}

variable "secret_key" {
  description = "My Secret Key"
  type        = string
}
