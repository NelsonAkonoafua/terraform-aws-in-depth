variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
  default = "oppo-shop"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "file_path" {
  type        = string
  description = "Path to the file to upload"
  default = "~../files/index.html"
}

variable "file_key" {
  type        = string
  description = "Object key (file name in bucket)"
  default    = "index.html"
}
