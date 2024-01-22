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
  default     = "us-east-1"
}
variable "access_key" {
  description = "My Access Key"
  type        = string
  default     = "AKIASIXATL7Y4ROGZ32F"
}

variable "secret_key" {
  description = "My Secret Key"
  type        = string
  default     = "SrHRb/8RJkkH+9QxQ037Zyw4PbJakiAbzbhwBTx3"
}
