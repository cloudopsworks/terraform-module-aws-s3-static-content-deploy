##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

data "aws_s3_bucket" "this" {
  bucket = var.s3.bucket_name
}

module "dir" {
  source   = "hashicorp/dir/template"
  version  = "1.0.2"
  base_dir = var.absolute_path
}

resource "aws_s3_object" "this" {
  for_each     = module.dir.files
  bucket       = data.aws_s3_bucket.this.bucket
  key          = try(var.s3.prefix, "") != "" ? format("%s/%s", var.s3.prefix, each.key) : each.key
  source       = each.value.source_path
  etag         = each.value.digests.md5
  content_type = each.value.content_type
}