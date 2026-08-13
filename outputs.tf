output "s3_bucket_loggings_id" {
  description = "Map of id values across all s3_bucket_loggings, keyed the same as var.s3_bucket_loggings"
  value       = { for k, v in aws_s3_bucket_logging.s3_bucket_loggings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "s3_bucket_loggings_bucket" {
  description = "Map of bucket values across all s3_bucket_loggings, keyed the same as var.s3_bucket_loggings"
  value       = { for k, v in aws_s3_bucket_logging.s3_bucket_loggings : k => v.bucket if v.bucket != null && length(v.bucket) > 0 }
}
output "s3_bucket_loggings_expected_bucket_owner" {
  description = "Map of expected_bucket_owner values across all s3_bucket_loggings, keyed the same as var.s3_bucket_loggings"
  value       = { for k, v in aws_s3_bucket_logging.s3_bucket_loggings : k => v.expected_bucket_owner if v.expected_bucket_owner != null && length(v.expected_bucket_owner) > 0 }
}
output "s3_bucket_loggings_region" {
  description = "Map of region values across all s3_bucket_loggings, keyed the same as var.s3_bucket_loggings"
  value       = { for k, v in aws_s3_bucket_logging.s3_bucket_loggings : k => v.region if v.region != null && length(v.region) > 0 }
}
output "s3_bucket_loggings_target_bucket" {
  description = "Map of target_bucket values across all s3_bucket_loggings, keyed the same as var.s3_bucket_loggings"
  value       = { for k, v in aws_s3_bucket_logging.s3_bucket_loggings : k => v.target_bucket if v.target_bucket != null && length(v.target_bucket) > 0 }
}
output "s3_bucket_loggings_target_grant" {
  description = "Map of target_grant values across all s3_bucket_loggings, keyed the same as var.s3_bucket_loggings"
  value       = { for k, v in aws_s3_bucket_logging.s3_bucket_loggings : k => v.target_grant if v.target_grant != null && length(v.target_grant) > 0 }
}
output "s3_bucket_loggings_target_object_key_format" {
  description = "Map of target_object_key_format values across all s3_bucket_loggings, keyed the same as var.s3_bucket_loggings"
  value       = { for k, v in aws_s3_bucket_logging.s3_bucket_loggings : k => v.target_object_key_format if v.target_object_key_format != null && length(v.target_object_key_format) > 0 }
}
output "s3_bucket_loggings_target_prefix" {
  description = "Map of target_prefix values across all s3_bucket_loggings, keyed the same as var.s3_bucket_loggings"
  value       = { for k, v in aws_s3_bucket_logging.s3_bucket_loggings : k => v.target_prefix if v.target_prefix != null && length(v.target_prefix) > 0 }
}

