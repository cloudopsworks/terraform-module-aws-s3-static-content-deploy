##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

variable "s3" {
  description = "S3 configuration for the project for deploying the application and storing the state file."
  type = any
  default = {}
}

variable "repository_owner" {
  description = "The owner of the repository where the application code is stored. This is used for setting up GitHub Actions workflows."
  type = string
}

variable "release" {
  description = "The release name of the application."
  type = string
}

variable "absolute_path" {
  description = "The absolute path to the project directory. This is used for setting up GitHub Actions workflows."
  type = string
}