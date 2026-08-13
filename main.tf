resource "aws_s3_bucket_logging" "s3_bucket_loggings" {
  for_each = var.s3_bucket_loggings

  bucket                = each.value.bucket
  target_bucket         = each.value.target_bucket
  target_prefix         = each.value.target_prefix
  expected_bucket_owner = each.value.expected_bucket_owner
  region                = each.value.region

  dynamic "target_grant" {
    for_each = each.value.target_grant != null ? each.value.target_grant : []
    content {
      grantee {
        email_address = target_grant.value.grantee.email_address
        id            = target_grant.value.grantee.id
        type          = target_grant.value.grantee.type
        uri           = target_grant.value.grantee.uri
      }
      permission = target_grant.value.permission
    }
  }

  dynamic "target_object_key_format" {
    for_each = each.value.target_object_key_format != null ? [each.value.target_object_key_format] : []
    content {
      dynamic "partitioned_prefix" {
        for_each = target_object_key_format.value.partitioned_prefix != null ? [target_object_key_format.value.partitioned_prefix] : []
        content {
          partition_date_source = partitioned_prefix.value.partition_date_source
        }
      }
      dynamic "simple_prefix" {
        for_each = target_object_key_format.value.simple_prefix != null ? [target_object_key_format.value.simple_prefix] : []
        content {
        }
      }
    }
  }
}

