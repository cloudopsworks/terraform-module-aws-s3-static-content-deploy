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

resource "aws_s3_object" "this" {
  for_each = fileset(var.absolute_path, "**")
  bucket   = data.aws_s3_bucket.this.bucket
  key      = try(var.s3.prefix, "") != "" ? format("%s/%s", var.s3.prefix, each.value) : each.value
  source   = "${var.absolute_path}/${each.value}"
  etag     = filemd5("${var.absolute_path}/${each.value}")
}