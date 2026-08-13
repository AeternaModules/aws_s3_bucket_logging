variable "s3_bucket_loggings" {
  description = <<EOT
Map of s3_bucket_loggings, attributes below
Required:
    - bucket
    - target_bucket
    - target_prefix
Optional:
    - expected_bucket_owner
    - region
    - target_grant (block):
        - grantee (required, block):
            - email_address (optional)
            - id (optional)
            - type (required)
            - uri (optional)
        - permission (required)
    - target_object_key_format (block):
        - partitioned_prefix (optional, block):
            - partition_date_source (required)
        - simple_prefix (optional, block):
EOT

  type = map(object({
    bucket                = string
    target_bucket         = string
    target_prefix         = string
    expected_bucket_owner = optional(string)
    region                = optional(string)
    target_grant = optional(list(object({
      grantee = object({
        email_address = optional(string)
        id            = optional(string)
        type          = string
        uri           = optional(string)
      })
      permission = string
    })))
    target_object_key_format = optional(object({
      partitioned_prefix = optional(object({
        partition_date_source = string
      }))
      simple_prefix = optional(object({
      }))
    }))
  }))
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

