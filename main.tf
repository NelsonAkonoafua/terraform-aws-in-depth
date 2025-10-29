terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region

}


resource "aws_s3_bucket" "not-here" {
  bucket = "oppo-shop"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "not-here" {
  bucket = aws_s3_bucket.not-here.id

  block_public_acls       = false
  block_public_policy     = true
  ignore_public_acls      = false
  restrict_public_buckets = false
}

module "s3_bucket_object" {
  source      = "git::https://github.com/NelsonAkonoafua/terraform_aws_modules.git//modules/s3_bucket_object?ref=main"
  count       = 1
  bucket_name = var.bucket_name
  region      = var.region
  env         = var.env
  file_path   = "${path.module}/files/index.html"
  file_key    = "index.html"
}
